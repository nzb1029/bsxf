<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<title>帐号管理</title>
	<%@ include file="/WEB-INF/common/jqgrid.jsp" %>
	<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
	<script type="text/javascript" src="${ctx }/static/data/sys/dictionary.js"></script>
	
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
	 
	<li  >
		<span class="out1">
		<img src="${ctx}/static/img/toolbar/16x16/icon_add.png"></span>
	  <input onclick="window.location=ctx+'/config/dictionary/create';"  type="button" class="buttonRight"   id="create" value="添加字典"  >
		 
	</li>
	<li >
		<span class="out1">
		<img src="${ctx}/static/img/toolbar/16x16/icon_removes.png"></span>
		<input type="button"    onclick="batchDel();" class="buttonRight"   id="remove" value="批量删除">
		
	</li>
   
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
