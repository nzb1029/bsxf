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
        <form:form id="inputForm"   modelAttribute="recycle" action="${ctx}/sys/recycle/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${recycle.id}"/>
		<table class="inputView" style="width: 800px;">
		 
		<tr>
		<td class="left" width="100"><span class="req">*</span>表名：</td>
        <td   class="right"><input type="text" class="required"  name="tablec" value="${recycle.tablec}"/></td>
		<td class="left" width="100"><span class="req">*</span>表中文名：</td>
        <td   class="right"><input type="text" class="required"  name="tableName" value="${recycle.tableName}"/></td>
</tr>
<tr>
		<td class="left" width="100"><span class="req">*</span>列名称：</td>
        <td   class="right"><input type="text" class="required"  name="col" value="${recycle.col}"/></td>
		<td class="left" width="100"><span class="req">*</span>列中文名：</td>
        <td   class="right"><input type="text" class="required"  name="colName" value="${recycle.colName}"/></td>
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
