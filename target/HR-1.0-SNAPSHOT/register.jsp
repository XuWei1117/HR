<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/30
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
</head>
<body>
<div class="container">
    <div class="col-md-4 col-md-offset-4">
        <h3 class="text-center">注册页面</h3>
        <form  method="post" id="form1">
            <div class="form-group">
                <label for="u_name" class="col-sm-4 control-label">
                    用户名
                </label>
                <input type="text" class="form-control" id="u_name" name="u_name" placeholder="用户名">
            </div>
            <div class="form-group">
                <label for="u_password" class="col-sm-2 control-label">
                    密码</label>
                <input type="password" class="form-control" id="u_password" name="u_password"
                       placeholder="密码">
            </div>
            <div class="form-group">
                <label for="u_password2" class="col-sm-4 control-label">
                    确认密码</label>
                <input type="password" class="form-control" id="u_password2" name="u_password2"
                       placeholder="密码">
            </div>
            <div class="form-inline">
                <label for="checkCode0">验证码</label>
                <input type="text" id="checkCode0" name="checkCode0" class="form-control">
                <a href="javascript:void (0)"><img src="" id="img-cc"  alt="验证码" title="点击刷新"></a>
            </div>
            <div style="text-align: center" style="margin-top: 20px">
                <button type="button" onsubmit="return false" class="btn btn-primary text-center" id="btn1">注册</button>
                <button type="reset" class="btn btn-primary text-center">重置</button>
                <button type="button" id="returnPre" class="btn btn-primary text-center">返回</button>
            </div>
        </form>
        <div class="alert alert-warning alert-dismissible" role="alert" style="margin-top: 40px">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong id="alert"></strong>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<script>
    window.onload = function () {
        document.getElementById("img-cc").src = "/hr/checkCodeServlet?time=" + new Date().getTime();
        document.getElementById("img-cc").onclick = function () {
            document.getElementById("img-cc").src = "/hr/checkCodeServlet?time=" + new Date().getTime();
        }
    }
    $(function () {
        $("#alert").text("请进行注册");
    })
    $("#btn1").click(function () {
        $.ajax({
            url:"user/register",
            contentType:"application/json;charset=utf-8",
            dataType:"json",
            data:$("#form1").serialize(),
            success:function (data) {
                console.log(data);
                if(data.flag){
                    $("#alert").text(data.msg);
                    setInterval(function () {
                        window.location.href = "homepage.jsp";
                    },3000)
                }else{
                    $("#alert").text(data.msg);
                }
            }
        })
    })

    //返回
    $("#returnPre").click(function () {
        window.history.go(-1);
    })
</script>
</body>
</html>
