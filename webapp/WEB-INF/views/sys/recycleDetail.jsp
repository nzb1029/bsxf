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
 	<table class="inputView" style="width: 900px;">
<c:forEach items="${resList}" var="item">	 
		<tr>
		<td class="left" width="200"> ${item.column_comment }(${item.COLUMN_NAME })：</td>
        <td   class="right">${item.val}</td>
</tr>
 </c:forEach>	
 
		</table>
 
 
</body>
</html>
