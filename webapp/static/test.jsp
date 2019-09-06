<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.bsxf.EquipmentManager"%>
<%@page import="org.springside.web.SpringContextHolder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
EquipmentManager eqManager = SpringContextHolder.getBean(EquipmentManager.class);
eqManager.updateKLEquipmentII();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"> 
<%@ page contentType="text/html;charset=UTF-8" %>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springside.org.cn/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static-content?contentPath="/>

<link href="${ctx}/static/jquery-validation/1.9.0/validate.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/bootstrap/2.1.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />

<script src="${ctx}/static/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
 <script src="${ctx}/static/jquery.json-2.2.js" type="text/javascript"></script>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <script type="text/javascript">
   $.ajax({
			url:"http://admin:12345678@58.215.3.70:8001/ISAPI/Security/userCheck",
			dataType: 'xml',
			success:function(d){
			 	//jQGridSupport.reloadGrid(ggridId);
			 	//alert("删除成功");
			}
			
			
		}).fail(function(e) { alert($.toJSON(e)); });
  
 </script>
  </body>
</html>
