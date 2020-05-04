<%--
  Created by IntelliJ IDEA.
  User: ZeDongW
  Date: 2020/5/4 0004
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>验证码</title>
    <link href="css/boby.css" rel="stylesheet" />
    <script type="text/javascript" src="js/getAjax.js"></script>
</head>
<body>
    <form id="formID">
        <div class="checkCode">验证码：<input id="inputID" name="checkCode" style="width: 40px" maxlength="4"/><img src="image/checkCodeImage.jsp"  id="img" onclick="codeChange()"><a href="#" onclick="codeChange()">换一张?</a></div>
        <image src="" id="result" class="result"/>
    </form>
    <script type="text/javascript">
        let result = document.getElementById("result");
        let inputid = document.getElementById("inputID");
        function codeChange(){
            let img = document.getElementById("img");
            img.src = "image/checkCodeImage.jsp?" + new Date();
            inputid.value = "";
            result.src = "";
            result.style = "";
        }
        inputid.onkeyup = function () {
            result.src = "";
            result.style = "";
            let code = this.value;
            if (code.length == 4){
                let ajax = getAjax();
                let method = "POST";
                let url = "${pageContext.request.contextPath}/checkCode?time = " + new Date().getTime();
                ajax.open(method, url);
                ajax.setRequestHeader("content-type","application/x-www-form-urlencoded;charset=UTF-8");
                let context = "code=" + code;
                ajax.send(context);
                ajax.onreadystatechange = function () {
                    if (ajax.readyState == 4){
                        if (ajax.status == 200){
                            let image = ajax.responseText;
                            result.src = image;
                            result.style = "width: 40px; height:20px";

                        }
                    }
                }
            }
        }
    </script>
</body>
</html>
