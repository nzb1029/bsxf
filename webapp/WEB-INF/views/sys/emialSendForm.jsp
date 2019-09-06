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
	 
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正  </div>
        <form:form id="inputForm"   modelAttribute="emialSend" action="${ctx}/sys/emialSend/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${emialSend.id}"/>
		<table class="inputView" style="width: 800px;">
		 
		<tr>
		<td class="left" width="100">SMTP服务器：</td>
        <td   class="right"><input type="text"   name="host" value="${emialSend.host}"/></td>
</tr>
	<tr>
		<td class="left" width="100">用户名：</td>
        <td   class="right"><input type="text"   name="username" value="${emialSend.username}"/></td>
</tr>
<tr>
		<td class="left" width="100">密码：</td>
        <td   class="right"><input type="password"   name="password" value="${emialSend.password}"/></td>
</tr>
<tr>
		<td class="left" width="100">端口：</td>
        <td   class="right"><input type="text"   name="port" value="${emialSend.port}"/></td>
</tr>
<tr>
		<td class="left" width="100">主题：</td>
        <td   class="right"><input type="text"   name="subject" value="${emialSend.subject}"/></td>
		 
</tr>
<tr>
		 <td class="left" width="100">内容：</td>
        <td   class="right">
        <textarea rows="3" name="message" style="width: 500px;">${emialSend.message}</textarea>
        </td>
</tr>
<tr>
		<td class="left" width="100">接收者：</td>
        <td   class="right"><input type="text"   name="toemail" value="${emialSend.toemail}"/></td>
</tr>
 
          <tr>
		<td class="left" width="100">发送时间：</td>
        <td   class="right"><input type="text"  onclick="new WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'}) " name="sendTime" value="<fmt:formatDate value="${emialSend.sendTime }" pattern="yyyy-MM-dd"/>"/></td>

</tr>
		     <tr style='display:none'>
				<td colspan="3"   class="bottom">
				    <input class="btn btn-primary" id="submit_btn" type="submit" value="提交"/>&nbsp;
					<input  class="btn" type="button" value="返回" onclick="history.back()"/>
				</td>
			</tr>
		</table>
	</form:form>
 
</body>
</html>
