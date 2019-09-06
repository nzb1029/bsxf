<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/WEB-INF/common/dztree.jsp" %>
<html>
<head>
	<title>角色管理</title>
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
	</script>
</head>

<body>

	<fieldset>
			<legend><small>管理角色</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="role" action="${ctx}/account/role/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${role.id}"/>
		<table class="inputView" style="width: 800px;">
			<tr>
				<td class="left"><span class="req">*</span>角色名:</td>
				<td class="right"><input type="text" name="roleName" size="40" id="roleName" value="${role.roleName}" class="required"/></td>
			</tr>
			<tr>
				<td class="left">别名:</td>
				<td class="right"><input type="text" name="alias" size="40" id="alias" value="${role.alias}"  /></td>
			</tr>
			<tr>
				<td class="left">说明:</td>
				<td class="right">
				<textarea style="width: auto;"    rows="5" cols="60" name="remark" >${role.remark }</textarea>
				</td>
			</tr>
			<tr>
			 <td colspan="2" class="bottom">
			 	<input  class="btn btn-primary" type="submit" value="提交"/>&nbsp;
			    <input  class="btn" type="button" value="返回" onclick="history.back()"/>
			 </td>
			</tr>
		</table>
	</form:form>
</fieldset>
</body>
</html>
