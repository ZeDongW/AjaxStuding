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
    <title>register</title>
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
        用户名(Get请求)：<input name="userName" id="inputGet"/><span id="tipGet"></span><br>
        用户名(Post请求)：<input name="userName" id="inputPost"/><span id="tipPost"></span><br>
    </div>
    <script type="text/javascript">


        document.getElementById("inputGet").onblur = function () {
            let userName = this.value;
            let spanElementGet = document.getElementById("tipGet");
            spanElementGet.innerHTML = '';
            if (userName == "" || userName.trim() == ""){
                spanElementGet.innerHTML = "<span class='red'>用户名不能为空</span>";
                return;
            }
            //获取ajax对象
            let ajax = getAjax();
            let method = "GET";
            let url = "${pageContext.request.contextPath}/userImageRegister?userName=" + userName;
            ajax.open(method,url);
            ajax.send();
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4){
                    if (ajax.status == 200){
                        let tip = ajax.responseText;
                        spanElementGet.innerHTML = tip;
                    }
                }
            }
        }

        document.getElementById("inputPost").onblur = function () {
            let userName = this.value;
            let spanElementPost = document.getElementById("tipPost");
            spanElementPost.innerHTML = '';
            if (userName == "" || userName.trim() == ""){
                spanElementPost.innerHTML = "<span class='red'>用户名不能为空</span>";
                return;
            }
            //获取ajax对象
            let ajax = getAjax();
            let method = "POST";
            let url = "${pageContext.request.contextPath}/userImageRegister";
            ajax.open(method,url);
            ajax.setRequestHeader("content-type","application/x-www-form-urlencoded;charset=UTF-8");
            let context = "userName=" + userName;
            ajax.send(context);
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4){
                    if (ajax.status == 200){
                        let tip = ajax.responseText;
                        spanElementPost.innerHTML = tip;
                    }
                }
            }
        }
    </script>
</body>
</html>
