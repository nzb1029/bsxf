<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/WEB-INF/common/lhgdialog.jsp" %>
<%@include file="/WEB-INF/common/calendar.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>用户管理</title>
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#loginName").focus();
			//active tab
			$("#user-tab").addClass("active");
			//为inputForm注册validate函数
			$("#inputForm").validate({
				rules: {
					loginName: {
						remote: "${ctx}/account/user/checkLoginName?oldLoginName=" + encodeURIComponent('${user.loginName}')
					},
					email: {
						remote: "${ctx}/account/user/checkEmail?oldEmail=" + encodeURIComponent('${user.email}')
					},
					phoneNo: {
						remote: "${ctx}/account/user/checkMobile?oldPhoneNo=" + encodeURIComponent('${user.phoneNo}')
					}
					,
					cardNo: {
						remote: "${ctx}/account/user/checkCarno?oldCardNo=" + encodeURIComponent('${user.cardNo}')
					}
				},
				messages: {
					loginName: {
						remote: "用户登录名已存在"
					},
					email: {
						remote: "邮箱已存在"
					},
					phoneNo: {
						remote: "手机已存在"
					},
					cardNo: {
						remote: "身份证号已存在"
					},
					passwordConfirm: {
						equalTo: "输入与上面相同的密码"
					}
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					if ( element.is(":checkbox") )
						error.appendTo ( element.parent().next() );
					else
						error.insertAfter( element );
				},
				submitHandler:function(){
			 	     $("#inputForm").ajaxSubmit({
			 	           success:function(){
					           tf=false;
					           W.afterSave();
					           api.close();
					          }
			 	          });
					} 
            
				});
		});
		
	function selUser(){
	   HZ.selectUser("afterSel",true,true);
	
	}
	function afterSel(nodes){
		//alert($.toJSON(nodes));
		var names=[],ids=[];
		for(var i=0;i<nodes.length;i++){
		  names.push(nodes[i].name);
		  ids.push(nodes[i].id);
		}
		$("#leaderName").val(names.join(","));
		$("#leaderId").val(ids.join(","));
	}	
	function clearUser(){
	  $("#leaderName").val("");
	  $("#leaderId").val("");
	}

	function okFunc(){
        tf=false;
		 $("#submit_btn").click();
		 return false;

	}	
	</script>
</head>

<body>

	<fieldset >
			<legend><small>用户管理</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="user" action="${ctx}/account/user/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${user.id}"/>
		<table class="inputView" style="width: 700px;">
			<tr>
				<td class="left"><span class="req">*</span>登录名：</td>
				<td class="right"><input type="text" name="loginName" size="40" id="loginName" value="${user.loginName}" class="required"/></td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>用户名：</td>
				<td class="right"><input type="text" id="name" name="name" size="40" value="${user.name}" class="required"/></td>
			</tr>
			<tr>
				<td class="left">密码(默认为123456)：</td>
				<td class="right"><input type="password" id="password" name="plainPassword" size="40" value="" minlength="3"/></td>
			</tr>
			<tr>
				<td class="left">确认密码：</td>
				<td class="right"><input type="password" id="passwordConfirm" name="passwordConfirm" size="40" value="" equalTo="#password"/>
				</td>
			</tr>
			<tr>
				<td class="left">密码过期时间：</td>
				<td class="right">
				<input type="text" id="expDate" name="expDate" onclick="new WdatePicker() "  value="<fmt:formatDate value="${user.expDate }" pattern="yyyy-MM-dd"/>" />
				</td>
			</tr>
			<tr>
				<td class="left">邮箱：</td>
				<td class="right"><input type="text" id="email" name="email" size="40" value="${user.email}"/></td>
			</tr>
			<tr>
				<td class="left">手机：</td>
				<td class="right"><input type="text" id="phoneNo" name="phoneNo" size="40" value="${user.phoneNo}"/></td>
			</tr>
			<tr>
				<td class="left">身份证：</td>
				<td class="right"><input type="text" id="cardNo" name="cardNo" size="40" value="${user.cardNo}"/></td>
			<tr>
			 	<td class="left"><span class="req">*</span>用户类型：</td>
			 	<td class="right">
			 		<select  name="userType" id="userType" value="1" class="required">
			 			<option value="">请选择</option>
			 			<c:forEach items="${dic['iot_userType']}" var="item">
          		 				<option value="${item.val }" <c:if test="${user.userType == item.val}">selected="selected"</c:if>>${item.name }</option>
           				</c:forEach>
			 		</select>
			  	 </td>
			</tr>
			
			<tr style='display:none'>
				<td colspan="2"   class="bottom">
					<input class="btn btn-primary" id="submit_btn" type="submit" value="提交"/>&nbsp;
					<input  class="btn" type="button" value="返回" onclick="history.back()"/>
				</td>
			</tr>
		</table>
	</form:form>
</fieldset>
</body>
</html>
