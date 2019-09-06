<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>

<html>
<head>
	<title>帐号管理</title>
	
	<script>
		var api = frameElement.api;
		
		$(document).ready(function() {
		 
		   if(!api)$("#inputForm").validate({});
		   else 
			//为inputForm注册validate函数
			{
			 var  W = api.opener;	
			$("#inputForm").validate({
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					if ( element.is(":checkbox") )
						error.appendTo ( element.parent().next() );
					else
						error.insertAfter( element );
				},
				 submitHandler:function(){
				        var formData = $("#inputForm").serializeObject();
					    $.ajax({
					        url:$("#inputForm").attr("action"),
					        data:formData,
					        type:"POST",
					        success:function(){
					          
					           W.afterSaveSpec();
					            api.close();
					        }
					     });
					 
				 }
			});
			}
			
		});
		 
		function okFunc(){
			 $("#submit_btn").click();
			 return false;
	 
		}
	</script>
</head>

<body>

	<fieldset>
			<legend><small>管理字典</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="dictionary" action="${ctx}/config/dictionary/save" method="post" class="form-horizontal"
        >
		<input type="hidden" name="id" value="${dictionary.id}"/>
 		<input type="hidden" name="parent.id" value="${dictionary.parent.id}"/>
		<table class="inputView" style="width: 600px;">
			<tr>
				<td class="left">字典名:</td>
				<td colspan="2" class="right"><input type="text" name="name" size="40" id="name" value="${dictionary.name}" class="required"/></td>
			</tr>
	
			<tr>
				<td class="left">字典值:</td>
				<td colspan="2"  class="right"><input type="text" name="val" size="40" id="val" value="${dictionary.val}"  /></td>
			</tr>
			<tr>
				<td class="left">字典代码:</td>
				<td class="right">
				 <c:if test="${not empty param.mt}">
					<input readonly="readonly" type="text" name="typeCode" size="40" id="typeCode" value="${dictionary.parent.typeCode}"   class="required"/>
				</c:if>
				 <c:if test="${empty param.mt }">
					<input  type="text" name="typeCode" size="40" id="typeCode" value="${dictionary.typeCode}"   class="required"/>
				</c:if>
				</td>
			</tr>
			<tr>
				<td class="left">扩展值:</td>
				<td colspan="2"  class="right">
				<input type="text" name="extFiled" size="40" id="extFiled" value="${dictionary.extFiled}"  />
				
			</tr>
			
		    <tr>
				<td class="left">默认值:</td>
				<td colspan="2"  class="right">
				<label class="radio">否
				<form:radiobutton path="defaultFlg" value="n" />
				</label>
				<label class="radio">是
				<form:radiobutton path="defaultFlg" value="y" />
				</label>
			</tr>
		     <tr  style="display:<c:if test="${not empty param.mt}"> none; </c:if>;">
				<td colspan="3"   class="bottom">
					 	<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
					 
					<input  class="btn" type="button" value="返回" onclick="history.back()"/>
				</td>
			</tr>
		 
		</table>
	</form:form>
</fieldset>
</body>
</html>
