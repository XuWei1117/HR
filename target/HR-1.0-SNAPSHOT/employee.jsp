<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/26
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="top.jsp" %>
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
            width: 130px;
        }
    </style>
</head>
<body>
<div class="container">
    <div>
        <span class="glyphicon glyphicon-chevron-left" style="float: left;margin-top: 20px;cursor: pointer" aria-hidden="true"
              id="returnPre"></span>
        <h3 style="text-align: center;margin-bottom: 40px;" id="identity" title="${sessionScope.user_login.u_identity}">
            员工列表</h3>
    </div>

    <form class="form-inline" style="text-align: center" id="form1">
        <div class="form-group">
            <label for="e_id">id:</label>
            <input type="text" class="form-control" id="e_id" name="e_id">
        </div>
        <div class="form-group">
            <label for="e_name">姓名:</label>
            <input type="text" class="form-control" id="e_name" name="e_name">
        </div>
        <div class="form-group">
            <label for="e_gender">性别:</label>
            <input type="text" class="form-control" id="e_gender" name="e_gender">
        </div>
        <div class="form-group">
            <label for="e_identity">员工类型:</label>
            <input type="text" class="form-control" id="e_identity" name="e_identity">
        </div>
        <button type="button" onsubmit="return false" id="search" class="btn btn-primary">查询</button>
    </form>
    <div>
        <div class="text-center" style="margin-top: 10px;margin-bottom: 10px">
            <a href="addEmployee.jsp" class="btn btn-primary" id="addDepartment">添加员工</a>
            <a href="javascript:void(0)" class="btn btn-primary" id="deleteSelected">删除选中</a>
<%--            <a href="" class="btn btn-primary" id="derive">导出</a>--%>
            <input type="file">
        </div>
    </div>
    <table id="tb" class="table table-bordered">
        <thead>
        <tr class="bg-primary">
            <td><input type="checkbox" id="allSelected"></td>
            <td>员工编号</td>
            <td>员工姓名</td>
            <td>性别</td>
            <td>年龄</td>
            <td>员工类型</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody class="bg-warning">

        </tbody>
    </table>
    <div style="text-align: center">
        <p class="bg-primary" style="font-size: 20px">
            第<span id="currentPage"></span>页,
            共<span id="totalPage"></span>页,
            共<span id="totalCount"></span>条记录,
            每页<span id="pageSize"></span>条记录
        </p>
    </div>
    <div id="rowPage" style="margin-bottom: 10px;text-align: center;margin-top: 10px">
        <button class="btn btn-primary" id="prePage" type="button" onsubmit="return false">上一页</button>
        <button class="btn btn-primary" id="nextPage" type="button" onsubmit="return false">下一页</button>

    </div>

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
        $.get("/hr/employee/selectAll", args, function (data) {
            var str = ``;
            if (data.employees.length == 0) {
                $("#tb tbody").html(str);
            } else {
                for (let i = 0; i < data.employees.length; i++) {
                    str += "<tr><td>" + `<input type="checkbox" name='e_id' class="e_ids" value="` + data.employees[i].e_id + `">` + "</td><td>" + data.employees[i].e_id + "</td><td>" + data.employees[i].e_name + "</td><td>" + data.employees[i].e_gender + "</td><td>" + data.employees[i].e_age + "</td><td>" + data.employees[i].e_identity + "</td><td>" + `<button class="btn btn-success" onclick=update(` + data.employees[i]["e_id"] + `)>修改</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-info" onclick=detail(` + data.employees[i]["e_id"] + `)>查看详细信息</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-warning returnFull" onclick=full(` + data.employees[i]["e_id"] + `)>转正</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-danger" onclick='delete1(` + data.employees[i]["e_id"] + `)'>解聘</button>`
                        + "</td></tr>";
                    $("#tb tbody").html(str);
                }
            }
            $("#currentPage").text(data.pageNum);
            $("#totalPage").text(data.pages);
            $("#totalCount").text(data.total);
            $("#pageSize").text(data.pageSize);
            if (data.pageNum == 1) {
                $("#prePage").addClass("disabled");
            } else {
                $("#prePage").removeClass("disabled");
            }
            if (data.pageNum == data.pages) {
                $("#nextPage").addClass("disabled");
            } else {
                $("#nextPage").removeClass("disabled");
            }
        }, "json")
    }

    getData();


    function delete1(e_id) {
        if (parseInt($("#identity").attr("title")) === 1) {
            if (confirm("确定要删除吗?")) {
                $.ajax({
                    url: "employee/deleteEmployee",
                    contentType: "application/json,charset=utf-8",
                    dataType: "json",
                    data: {"e_id": e_id},
                    type: "get",
                    success: function (data) {
                        getData();
                    }
                })
            }
        } else {
            window.alert("您不是管理员,不能进行该操作")
        }
    }

    function update(e_id) {
        if (parseInt($("#identity").attr("title")) === 1) {
            window.location.href = "updateEmployee.jsp?e_id=" + e_id;
        } else {
            window.alert("您不是管理员,不能进行该操作")
        }

    }

    function detail(e_id) {
        window.location.href = "detail.jsp?e_id=" + e_id;
    }


    $("#search").click(function () {
        let args = $("#form1").serialize();
        getData(args);
    })

    //全选
    document.getElementById("allSelected").onclick = function () {
        let e_ids = document.getElementsByName("e_id");
        for (let i = 0; i < e_ids.length; i++) {
            e_ids[i].checked = this.checked;
        }
    }
    //进行批量删除
    $("#deleteSelected").click(function () {
        let e_ids = $('input[class="e_ids"]');
        let flag = false;
        e_ids.each(function () {
            if ($(this).is(":checked")) {
                flag = true;
            }
        })
        if (flag) {
            if (confirm("确定删除选中的?")) {
                let args = $(".e_ids").serialize();
                console.log(args);
                $.post("employee/deleteSelected", args, function (data) {
                    console.log(data);
                    if (data) {
                        getData();
                    }
                })
            }
        }

    })

    $("#returnPre").click(function () {
        window.location.href = "homepage.jsp";
    })

    //转正
    function full(e_id) {
        if (parseInt($("#identity").attr("title")) == 1) {
            $.ajax({
                url: "employee/returnFull",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: {"e_id": e_id},
                success: function (data) {
                    getData();
                }
            })
        } else {
            window.alert("您不是管理员,不能进行该操作")
        }

    }

    if (parseInt($("#identity").attr("title")) !== 1) {
        $("#addDepartment").addClass("disabled");
        $("#deleteSelected").addClass("disabled");
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


</script>
</body>
</html>
