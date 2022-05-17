<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/29
  Time: 19:55
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
    <style>

        *{
            padding: 0;
            margin: 0;
        }
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
            width: 279px;
        }
    </style>
</head>
<body>
<div class="container">
    <div>
        <span class="glyphicon glyphicon-chevron-left" style="float: left;margin-top: 20px;cursor: pointer" aria-hidden="true"
              id="returnPre"></span>
        <h3 style="text-align: center;margin-bottom: 40px;" id="identity" title="${sessionScope.user_login.u_identity}">候选人列表</h3>
    </div>

    <form class="form-inline" style="text-align: center" id="form1">
        <div class="form-group">
            <label for="condition"></label>
            <input type="text" class="form-control" id="condition" name="condition" placeholder="可查询、姓名、年龄、应聘部门字段">
        </div>
        <button type="button" onsubmit="return false" id="search" class="btn btn-primary">查询</button>
    </form>
    <div>
        <div class="text-center" style="margin-top: 10px;margin-bottom: 10px">
            <a href="addCandidate.jsp" class="btn btn-primary" id="addCandidate">添加候选人</a>
            <a href="javascript:void(0)" class="btn btn-primary" id="deleteSelected">删除选中</a>
        </div>
    </div>
    <table id="tb" class="table table-bordered">
        <thead>
        <tr class="bg-primary">
            <td><input type="checkbox" id="allSelected"></td>
            <td>id</td>
            <td>姓名</td>
            <td>性别</td>
            <td>年龄</td>
            <td>应聘部门</td>
            <td>期望薪资</td>
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
    /*----------------------下面是员工表的-----------------------------------*/
    function getData(args) {
        $.get("candidate/selectAll", args, function (data) {
            var str = ``;
           if(data.length == 0){
               $("#tb tbody").html(str);
           }else{
               for (let i = 0; i < data.length; i++) {
                   str += "<tr><td>" + `<input type="checkbox" name='c_id' class="c_ids" value="` + data[i].c_id + `">` + "</td><td>" + data[i].c_id + "</td><td>" + data[i].c_name + "</td><td>" + data[i].c_gender + "</td><td>" + data[i].c_age + "</td><td>" + data[i].d_name + "</td><td>" + data[i].c_salary + "</td><td>" + `<button class="btn btn-success" onclick=update(` + data[i]["c_id"] + `)>修改</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-info" onclick=detail(` + data[i]["c_id"] + `)>查看详细信息</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-warning" onclick='employee(` + data[i]["c_id"] + `)'>录用</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-danger" onclick='delete1(` + data[i]["c_id"] + `)'>去除</button>`
                       + "</td></tr>";
                   $("#tb tbody").html(str);
               }
           }
        }, "json")
    }

    getData();

    function delete1(c_id) {
        if(parseInt($("#identity").attr("title"))===1){
            if (confirm("确定要删除吗?")) {
                $.ajax({
                    url: "candidate/deleteCandidate",
                    contentType: "application/json,charset=utf-8",
                    dataType: "json",
                    data: {"c_id": c_id},
                    type: "get",
                    success: function (data) {
                        getData();
                    }
                })
            }
        }else{
            window.alert("您不是管理员,不能进行该操作");
        }
    }

    function update(c_id) {
        if(parseInt($("#identity").attr("title"))===1){
            window.location.href = "updateCandidate.jsp?c_id=" + c_id;
        }else{
            window.alert("您不是管理员,不能进行该操作");
        }

    }

    function detail(c_id) {
        window.location.href = "detailCandidate.jsp?c_id=" + c_id;
    }


    $("#search").click(function () {
        let args = $("#form1").serialize();
        $.get("candidate/search", args, function (data) {
            var str = ``;
            if(data.length == 0){
                $("#tb tbody").html(str);
            }else{
                for (let i = 0; i < data.length; i++) {
                    str += "<tr><td>" + `<input type="checkbox" name='c_id' class="c_ids" value="` + data[i].c_id + `">` + "</td><td>" + data[i].c_id + "</td><td>" + data[i].c_name + "</td><td>" + data[i].c_gender + "</td><td>" + data[i].c_age + "</td><td>" + data[i].d_name + "</td><td>" + data[i].c_salary + "</td><td>" + `<button class="btn btn-success" onclick=update(` + data[i]["c_id"] + `)>修改</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-info" onclick=detail(` + data[i]["c_id"] + `)>查看详细信息</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-warning" onclick='employee(` + data[i]["c_id"] + `)'>录用</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-danger" onclick='delete1(` + data[i]["c_id"] + `)'>去除</button>`
                        + "</td></tr>";
                    $("#tb tbody").html(str);
                }
            }
        }, "json")

    })

    //全选
    document.getElementById("allSelected").onclick = function () {
        let c_ids = document.getElementsByName("c_id");
        for (let i = 0; i < c_ids.length; i++) {
            c_ids[i].checked = this.checked;
        }
    }
    //进行批量删除
    $("#deleteSelected").click(function () {
        let c_ids = $('input[class="c_ids"]');
        let flag = false;
        c_ids.each(function () {
            if ($(this).is(":checked")) {
                flag = true;
            }
        })
        if (flag) {
            if (confirm("确定删除选中的?")) {
                let args = $(".c_ids").serialize();
                console.log(args);
                $.post("candidate/deleteSelected", args, function (data) {
                    console.log(data);
                    if (data) {
                        getData();
                    }
                })
            }
        }
    })

    $("#returnPre").click(function () {
        window.location.href="homepage.jsp";
    })

    //录用
    function employee(c_id) {
        if(parseInt($("#identity").attr("title"))===1){
            window.location.href = "hire.jsp?c_id=" + c_id;
        }else{
            window.alert("您不是管理员,不能进行该操作");
        }
    }


    $("#prePage").click(function () {
        let currentPage = parseInt($("#currentPage").text()) - 1;
        let args = $("#e_id,#e_name,#e_gender,#e_identity").serialize() + `&currentPage=` + currentPage;
        getData(args);
    })
    $("#nextPage").click(function () {
        let currentPage = parseInt($("#currentPage").text()) + 1;
        console.log(currentPage);
        let args = $("#e_id,#e_name,#e_gender,#e_identity").serialize() + `&currentPage=` + currentPage;
        getData(args);
    })


    //权限设置,普通用户不能进行修改 删除 等操作
    if(parseInt($("#identity").attr("title"))!==1){
        $("#deleteSelected").addClass("disabled");
        $("#addCandidate").addClass("disabled");
    }
</script>
</body>
</html>
