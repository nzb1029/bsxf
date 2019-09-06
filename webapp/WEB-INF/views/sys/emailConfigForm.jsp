<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/calendar.jsp" %>
<%@include file="/WEB-INF/common/ckeditor.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"> 
<html>
<head>
	<title> </title>
	<script>
		jQuery(document).ready(function() {
			//为inputForm注册validate函数
			$("#inputForm").validate({
			 	 
			 });
			 
			 
			 $("#text_btn").click(function(){
			      $.ajax({
						url:ctx+"/sys/emailConfig/test/",
						dataType: 'text',
						success:function(d){
						 	//jQGridSupport.reloadGrid(ggridId);
						 	if(d=='1')
						 	   alert("测试成功");
						    else if(d=='2')
						 	   alert("测试失败");
						 	else if(d=='0')
						 	   alert("尚未配置邮箱");
						}
						
						
					}).fail(function() { alert("error " ); });
			     
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
	 
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正  </div>
        <form:form id="inputForm"   modelAttribute="emailConfig" action="${ctx}/sys/emailConfig/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${emailConfig.id}"/>
		<table class="inputView" style="width: 800px;">
		 
		<tr>
		<td class="left" width="100"><span class="req">*</span>SMTP服务器：</td>
        <td   class="right"><input type="text" class="required"  name="host" value="${emailConfig.host}"/></td>
</tr>
<tr>
		<td class="left" width="100"><span class="req">*</span>用户名：</td>
        <td   class="right"><input type="text" class="required"  name="username" value="${emailConfig.username}"/></td>
</tr>
<tr>
		<td class="left" width="100"><span class="req">*</span>密码：</td>
        <td   class="right"><input type="password" class="required"  name="password" value="${emailConfig.password}"/></td>
</tr>
<tr>
		<td class="left" width="100"><span class="req">*</span>端口：</td>
        <td   class="right"><input type="text" class="required"  name="port" value="${emailConfig.port}"/></td>
</tr>
		     <tr  >
				<td colspan="3"   class="bottom">
				    <input class="btn btn-primary" id="submit_btn" type="submit" value="提交"/>&nbsp;
				    <c:if test="${emailConfig.id!=null}">
				    <input class="btn btn-primary" id="text_btn" type="button" value="测试"/>
</c:if>
				</td>
			</tr>
		</table>
	</form:form>
 
</body>
</html>
