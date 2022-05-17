<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/26
  Time: 21:28
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
    </style>
</head>
<body>
<div class="container">
    <div>
        <span class="glyphicon glyphicon-chevron-left" style="float: left;margin-top: 20px;cursor: pointer" aria-hidden="true" id="returnPre"></span>
        <h3 style="text-align: center;margin-bottom: 40px;" id="identity" title="${sessionScope.user_login.u_identity}">部门列表</h3>
    </div>
    <form class="form-inline" style="text-align: center" id="form1">
        <div class="form-group">
            <label for="d_id">id</label>
            <input type="text" class="form-control" id="d_id" name="d_id">
        </div>
        <div class="form-group">
            <label for="d_name">部门名称</label>
            <input type="text" class="form-control" id="d_name" name="d_name">
        </div>
        <button type="button" onsubmit="return false" id="search1" class="btn btn-primary">查询</button>
    </form>
    <div>
        <div class="text-center" style="margin-top: 10px;margin-bottom: 10px">
            <a href="addDepart.jsp" class="btn btn-primary" id="addDepartment">添加部门</a>
            <a href="javascript:void(0)" class="btn btn-primary" id="deleteSelected1">删除选中</a>
        </div>
    </div>
    <table class="table table-bordered" id="tb">
        <thead>
        <tr class="bg-primary">
            <td><input type="checkbox" id="firstCb"></td>
            <td>部门编号</td>
            <td>部门名称</td>
            <td>部门电话</td>
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
            共<span id="totalCount"></span>条记录
        </p>
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
    function getDepart(args) {
        $.ajax({
            url:"depart/showDepart",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            type:"get",
            data: $("#form1").serialize(),
            success:function (data) {
                console.log(data);
                let str=``;
                if(data.list.length==0){
                    $("#tb tbody").html(str);
                    $("#currentPage").text(data.pageNum);
                    $("#totalCount").text(data.total);
                    $("#totalPage").text(data.pages);
                }else{
                    for (let i = 0; i < data.list.length; i++) {
                        str += "<tr><td>" + `<input type="checkbox" name='d_id' class="d_ids" value="` + data.list[i].d_id + `">` + "</td><td>" + data.list[i].d_id + "</td><td>" + data.list[i].d_name + "</td><td>"+ data.list[i].d_phone + "</td><td>" + `<button class="btn btn-success" onclick=update(` + data.list[i]["d_id"] + `) id='update'>修改</button>&nbsp;&nbsp;&nbsp;&nbsp;
<button class="btn btn-danger" onclick='delete1(` + data.list[i]["d_id"] + `)' id='delete'>删除</button>
` + "</td></tr>";
                        $("#tb tbody").html(str);
                        $("#currentPage").text(data.pageNum);
                        $("#totalCount").text(data.total);
                        $("#totalPage").text(data.pages);
                    }
                }
            }
        })
    }
    let args = $("#form1").serialize();
    getDepart(args);

    //返回上一页
    $("#returnPre").click(function () {
        window.location.href="homepage.jsp";
    })

    //删除部门
    function delete1(d_id) {
        if(parseInt($("#identity").attr("title"))===1){
            if(confirm("确定要删除吗?")){
                $.ajax({
                    url:"depart/deleteDepart",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    type:"get",
                    data:{"d_id":d_id},
                    success:function (data) {
                        console.log(data);
                        getDepart();
                    }
                })
            }
        }else{
            alert("您不是管理员,不能进行该操作");
        }

    }
    function update(d_id) {
        window.location.href = "updateDepart.jsp?d_id="+d_id;
        /*if(parseInt($("#identity").attr("title"))==1){

        }else {
            alert("您不是管理员,不能进行该操作");
        }*/
    }

    //全选
    document.getElementById("firstCb").onclick = function () {
        let d_ids = document.getElementsByClassName("d_ids");
        for (let i = 0; i < d_ids.length; i++) {
            d_ids[i].checked = this.checked;
        }
    }

    //模糊查询
    $("#search1").click(function () {
        let args = $("#form1").serialize();
        console.log(args);
        getDepart(args);
    })

    //删除选中
    $("#deleteSelected1").click(function () {
        if(confirm("确定删除吗?")){
            let d_ids = $(".d_ids");
            let flag = false;
            d_ids.each(function () {
                if($(this).is(":checked")){
                    flag = true;
                }
            })
            if(flag){
                let args = $(".d_ids").serialize();
                $.get("depart/deleteSelected",args,function (data) {
                    getDepart();
                })
            }
        }
    })

    //权限设置,普通用户不能进行修改 删除 等操作
    if(parseInt($("#identity").attr("title"))!==1){
        $("#deleteSelected1").addClass("disabled");
        $("#addDepartment").addClass("disabled");
    }



</script>
</body>
</html>

