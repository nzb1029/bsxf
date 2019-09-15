<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>巡检结束</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="${ctx}/static/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctx}/static/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body class="panel-body">
<form id="resultForm" modelAttribute="checkResult" action="${ctx}/history/submitResult" method="post">
    <div class="panel panel-default">
        <div class="panel-heading">本次操作结束</div>
        <div class="panel-body">
            <label>${submitCheckResult}</label>
        </div>
    </div>
</form>
</body>
</html>
