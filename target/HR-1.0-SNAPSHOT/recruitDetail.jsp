<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/29
  Time: 14:16
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
    <h3 style="text-align: center;margin-bottom: 30px">招聘详情</h3>
    <div class="col-md-6 col-md-offset-3">
        <form class="form-horizontal" id="form">
            <div class="form-group">
                <label for="r_id" class="col-sm-2 control-label">编号</label>
                <div class="col-sm-10">
                    <input type="text" readonly=readonly class="form-control" id="r_id" name="r_id">
                </div>
            </div>
            <div class="form-group">
                <label for="r_position" class="col-sm-2 control-label">职位名称</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="r_position" name="r_position">
                </div>
            </div>

            <div class="form-group">
                <label for="r_count" class="col-sm-2 control-label">招聘人数</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="r_count" name="r_count">
                </div>
            </div>
            <div class="form-group">
                <label for="d_name" class="col-sm-2 control-label">所在部门</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="d_name" name="d_name">
                </div>
            </div>
            <div class="form-group">
                <label for="r_experience" class="col-sm-2 control-label">工作经验</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="r_experience" name="r_experience">
                </div>
            </div>
            <div class="form-group">
                <label for="r_gender" class="col-sm-2 control-label">性别要求</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="r_gender" name="r_gender">
                </div>
            </div>
            <div class="form-group">
                <label for="min_age" class="col-sm-2 control-label">最小年龄</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="min_age" name="min_age">
                </div>
            </div>
            <div class="form-group">
                <label for="max_age" class="col-sm-2 control-label">最大年龄</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="max_age" name="max_age">
                </div>
            </div>
            <div class="form-group">
                <label for="min_salary" class="col-sm-2 control-label">薪资最小</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="min_salary" name="min_salary">
                </div>
            </div>
            <div class="form-group">
                <label for="max_salary" class="col-sm-2 control-label">薪资最大</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="max_salary" name="max_salary">
                </div>
            </div>


            <div class="form-group">
                <label for="r_empId" class="col-sm-2 control-label">负责人</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" class="form-control" id="r_empId" name="r_empId">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10" style="text-align: center">
                    <button class="btn btn-primary" type="button" id="returnPre">返回</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<script>
    $(function () {
        let args=window.location.href.split("?")[1];
        $.get("recruit/selectById",args,function (data) {
            console.log(data);
            $("#r_id").val(data.r_id);
            $("#r_position").val(data.r_position);
            $("#r_count").val(data.r_count);
            $("#d_name").val(data.d_name);
            $("#r_experience").val(data.r_experience);
            $("#r_gender").val(data.r_gender);
            $("#min_age").val(data.min_age);
            $("#max_age").val(data.max_age);
            $("#min_salary").val(data.min_salary);
            $("#max_salary").val(data.max_salary);
            $("#r_empId").val(data.e_name);

        })
    })
    $("#returnPre").click(function () {
        window.history.go(-1);
    })
</script>
</body>
</html>
