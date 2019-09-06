<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<title>帐号管理</title>
	<%@ include file="/WEB-INF/common/jqgrid.jsp" %>
	<script type="text/javascript" src="${ctx }/static/data/account/distribRole.js"></script>
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#loginName").focus();
			//active tab
			$("#user-tab").addClass("active");
			//为inputForm注册validate函数
			$("#inputForm").validate({
			
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					if ( element.is(":checkbox") )
						error.appendTo ( element.parent().next() );
					else
						error.insertAfter( element );
				}
			});
		});
	</script>
</head>

<body style="padding-left: 20px;">

	<fieldset>
			<legend><small>分配角色</small></legend>
			<h5>当前用户：${user.name }</h5>已分配的角色：<span id="viewName">${roleNames }</span>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
       <input type="hidden" name="roleNames" value="${roleNames }">
        <form action="" id="inputForm">
             <input type="hidden" name="userId" value="${user.id }">
             <input type="hidden" name="roleIds" value="${roleIds }">
             <input type="hidden" name="oldroleIds" value="${roleIds }">
             
          </form>
        <table id="contentTable"></table>
		<div id="pjqgajax"></div>
       
</fieldset>
</body>
</html>
