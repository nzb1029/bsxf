<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"> 
<html>
<head>
	<title> </title>
	<script>
		jQuery(document).ready(function() {
			//为inputForm注册validate函数
			//$("#inputForm").validate();
			 $("#inputForm").validate({
			 	submitHandler:function(){
			 	       // if(tf)return ;
			 	      //  tf=true 
			 	          $("#inputForm").ajaxSubmit({
			 	           success:function(){
					           api.close();
					           tf=false;
					          // W.afterSave();
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
	 <legend><small> </small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更。 </div>
        <form:form id="inputForm" modelAttribute="stationConfig" action="${ctx}/stationConfig/areasave" method="post" class="form-horizontal">
		<input type="hidden" name="pid" value="${pid}"/>
		<table class="inputView" style="width: 400px;">
		 
			<tr>
				<td class="left" width="100">名称：</td>
				<td colspan="2" class="right">
				 <input type="text" class="required span3" name="name" value="${stationConfig.name }"/>
				</td>
			</tr>
	        
		     <tr style="display: none;">
				<td colspan="3"   class="bottom">
				    <input class="btn btn-primary" id="submit_btn" type="submit" value="保存"/>&nbsp;
				</td>
			</tr>
		</table>
	</form:form>
</fieldset>
</body>
</html>
