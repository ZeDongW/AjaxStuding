<%--
  Created by IntelliJ IDEA.
  User: ZeDongW
  Date: 2020/5/5 0005
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>省份城市区域下拉框三级联动</title>
    <script type="text/javascript" src="js/getAjax.js"></script>
</head>
<body>
    <select name="province" id="provinceID" >
        <option>请选择省份</option>
        <option>湖北</option>
        <option>广东</option>
        <option>云南</option>
    </select>
    <select name="city" id="city" >
        <option>请选择城市</option>
    </select>
    <select name="area" id="area" >
        <option>请选择区域</option>
    </select>
    <script type="text/javascript">
        let provinceElem = document.getElementById("provinceID");
        let cityElem = document.getElementById("city");
        let areaElem = document.getElementById("area");
        provinceElem.onchange = function () {
            let province = this.value;
            if ("请选择省份" != province){
                cityElem.options.length = 1;
                areaElem.options.length = 1;
                let ajax = getAjax();
                let method = "POST";
                let url = "${pageContext.request.contextPath}/select_province?time=" + new Date().getTime();
                ajax.open(method, url);
                ajax.setRequestHeader("content-type","application/x-www-form-urlencoded;charset=UTF-8");
                let context = "bean.province=" + province;
                ajax.send(context);
                ajax.onreadystatechange = function () {
                    if (ajax.readyState == 4){
                        if (ajax.status == 200){
                            let javaJSON = ajax.responseText;
                            let jsJSON = eval("(" + javaJSON + ")");
                            let cityList = jsJSON.cityList;
                            for (let i=0;i<cityList.length;i++){
                                let optionElement = document.createElement("option");
                                optionElement.innerHTML=cityList[i];
                                cityElem.appendChild(optionElement);
                            }
                        }
                    }
                }
            }
        }
        cityElem.onchange = function () {
            let city = this.value;
            if ("请选择城市" != city){
                areaElem.options.length = 1;
                let ajax = getAjax();
                let method = "POST";
                let url = "${pageContext.request.contextPath}/select_city?time=" + new Date().getTime();
                ajax.open(method, url);
                ajax.setRequestHeader("content-type","application/x-www-form-urlencoded;charset=UTF-8");
                let context = "bean.city=" + city;
                ajax.send(context);
                ajax.onreadystatechange = function () {
                    if (ajax.readyState == 4){
                        if (ajax.status == 200){
                            let javaJSON = ajax.responseText;
                            let jsJSON = eval("(" + javaJSON + ")");
                            let areaList = jsJSON.areaList;
                            for (let i=0;i<areaList.length;i++){
                                let optionElement = document.createElement("option");
                                optionElement.innerHTML=areaList[i];
                                areaElem.appendChild(optionElement);
                            }
                        }
                    }
                }
            }
        }
    </script>
</body>
</html>
