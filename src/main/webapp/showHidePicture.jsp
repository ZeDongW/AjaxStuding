<%--
  Created by IntelliJ IDEA.
  User: ZeDongW
  Date: 2020/5/14 0014
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示隐藏图片</title>
</head>
<body>
    <img src="${pageContext.request.contextPath}/image/lsh.jpg" id="imageID" height="200px" width="400px"/> <br>
    <input type="button" value="显示图片" id="showImg" style="position: absolute; top: 210px; left: 100px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="隐藏图片" id="hideImg" style="position: absolute; top: 210px; left: 200px;"/>&nbsp;&nbsp;&nbsp;&nbsp;

    <script type="text/javascript">
        let image = document.getElementById("imageID");
        let show = document.getElementById("showImg");
        let hide = document.getElementById("hideImg");
        show.onclick = function () {
            image.hidden = false;
        }
        hide.onclick = function () {
            image.hidden=true;

        }
    </script>
</body>
</html>
