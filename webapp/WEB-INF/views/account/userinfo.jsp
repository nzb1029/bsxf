<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
	<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#name").focus();
			$("#add").click(function(){
			       $.dialog({
			          id: 'LHG1976D1',
			          content: 'url:'+ctx+'/account/user/modifpasswd',
			          lock:true,
			          title: '修改密码',
			          height:300,
			          width:500,
			          ok:function(){return this.content.okFunc();},
			          init:function(){},
				      cancel: true
                      }); 
			
			}); 
		 
			
		});
	</script>
</head>

<body>
 <div class="mtoolBar">
	<ul>
	 
	<li auth="user:edit">
		<span class="out1">
		<img src="${ctx}/static/img/toolbar/16x16/icon_add.png"></span>
		 <input    type="button" class="buttonRight"   id="add" value="修改密码"  >
	</li>
	
	
	</ul>
	</div>
	<c:if test="${not empty message}">
		<div id="message"   class="alert alert-success">
		<button data-dismiss="alert" class="close">×</button>
		<span id="message_div">${message}</span></div>
	</c:if>
	<fieldset >
			<legend><small>用户基本信息</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="user" action="${ctx}/account/user/saveinfo" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${user.id}"/>
		<input type="hidden" name="loginName" size="40" id="loginName" value="${user.loginName}"  />
		<table class="inputView" style="width: 800px;">
			<tr>
				<td class="left">登录名:</td>
				<td class="right">${user.loginName}</td>
			</tr>
			<tr>
				<td class="left">用户名:</td>
				<td class="right"><input type="text" id="name" name="name" size="40" value="${user.name}" class="required"/></td>
			</tr>
			<!--<tr>
				<td class="left">密码:</td>
				<td class="right"><input type="password" id="password" name="plainPassword" size="40" value="" minlength="3"/></td>
			</tr>
			<tr>
				<td class="left">确认密码:</td>
				<td class="right"><input type="password" id="passwordConfirm" name="passwordConfirm" size="40" value="" equalTo="#password"/>
				</td>
			</tr>
			--><tr>
				<td class="left">邮箱:</td>
				<td class="right"><input type="text" id="email" name="email" size="40" value="${user.email}"/></td>
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
