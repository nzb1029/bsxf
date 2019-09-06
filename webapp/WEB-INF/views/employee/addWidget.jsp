<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/WEB-INF/common/calendar.jsp" %>
<%@include file="/WEB-INF/common/lhgdialog.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"> 
<html>
<head>
	<title> </title>
	<script type="text/javascript">
	jQuery(document).ready(function() {
			//为inputForm注册validate函数
			 $("#inputForm").validate({ 
			 		submitHandler:function(){
				        var formData = $("#inputForm").serializeObject();
					    $.ajax({
					        url:$("#inputForm").attr("action"),
					        data:formData,
					        type:"POST",
					        success:function(){
					          
					           W.afterSave();
					            api.close();
					        }
					     });
					 
				 }});
			});	 
 function okFunc(){
	  $("#saveBtn").click();
	  return false;
	}
	</script> 
</head>

<body style="width: 90%;">
	<c:if test="${not empty message}">
		<div id="message"   class="alert alert-error">
		<button data-dismiss="alert" class="close">×</button>
		<span id="message_div">${message}</span></div>
	</c:if>
	<fieldset>
			<legend><small>添加部件</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更�? </div>
        <form:form id="inputForm" modelAttribute="widget" action="${ctx}/widget/saveAdd" method="post" class="form-horizontal">
		<table class="inputView" style="width:90%;">
		  <tr>
				<td class="right">
				<form:bscheckboxes path="id" items="${widList}" itemLabel="name" itemValue="id" />
				 </td>
			</tr>	
			 
		     <tr style="display: none;">
				<td colspan="7"   class="bottom">
				    <input id="saveBtn" class="btn btn-primary"   type="submit" value="提交"/>&nbsp;
					<input  class="btn" type="button" value="返回" onclick="history.back()"/>
				</td>
			</tr>
		</table>
	</form:form>
</fieldset>
</body>
</html>
