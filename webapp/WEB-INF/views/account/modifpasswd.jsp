<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
	<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>帐号管理</title>
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#name").focus();
			$("#inputForm").validate({
				rules: {
					oldplainPassword: {
						remote: "${ctx}/account/user/checkPasswd"
					}
				}, 
				messages: {
					oldplainPassword: {
						remote: "旧密码不正确"
					},
					passwordConfirm: {
						equalTo: "输入与上面相同的密码"
					}
				},
				 submitHandler:function(){
				       // var formData = $("#inputForm").serializeObject();
					    $.ajax({
					        url:$("#inputForm").attr("action"),
					        data:{passwd:$("#password").val()},
					        type:"POST",
					        success:function(){
					           api.close();
					           W.alert("修改密码成功");
					        }
					     });
					 
				 } 
			});			
		});
		
		function okFunc(){
		   $("#submitBtn").click();return false;
		}
	</script>
</head>

<body style="width: 400px;">
 
 
	<fieldset >
			<legend><small>用户密码修改</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="user" action="${ctx}/account/user/savemodify" method="post" class="form-horizontal">
		
		<table class="inputView" style="width: 400px;">
			<tr>
				<td class="left">旧密码:</td>
				<td class="right"><input type="password" name="oldplainPassword" size="40" id="oldplainPassword" value="" class="required" /></td>
			</tr>
			 <tr>
				<td class="left">新密码:</td>
				<td class="right"><input type="password" id="password" name="plainPassword" size="40" value="" minlength="3"  class="required"/></td>
			</tr>
			<tr>
				<td class="left">确认密码:</td>
				<td class="right"><input type="password" id="passwordConfirm" name="passwordConfirm" size="40" value="" equalTo="#password"  class="required"/>
				</td>
			</tr>
			 
	 <tr>
				<td colspan="2"   class="bottom">
				     <input class="btn btn-primary" style="display: none;" id="submitBtn" type="submit" value="提交"/>&nbsp;
					 
				</td>
			</tr>
	 </table>
	</form:form>
</fieldset>
</body>
</html>
