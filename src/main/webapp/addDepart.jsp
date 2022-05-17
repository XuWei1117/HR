<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/27
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="top.jsp"%>
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
</head>
<body>
<div class="container">
    <div class="col-md-6 col-md-offset-3">
        <h3 style="text-align: center;margin-bottom: 20px">添加部门</h3>
        <form class="form-horizontal" action="depart/addDepart" method="post">
            <div class="form-group">
                <label for="d_name" class="col-sm-2 control-label">部门名称</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="d_name" name="d_name">
                </div>
            </div>
            <div class="form-group">
                <label for="d_phone" class="col-sm-2 control-label">部门电话</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="d_phone" name="d_phone">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10" style="text-align: center">
                    <button class="btn btn-primary" type="text">提交</button>
                    <button class="btn btn-primary" type="reset">重置</button>
                    <button class="btn btn-primary" type="button" id="returnPre">返回</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="js/jquery-3.4.1.js"></script>
<script>
    $("#returnPre").click(function () {
        window.history.go(-1);
    })
</script>
</body>
</html>