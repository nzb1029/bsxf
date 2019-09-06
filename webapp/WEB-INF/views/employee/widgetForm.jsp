<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/calendar.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"> 
<html>
<head>
	<title> </title>
	<script>
		jQuery(document).ready(function() {
			//为inputForm注册validate函数
			$("#inputForm").validate({
			 	submitHandler:function(){
			 	       // if(tf)return ;
			 	      //  tf=true 
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
		
	function okFunc(){
	         tf=false;
			 $("#submit_btn").click();
			 return false;
	 
		}	
		
		
	</script>
 
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message"   class="alert alert-error">
		<button data-dismiss="alert" class="close">×</button>
		<span id="message_div">${message}</span></div>
	</c:if>
	<fieldset>
			<legend><small>管理部件</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正  </div>
        <form:form id="inputForm"   modelAttribute="widget" action="${ctx}/widget/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${widget.id}"/>
		<table class="inputView" style="width: 400px;">
		 
		<tr>
		<td class="left" width="100"><span class="req">*</span>部件名称：</td>
        <td   class="right"><input type="text" class="required"  name="name" value="${widget.name}"/></td>
</tr>		<tr>
		<td class="left" width="100"><span class="req">*</span>部件地址：</td>
        <td   class="right"><input type="text" class="required"  name="url" value="${widget.url}"/></td>
</tr>

		     <tr style='display:none'>
				<td colspan="3"   class="bottom">
				    <input class="btn btn-primary" id="submit_btn" type="submit" value="提交"/>&nbsp;
					<input  class="btn" type="button" value="返回" onclick="history.back()"/>
				</td>
			</tr>
		</table>
	</form:form>
</fieldset>
</body>
</html>
