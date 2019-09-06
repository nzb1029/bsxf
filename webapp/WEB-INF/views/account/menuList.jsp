<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<title>帐号管理</title>
	<%@ include file="/WEB-INF/common/jqgrid.jsp" %>
	<script type="text/javascript" src="${ctx }/static/data/account/menu.js"></script>
	
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#user-tab").addClass("active");
		});
	</script>
</head>

<body>
<div class="mtoolBar">
	<ul>
	<shiro:hasPermission name="menu:edit">
	<li auth="menu:edit">
		<span class="out1">
		<img src="${ctx}/static/img/toolbar/16x16/icon_add.png">	</span>
		 <input onclick="window.location=ctx+'/account/menu/create/0';"  type="button" class="buttonRight"   id="add" value="添加菜单"  >
		 
	
	</li>
	 
 </shiro:hasPermission>
	 </ul>
	</div>
	<c:if test="${not empty message}">
		<div id="message"   class="alert alert-success">
		<button data-dismiss="alert" class="close">×</button>
		<span id="message_div">${message}</span></div>
	</c:if>
	 <table id="contentTable"></table>
	<div id="pjqgajax"></div>
	
</body>
</html>
