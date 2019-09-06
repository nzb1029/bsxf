<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<title>帐号管理</title>
	<%@ include file="/WEB-INF/common/jqgrid.jsp" %>
	<script type="text/javascript" src="${ctx }/static/data/account/distribUser.js"></script>
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
			<legend><small>分配用户</small></legend>
			<h5>当前角色：${role.roleName }</h5>已分配的用户：<span id="viewName">${userNames }</span>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
       <input type="hidden" name="userNames" value="${userNames }">
        <form action="" id="inputForm">
             <input type="hidden" name="roleId" value="${role.id }">
             <input type="hidden" name="userIds" value="${userIds }">
             <input type="hidden" name="olduserIds" value="${userIds }">
             
          </form>
        <table id="contentTable"></table>
		<div id="pjqgajax"></div>
       
</fieldset>
</body>
</html>
