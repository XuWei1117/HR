<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/22
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" href="css/shubiao.css">
    <script src="js/shubiao.js"></script>
    <style>
        .btn-primary {
            color: #fff;
            background-color: #337ab7;
            border-color: #2e6da4;
            font-size: 30px;
            width: 470px;
        }
        .btn1{
            margin-bottom: 20px;
        }
    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>

</head>
<body>
<div class="container">
    <h2 style="text-align: center;margin-bottom: 40px">HR人力资源管理系统</h2>
    <div class="text-center" style="margin-top: 20px;margin-bottom: 20px;font-size: 20px">
        <div class="btn1">
            <a href="employee.jsp" class="btn btn-primary" style="font-size: 25px">员工管理</a>
        </div>
        <div class="btn1">
            <a href="department.jsp" class="btn btn-primary" style="font-size: 25px">部门管理</a>
        </div>
        <div class="btn1">
            <a href="recruit.jsp" class="btn btn-primary" style="font-size: 25px">招聘管理</a>
        </div>
        <div class="btn1">
            <a href="candidate.jsp" class="btn btn-primary" style="font-size: 25px">候选人管理</a>
        </div>

    </div>



</div>


<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<script src="js/jquery-3.4.1.js"></script>

</body>
</html>
