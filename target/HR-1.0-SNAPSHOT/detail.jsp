<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/28
  Time: 10:04
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center;margin-bottom: 30px">查看员工信息</h3>
    <div class="col-md-6 col-md-offset-3">
        <form class="form-horizontal" id="form">
            <div class="form-group">
                <label for="e_id" class="col-sm-2 control-label">编号</label>
                <div class="col-sm-10">
                    <input type="text" readonly=readonly class="form-control" id="e_id" name="e_id">
                </div>
            </div>
            <div class="form-group">
                <label for="e_name" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="e_name" name="e_name">
                </div>
            </div>

            <div class="form-group">
                <label for="e_age" class="col-sm-2 control-label">年龄</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="e_age" name="e_age">
                </div>
            </div>
            <div class="form-group">
                <label for="e_gender" class="col-sm-2 control-label">性别</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="e_gender" name="e_gender">
                </div>
            </div>
            <div class="form-group">
                <label for="e_education" class="col-sm-2 control-label">学历</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="e_education" name="e_education">
                </div>
            </div>
            <div class="form-group">
                <label for="e_school" class="col-sm-2 control-label">毕业学校</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="e_school" name="e_school">
                </div>
            </div>
            <div class="form-group">
                <label for="e_start" class="col-sm-2 control-label">入职时间</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="e_start" name="e_start">
                </div>
            </div>
            <div class="form-group">
                <label for="d_name" class="col-sm-2 control-label">所在部门</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="d_name" name="d_name">
                </div>
            </div>
            <div class="form-group">
                <label for="e_phone" class="col-sm-2 control-label">联系电话</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="e_phone" name="e_phone">
                </div>
            </div>
            <div class="form-group">
                <label for="e_card" class="col-sm-2 control-label">身份证号</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="e_card" name="e_card">
                </div>
            </div>
            <div class="form-group">
                <label for="e_identity" class="col-sm-2 control-label">员工类型</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="e_identity" name="e_identity">
                </div>
            </div>
            <div class="form-group">
                <label for="e_salary" class="col-sm-2 control-label">薪资</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="e_salary" name="e_salary">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10" style="text-align: center">
                    <button class="btn btn-primary" type="button" id="returnPre">返回</button>
                </div>
            </div>
            <div style="text-align: center">
                <p id="msg"></p>
            </div>
        </form>
    </div>
</div>
<script src="js/jquery-3.4.1.js"></script>
<script>
    $(function () {
        let args = window.location.href.split("?")[1];
        let e_id = args.split("=")[1];
        $.ajax({
            url: "employee/selectById",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            data: {"e_id": e_id},
            type: "get",
            success: function (data) {
                console.log(data);
                $("#e_id").val(data.e_id);
                $("#e_name").val(data.e_name);
                $("#e_gender").val(data.e_gender);
                $("#e_age").val(data.e_age);
                $("#e_education").val(data.e_education);
                $("#e_school").val(data.e_school);
                $("#e_start").val(data.e_start);
                $("#d_name").val(data.d_name);
                $("#e_phone").val(data.e_phone);
                $("#e_card").val(data.e_card);
                $("#e_identity").val(data.e_identity);
                $("#e_salary").val(data.e_salary);

            }
        })
    })

    $("#returnPre").click(function () {
        window.history.go(-1);
    })
</script>
</body>
</html>
