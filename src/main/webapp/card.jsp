<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/18
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <link rel="stylesheet" href="css/shubiao.css">
    <script src="js/shubiao.js"></script>
    <link rel="stylesheet" href="css/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>

</head>
<body>
<div class="container">
    <div class="col-md-4 col-md-offset-4">
        <div class="box login" style="text-align: center">
            <div class="form-content">
                <div class="avtar">
                    <div class="pic"><img src="images/a.jpg" alt=""></div>
                    <h1>Welcome back</h1>
                    <div class="col-md-8 col-md-offset-2">
                        <form action="emp/log" method="post">
                            <div class="form-group">
                                <label for="e_name" class="col-sm-2 control-label">
                                    <i class="fa fa-user-o fa-2x"></i></label>
                                </label>
                                <input type="text" class="form-control" id="e_name" name="e_name" placeholder="用户名">
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">
                                    <i class="fa fa-lock fa-2x"></i></label>
                                <input type="password" class="form-control" id="password" name="e_password"
                                       placeholder="密码">
                            </div>
                            <div class="form-group">
                                <label for="checkCode0" class="col-sm-2 control-label">
                                    <i class="fa fa-key fa-2x"></i>
                                </label>
                                <input type="text" class="form-control" id="checkCode0" name="checkCode0" placeholder="验证码">
                                <a href="javascript:void (0)" ><img src="" style="margin-top: 10px" alt="验证码" id="img-cc1" title="点击刷新"></a>
                            </div>
                            <div class="form-group">
                                <div>
                                    <button type="submit" class="btn btn-primary" id="btn1">Login</button>
                                </div>
                            </div>
                        </form>
                        <p id="msg">返回的信息${requestScope.msg}</p>
                    </div>
                    <div class="row col-md-10 col-md-offset-1">
                        <h4>Don't have an account?<span class="signup_btn" style="color: #3399ff">signup</span></h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="box signup" style="text-align: center">
            <div class="form-content">
                <div class="avtar">
                    <div class="pic"><img src="images/b.jpg" alt=""></div>
                    <h1>Welcome back</h1>
                    <div class="col-md-8 col-md-offset-2">
                        <form action="employee/register" method="post">
                            <div class="form-group">
                                <label for="e_name" class="col-sm-2 control-label">
                                    <i class="fa fa-user-o fa-2x"></i></label>
                                </label>
                                <input type="text" class="form-control" id="e_name1" name="e_name" placeholder="用户名">
                            </div>
                            <div class="form-group">
                                <label for="e_password1" class="col-sm-2 control-label">
                                    <i class="fa fa-lock fa-2x"></i></label>
                                <input type="password" class="form-control" id="e_password1" name="e_password"
                                       placeholder="密码">
                            </div>
                            <div class="form-group">
                                <label for="checkCode1" class="col-sm-2 control-label">
                                    <i class="fa fa-key fa-2x"></i>
                                </label>
                                <input type="text" class="form-control" id="checkCode1" name="checkCode1" placeholder="验证码">
                                <a href="javascript:void (0)" ><img src="" style="margin-top: 10px" alt="验证码" id="img-cc" title="点击刷新"></a>
                            </div>
                            <div class="form-group">
                                <div>
                                    <button type="submit" class="btn btn-primary">Sign up</button>
                                </div>
                            </div>
                        </form>

                    </div>
                    <div class="row col-md-10 col-md-offset-1">
                        <h4>Already have an account?<span class="login_btn" style="color: #3399ff">login</span></h4>
                    </div>
                </div>
            </div>
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
        document.getElementById("img-cc1").src = "/hr/checkCodeServlet?time=" + new Date().getTime();
        document.getElementById("img-cc1").onclick = function () {
            document.getElementById("img-cc1").src = "/hr/checkCodeServlet?time=" + new Date().getTime();
        }
        let login = document.querySelector(".login");
        let signup = document.querySelector(".signup");
        let login_btn = document.querySelector(".login_btn");
        let signup_btn = document.querySelector(".signup_btn");

        signup_btn.addEventListener("click", () => {
            login.style.transform = "rotateY(180deg)"
            signup.style.transform = "rotateY(0deg)";
        })
        login_btn.addEventListener("click", () => {
            login.style.transform = "rotateY(0deg)"
            signup.style.transform = "rotateY(-180deg)";
        })
    }



</script>
</body>
</html>
