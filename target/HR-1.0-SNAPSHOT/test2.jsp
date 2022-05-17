<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/28
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>My page</title>

    <!-- CSS dependencies -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

</head>
<body>

<p>Content here. <a class="show-alert" href=#>Alert!</a></p>

<!-- JS dependencies -->
<script src="js/jquery-3.4.1.js"></script>
<!-- Bootstrap 4 dependency -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

<!-- bootbox code -->
<script src="js/bootbox.js"></script>

<script>
    $(document).on("click", ".show-alert", function (e) {
        bootbox.alert("Hello world!", function () {
            console.log("Alert Callback");
        });
    });
</script>
</body>
</html>




