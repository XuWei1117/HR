<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/17
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>success.jsp</title>
    <style>

    </style>
</head>
<body>
<h2>访问成功  model返回的信息为:${requestScope.msg}  session${sessionScope.msg} </h2>

<h1>${requestScope.list}</h1>
<c:forEach items="${list}" var="depart" >
    <table>
        <td>
            <tr>部门编号</tr>
            <tr>部门名称</tr>
            <tr>部门经理</tr>
            <tr>部门电话</tr>
        </td>
        <td>
            <tr>${depart.d_id}</tr>
            <tr>${depart.d_name}</tr>
            <tr>${depart.d_manager}</tr>
            <tr>${depart.d_phone}</tr>
        </td>
    </table>
</c:forEach>
</body>
</html>
