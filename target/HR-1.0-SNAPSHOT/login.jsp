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
            margin-top: 30px;
        }
    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
</head>
<body>

<div class="container">
    <div class="col-md-4 col-md-offset-4">
        <h3 class="text-center">登录</h3>
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
            <div class="form-inline">
                <label for="checkCode0">验证码</label>
                <input type="text" id="checkCode0" name="checkCode0" class="form-control">
                <a href="javascript:void (0)"><img src="" id="img-cc"  alt="验证码" title="点击刷新"></a>
            </div>
            <div style="text-align: center" style="margin-top: 20px">
                <button type="button" onsubmit="return false" class="btn btn-primary text-center" id="btn1">登录</button>
                <button type="reset" class="btn btn-primary text-center">重置</button>
                <button type="button" id="register" class="btn btn-primary text-center">去注册</button>
            </div>
        </form>
        <div class="alert alert-warning alert-dismissible" role="alert" style="margin-top: 40px">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong id="alert"></strong>
        </div>
    </div>

</div>
<script src="./js/jquery-3.4.1.js"></script>
<script>
    window.onload = function () {
        document.getElementById("img-cc").src = "/hr/checkCodeServlet?time=" + new Date().getTime();
        document.getElementById("img-cc").onclick = function () {
            document.getElementById("img-cc").src = "/hr/checkCodeServlet?time=" + new Date().getTime();
        }
    }
    $(function () {
        $("#alert").text("未登录,请先登录");
    })
    $("#btn1").click(function (){
        let args = $("#form1").serialize();
        console.log(args);
        $.ajax({
            url:"user/log",
            data:$("#form1").serialize(),
            type:"post",
          /*  contentType:"application/json;charset=utf-8",*/
            dataType:"json",
            success:function (data) {
                console.log(data);
                if(data.flag){
                    window.location.href = "homepage.jsp";
                }else{
                    $("#alert").text(data.msg);
                }
            }
        })
    })
    $("#register").click(function () {
        window.location.href = "register.jsp";
    })

</script>
</body>
</html>