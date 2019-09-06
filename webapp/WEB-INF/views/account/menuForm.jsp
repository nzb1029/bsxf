<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<title>帐号管理</title>
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

<body>

	<fieldset>
			<legend><small>管理菜单</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="menu" action="${ctx}/account/menu/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${menu.id}"/>
		<input type="hidden" name="oldParentId" value="${menu.parentId}"/>
		<input type="hidden" name="menuId" value="${menu.menuId}"/>
		<table class="inputView" style="width: 800px;">
			<tr>
				<td class="left">菜单名:</td>
				<td class="right"><input type="text" name="menuName" size="40" id="name" value="${menu.menuName}" class="required"/></td>
			</tr>
			<tr>
				<td class="left">链接:</td>
				<td class="right"><input type="text" name="link" size="40" id="link" value="${menu.link}" /></td>
			</tr>
			<tr>
				<td class="left">父菜单:</td>
				<td class="right">
				<form:select path="parentId"  >
					<form:option value="1" label="--请选择--"/>  
            		<form:options items="${allMenus}" itemValue="id" itemLabel="menuName"/>
				</form:select>
				
				</td>
			</tr>
			<tr>
				<td class="left">排序:</td>
				 
				<td class="right"><input type="text" name="sortNo" size="40" id="sortNo" value="${menu.sortNo}" /></td>
			 
			</tr>
		<tr>
				<td colspan="2"   class="bottom">
					 	<input class="btn btn-primary" type="submit" value="提交"/>&nbsp;
					 
					<input  class="btn" type="button" value="返回" onclick="history.back()"/>
				</td>
			</tr>
		</table>
	</form:form>
</fieldset>
</body>
</html>
