<%--
  Created by IntelliJ IDEA.
  User: ZeDongW
  Date: 2020/4/30 0030
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>地区选择</title>
    <script type="text/javascript" src="js/getAjax.js"></script>
    <style type="text/css">
        .red{
            font-size: 20px;
            color: red;
        }
    </style>
</head>
<body>
    <div style="text-align: center">
        省份<select id="province" >
            <option>请选择省份</option>
            <option>湖北</option>
            <option>广东</option>
        </select>&nbsp;&nbsp;&nbsp;&nbsp;
        城市<select id="city" >
        <option>请选择城市</option>
    </select>
    </div>
    <script type="text/javascript">


        document.getElementById("province").onchange = function () {
            let province = this.value;
            if ("请选择省份" == province){
                return;
            }
            let city = document.getElementById("city");
            city.options.length=1;
            //获取ajax对象
            let ajax = getAjax();
            let method = "POST";
            let url = "${pageContext.request.contextPath}/provinceCitySelected";
            ajax.open(method,url);
            ajax.setRequestHeader("content-type","application/x-www-form-urlencoded;charset=UTF-8");
            let context = "province=" + province;
            ajax.send(context);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4){
                    if (ajax.status == 200){
                        let citiesXml = ajax.responseXML;
                        let cities = citiesXml.getElementsByTagName("city");
                        for (let i=0; i <cities.length; i=i+1){
                           let option = document.createElement("option");
                           option.innerText = cities[i].firstChild.nodeValue;
                           city.appendChild(option);
                        }
                    }
                }
            }
        }

    </script>
</body>
</html>
