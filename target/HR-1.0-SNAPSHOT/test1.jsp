<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/28
  Time: 21:37
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
</head>
<body>
<button id="btn1">新增</button>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="myModalLabel">新增</h4>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <label for="txt_departmentname">部门名称</label>
                    <input type="text" name="txt_departmentname" class="form-control" id="txt_departmentname"
                           placeholder="部门名称">
                </div>
                <div class="form-group">
                    <label for="txt_parentdepartment">上级部门</label>
                    <input type="text" name="txt_parentdepartment" class="form-control" id="txt_parentdepartment"
                           placeholder="上级部门">
                </div>
                <div class="form-group">
                    <label for="txt_departmentlevel">部门级别</label>
                    <input type="text" name="txt_departmentlevel" class="form-control" id="txt_departmentlevel"
                           placeholder="部门级别">
                </div>
                <div class="form-group">
                    <label for="txt_statu">描述</label>
                    <input type="text" name="txt_statu" class="form-control" id="txt_statu" placeholder="状态">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><span
                        class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
                </button>
                <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span
                        class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
                </button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<script>


    $("#btn1").click(function () {
        $('#myModal').modal();
    })

</script>
</body>
</html>
