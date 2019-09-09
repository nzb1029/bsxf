<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
<%@include file="/WEB-INF/common/lhgdialog.jsp" %>
<%@include file="/WEB-INF/common/calendar.jsp" %>
<html>
<head>
	<title>巡检记录详情</title>
	<script>
		$(document).ready(function() {
			$("#inputForm").validate({
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
	 	          
				var fileType = '1';	
				var businessId = $("#id").val();
				var frameUrl="${ctx }/upload/upload2.jsp?fileType="+fileType+"&businessId="+businessId+"&fileSizeLimit=100MB&uploadLimit=20&multi=true&iframeId=okFrame&adap=true&fileTypeExts=*.jpg;*.jpge;*.gif;*.png;*.pdf&isview=true"
			    $("#okFrame").attr("src",frameUrl);		
		});
		
		function okFunc(){
	         tf=false;
			 $("#submit_btn").click();
			 return false;
	 
		}			
	 
	</script>
</head>

<body>
	<fieldset >
			<legend><small>巡检记录详情</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="checkHistory" action="${ctx}/checkHistory/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" id="id" value="${checkHistory.id}"/>
		<table class="inputView" style="width: 700px;">
			<tr>
				<td class="left"><span class="req">*</span>灭火器编号：</td>
				<td class="right"><input type="text" name="eno" size="40" id="eno" disabled="disabled" value="${checkHistory.equipment.eno}" class="required"/></td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>区域：</td>
				<td class="right"><input type="text" name="area"  disabled="disabled" size="40" id="area" value="${checkHistory.equipment.area}" class="required"/></td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>位置：</td>
				<td class="right"><input type="text" name="location" disabled="disabled" size="40" id="location" value="${checkHistory.equipment.location}" class="required"/></td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>巡检人:</td>
				<td class="right">
				<input type="text" name="checkUser.name" disabled="disabled" size="40" id="userName" value="${checkHistory.checkUser.name}" />
				</td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>巡检时间:</td>
				<td class="right">
				<input type="text" id="checkTime" name="checkTime" onclick="new WdatePicker() " disabled="disabled"  value="<fmt:formatDate value="${checkHistory.checkTime}" pattern="yyyy-MM-dd"/>" />
				</td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>状态:</td>
				<td class="right">
				<input type="text" name="runStatusDes" disabled="disabled" size="40" id="runStatusDes" value="${checkHistory.runStatusDes}" />
				</td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>上传图片：</td>
				<td   class="right" colspan="2">
	         	<iframe id="okFrame" src="" style="width: 100%;height:200px;  " frameborder="0">
	  			</iframe></td>
			</tr>
			<tr>
				<td class="left">备注：</td>
				<td   class="right">
		          <textarea rows="3" style="width: 300px;" name="comments" disabled="disabled">${checkHistory.comments}</textarea>
       		    </td>
			</tr>
		</table>
	</form:form>
</fieldset>
</body>
</html>
