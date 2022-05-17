<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/23
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button id="btn">按钮</button>
<script src="js/jquery-3.4.1.js"></script>
<script>
    $("#btn").click(function () {
        $.ajax({
            url: "employee/selectAll",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            type: "get",
            success: function (data) {
                console.log(data);
            }
        })
    })
</script>
</body>
</html>
