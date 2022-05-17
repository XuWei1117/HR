<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/29
  Time: 20:57
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
    <h3 style="text-align: center;margin-bottom: 30px">添加候选人</h3>
    <div class="col-md-6 col-md-offset-3">
        <form class="form-horizontal" id="form" action="candidate/addCandidate">
            <div class="form-group">
                <label for="c_id" class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <input type="hidden" class="form-control" id="c_id" name="c_id">
                </div>
            </div>
            <div class="form-group">
                <label for="c_name" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="c_name" name="c_name">
                </div>
            </div>

            <div class="form-group">
                <label for="c_gender" class="col-sm-2 control-label">性别</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="c_gender" name="c_gender">
                </div>
            </div>
            <div class="form-group">
                <label for="c_gender" class="col-sm-2 control-label">年龄</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="c_age" name="c_age">
                </div>
            </div>
            <div class="form-group">
                <label for="c_education" class="col-sm-2 control-label">学历</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="c_education" name="c_education">
                </div>
            </div>
            <div class="form-group">
                <label for="c_school" class="col-sm-2 control-label">毕业学校</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="c_school" name="c_school">
                </div>
            </div>
            <div class="form-group">
                <label for="c_departId" class="col-sm-2 control-label">应聘部门</label>
                <div class="col-sm-10">
                    <select name="c_departId" id="c_departId">
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
                <label for="c_card" class="col-sm-2 control-label">身份证号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="c_card" name="c_card">
                </div>
            </div>

            <div class="form-group">
                <label for="c_salary" class="col-sm-2 control-label">期望薪资</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="c_salary" name="c_salary">
                </div>
            </div>
            <div class="form-group">
                <label for="c_phone" class="col-sm-2 control-label">联系电话</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="c_phone" name="c_phone">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10" style="text-align: center">
                    <button type="submit" id="btn" class="btn btn-primary">保存</button>
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


    $("#returnPre").click(function () {
        window.history.go(-1);
    })
</script>
</body>
</html>
