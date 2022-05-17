<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/28
  Time: 19:33
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <style>

        #tb {
            margin: 0 auto;
            border-collapse: collapse;
            text-align: center;
            margin-top: 10px;
        }

        th, td {
            border: 1px solid black;
        }
        .form-inline .form-control {
            width: 396px;
        }
    </style>
</head>
<body>

<div class="container">
    <div >
        <span class="glyphicon glyphicon-chevron-left" style="float: left;margin-top: 20px;cursor: pointer" aria-hidden="true" id="returnPre"></span>
        <h3 style="text-align: center;margin-bottom: 40px;" id="identity" title="${sessionScope.user_login.u_identity}">招聘申请</h3>
    </div>
    <form class="form-inline" style="text-align: center" id="form1">
        <div class="form-group">
            <label for="condition"></label>
            <input type="text" class="form-control" id="condition" name="condition" placeholder="可查询职位名称、所在部门、工作经验、性别要求任意字段">
        </div>
        <button type="button" onsubmit="return false" id="search1" class="btn btn-primary">查询</button>
    </form>
    <div>
        <div class="text-center" style="margin-top: 10px;margin-bottom: 10px">
            <a href="addRecruit.jsp" class="btn btn-primary" id="addRecruit">新增招聘</a>
            <a href="javascript:void(0)" class="btn btn-primary" id="deleteSelected1">删除选中招聘</a>

        </div>
    </div>
    <table class="table table-bordered" id="tb">
        <thead>
        <tr class="bg-primary">
            <td><input type="checkbox" id="firstCb"></td>
            <td>编号</td>
            <td>职位名称</td>
            <td>招聘人数</td>
            <td>所在部门</td>
            <td>工作经验</td>
            <td>性别要求</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody class="bg-warning">

        </tbody>

    </table>


</div>




<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<script src="js/jquery-3.4.1.js"></script>
<script>

    function getData() {
        $.ajax({
            url: "recruit/selectAll",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            type: "get",
            success: function (data) {
                var str;
                if(data.length == 0){
                    $("tbody").html(str);
                }else{
                    for (let i = 0; i < data.length; i++) {
                        str += "<tr><td>" + `<input type="checkbox" name='r_id' class="r_ids" value="` + data[i].r_id + `">` + "</td><td>" + data[i].r_id + "</td><td>" + data[i].r_position + "</td><td>" + data[i].r_count + "</td><td>" + data[i].d_name + "</td><td>" + data[i].r_experience + "</td><td>" + data[i].r_gender + "</td><td>" + `<button class="btn btn-success" onclick=update(` + data[i]["r_id"] + `)>修改</button>&nbsp;&nbsp;&nbsp;&nbsp;
<button class="btn btn-warning" onclick='detail(` + data[i]["r_id"] + `)'>查看详细信息</button>&nbsp;&nbsp;&nbsp;&nbsp;
<button class="btn btn-danger" onclick='delete1(` + data[i]["r_id"] + `)'>删除</button>
` + "</td></tr>";
                        $("tbody").html(str);
                    }
                }
            }
        })
    }

    getData();


    function detail(r_id) {
        window.location.href = "recruitDetail.jsp?r_id=" + r_id;
    }

    function delete1(r_id) {
        if(parseInt($("#identity").attr("title"))===1){
            if (confirm("确定要删除吗?")) {
                $.ajax({
                    url: "recruit/deleteRecruit",
                    contentType: "application/json,charset=utf-8",
                    dataType: "json",
                    data: {"r_id": r_id},
                    type: "get",
                    success: function (data) {
                        getData();
                    }
                })
            }
        }else{
            alert("您不是管理员,不能进行该操作");
        }
    }

    function update(r_id) {
        if(parseInt($("#identity").attr("title"))===1){
            window.location.href = "updateRecruit.jsp?r_id=" + r_id;
        }else{
            alert("您不是管理员,不能进行该操作");
        }

    }


    //全选
    document.getElementById("firstCb").onclick = function () {
        let r_ids = document.getElementsByName("r_id");
        for (let i = 0; i < r_ids.length; i++) {
            r_ids[i].checked = this.checked;
        }
    }
    //进行批量删除
    $("#deleteSelected1").click(function () {
        let r_ids = $('input[class="r_ids"]');
        let flag = false;
        r_ids.each(function () {
            if ($(this).is(":checked")) {
                flag = true;
            }
        })
        if (flag) {
            if (confirm("确定删除选中的?")) {
                let args = $(".r_ids").serialize();
                console.log(args);
                $.post("recruit/deleteSelected", args, function (data) {
                    if (data) {
                        getData();
                    }
                })
            }
        }
    })

    //权限设置,普通用户不能进行修改 删除 等操作
    if(parseInt($("#identity").attr("title"))!==1){
        $("#deleteSelected1").addClass("disabled");
        $("#addRecruit").addClass("disabled");
    }

    $("#returnPre").click(function () {
        window.location.href="homepage.jsp";
    })

    //搜索
    $("#search1").click(function () {
        $.ajax({
            url:"recruit/search",
            contentType:"application/json;charset=utf-8",
            dataType:"json",
            data: $("#form1").serialize(),
            success:function (data) {
                var str = ``;
                if(data.length == 0){
                    $("tbody").html(str);
                }else {
                    for (let i = 0; i < data.length; i++) {
                        str += "<tr><td>" + `<input type="checkbox" name='r_id' class="r_ids" value="` + data[i].r_id + `">` + "</td><td>" + data[i].r_id + "</td><td>" + data[i].r_position + "</td><td>" + data[i].r_count + "</td><td>" + data[i].d_name + "</td><td>" + data[i].r_experience + "</td><td>" + data[i].r_gender + "</td><td>" + `<button class="btn btn-success" onclick=update(` + data[i]["r_id"] + `)>修改</button>&nbsp;&nbsp;&nbsp;&nbsp;
<button class="btn btn-warning" onclick='detail(` + data[i]["r_id"] + `)'>查看详细信息</button>&nbsp;&nbsp;&nbsp;&nbsp;
<button class="btn btn-danger" onclick='delete1(` + data[i]["r_id"] + `)'>删除</button>
` + "</td></tr>";
                        $("tbody").html(str);
                    }
                }
            }
        })
    })
</script>

</body>
</html>

