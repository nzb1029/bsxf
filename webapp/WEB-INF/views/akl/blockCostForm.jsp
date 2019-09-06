<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/WEB-INF/common/lhgdialog.jsp" %>
<%@include file="/WEB-INF/common/calendar.jsp" %>
<html>
<head>
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
		});
		function okFunc(){
	         tf=false;
			 $("#submit_btn").click();
			 return false;
	 
		}
		
		function calSum(){
         var tsUnitPrice = $("#tsUnitPrice").val();
         var tsNormalUse = $("#tsNormalUse").val();
         var tsAKLUse = $("#tsAKLUse").val();
         
         var fhfUnitPrice = $("#fhfUnitPrice").val();
         var fhfNormalUse = $("#fhfNormalUse").val();
         var fhfAKLUse = $("#fhfAKLUse").val();
         var normalSum = parseFloat(tsUnitPrice)*parseFloat(tsNormalUse)+ parseFloat(fhfUnitPrice)*parseFloat(fhfNormalUse) ;
         var aklSum = parseFloat(tsUnitPrice)*parseFloat(tsAKLUse)+ parseFloat(fhfUnitPrice)*parseFloat(fhfAKLUse) ;

         $("#normalCost").val(isNaN(normalSum)?0.00 :normalSum);
         $("#aKLCost").val(isNaN(aklSum)?0.00 :aklSum);
		}
		
	</script>
</head>

<body>
	<fieldset >
			<legend><small>成本数据配置</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="cost" action="${ctx}/cost/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" id="id" value="${cost.id}"/>
		<table class="inputView" style="width: 700px;">
			<tr>
				<td class="left" colspan="2" width="100"><span class="req">*</span>地块名称：</td>
				<td class="right" colspan="2">
				    <form:select path="block.id" id="block" class="required">
				    <form:option value="">请选择</form:option>
				    <form:options items="${blockList}" itemLabel="name" itemValue="id"/>
				    </form:select>
				</td>
			</tr>
			<tr>
				<td class="left" colspan="2" width="100">时间：</td>
				<td class="right" colspan="2">
				<input type="text" id="time" name="time" onclick="new WdatePicker() "  value="<fmt:formatDate value="${cost.time }" pattern="yyyy-MM-dd"/>" />
				</td>
			</tr>
			<tr>
			    
				<td class="left" colspan="2" style="font-weight:bold;font-size: 14px">碳酸氢铵单价：</td>
				<td class="right" colspan="2">
				 <input type="text" id="tsUnitPrice" name="tsUnitPrice"  value="${cost.tsUnitPrice}" onblur="checkDecimal(this,9,2);" onchange="calSum();"/>
				</td>
				 <td></td>
			</tr>
			<tr>
				<td class="left" width="130">传统使用量(吨)：</td>
				<td class="right">
				 <input type="text" id="tsNormalUse" name="tsNormalUse"  value="${cost.tsNormalUse}" onblur="checkDecimal(this,9,2);" onchange="calSum();"/>
				</td>
				<td class="left" width="130">爱科农使用量(吨)：</td>
				<td class="right">
				 <input type="text" id="tsAKLUse" name="tsAKLUse"  value="${cost.tsAKLUse}" onblur="checkDecimal(this,9,2);" onchange="calSum();"/>
				</td>
			</tr>
			
			<tr>
				<td class="left" colspan="2"  style="font-weight:bold;font-size: 14px">复合肥单价：</td>
				<td class="right" colspan="2">
				 <input type="text" id="fhfUnitPrice" name="fhfUnitPrice"  value="${cost.fhfUnitPrice}" onblur="checkDecimal(this,9,2);" onchange="calSum();"/>
				</td>
			</tr>
			<tr>
				<td class="left" width="130">传统使用量(吨)：</td>
				<td class="right">
				 <input type="text" id="fhfNormalUse" name="fhfNormalUse"  value="${cost.fhfNormalUse}" onblur="checkDecimal(this,9,2);" onchange="calSum();"/>
				</td>
				<td class="left" width="130">爱科农使用量(吨)：</td>
				<td class="right">
				 <input type="text" id="fhfAKLUse" name="fhfAKLUse"  value="${cost.fhfAKLUse}" onblur="checkDecimal(this,9,2);" onchange="calSum();"/>
				</td>
			</tr>
			<tr>
				<td class="left">总计：</td>
				<td class="right" colspan="3">传统 每公顷成本<br/>（传统 碳酸单价*数量+传统复合肥单价*使用量）:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" width="100" id="normalCost" name="normalCost" readonly="readonly" value="${cost.normalCost}" />
				<br/>爱科农 每公顷成本<br/>（爱科农 碳酸单价*数量+爱科农复合肥单价*使用量）：<input type="text" width="100" id="aKLCost" name="aKLCost" readonly="readonly"  value="${cost.aKLCost}" />
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
