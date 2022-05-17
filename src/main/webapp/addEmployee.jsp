<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/23
  Time: 15:19
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
        <h3 style="text-align: center;margin-bottom: 20px">添加员工</h3>
        <form class="form-horizontal" action="employee/addEmployee" method="post">
            <div class="form-group">
                <label for="e_name" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="e_name" name="e_name">
                </div>
            </div>

            <div class="form-group">
                <label for="e_age" class="col-sm-2 control-label">年龄</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="e_age" name="e_age">
                </div>
            </div>
            <div class="form-group">
                <label for="e_gender" class="col-sm-2 control-label">性别</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="e_gender" name="e_gender">
                </div>
            </div>
            <div class="form-group">
                <label for="e_education" class="col-sm-2 control-label">学历</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="e_education" name="e_education">
                </div>
            </div>
            <div class="form-group">
                <label for="e_school" class="col-sm-2 control-label">毕业学校</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="e_school" name="e_school">
                </div>
            </div>
            <div class="form-group">
                <label for="e_start" class="col-sm-2 control-label">入职时间</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control" id="e_start" name="e_start">
                </div>
            </div>
            <div class="form-group">
                <label for="e_departId" class="col-sm-2 control-label">所在部门编号</label>
                <div class="col-sm-10">
                    <select name="e_departId" id="e_departId">
                        <option value="1">销售部</option>
                        <option value="2">策划部</option>
                        <option value="3">财务部</option>
                        <option value="4">开发部</option>
                        <option value="5">测试部</option>
                        <option value="6">运维部</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="e_phone" class="col-sm-2 control-label">联系电话</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="e_phone" name="e_phone">
                </div>
            </div>
            <div class="form-group">
                <label for="e_card" class="col-sm-2 control-label">身份证号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="e_card" name="e_card">
                </div>
            </div>
            <div class="form-group">
                <label for="e_identity" class="col-sm-2 control-label">员工类型</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="e_identity" name="e_identity">
                </div>
            </div>
            <div class="form-group">
                <label for="e_salary" class="col-sm-2 control-label">薪资</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="e_salary" name="e_salary">
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
