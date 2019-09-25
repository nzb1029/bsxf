<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="org.bsxf.web.LtSecurityUtils"%>
<%@page import="org.springside.mapper.JsonMapper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springside.org.cn/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static-content?contentPath="/>
<html>
<head>
    <title>巡检结束</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="${ctx}/static/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctx}/static/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body class="panel-body">
<form id="resultForm" modelAttribute="checkResult">
    <div class="panel panel-default">
        <div class="panel-heading">本次操作结束</div>
        <div class="panel-body">
            <label>${submitCheckResult}</label>
        </div>
    </div>
</form>
</body>
</html>
