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
	         var unitPrice = $("#unitPrice").val();
	         var normalProduct = $("#normalProduct").val();
	         var aKLProduct = $("#aKLProduct").val();
	         
	         var normalSum = parseFloat(unitPrice)*parseFloat(normalProduct) ;
	         var aklSum = parseFloat(unitPrice)*parseFloat(aKLProduct);

	         $("#normalIncome").val(isNaN(normalSum)?0.00 :normalSum);
	         $("#aKLIncome").val(isNaN(aklSum)?0.00 :aklSum);
			}
	</script>
</head>

<body>
	<fieldset >
			<legend><small>收益数据配置</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="income" action="${ctx}/income/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" id="id" value="${income.id}"/>
		<table class="inputView" style="width: 700px;">
			<tr>
				<td class="left" width="100"  colspan="2" ><span class="req">*</span>地块名称：</td>
				<td class="right"  colspan="2" >
				    <form:select path="block.id" id="block" class="required">
				    <form:option value="">请选择</form:option>
				    <form:options items="${blockList}" itemLabel="name" itemValue="id"/>
				    </form:select>
				</td>
			</tr>
			<tr>
				<td class="left" width="100"  colspan="2" >时间：</td>
				<td class="right"  colspan="2" >
				<input type="text" id="time"  name="time" onclick="new WdatePicker() "  value="<fmt:formatDate value="${income.time }" pattern="yyyy-MM-dd"/>" />
				</td>
			</tr>
			<tr>
			    
				<td class="left"  colspan="2" >农作物单价：</td>
				<td class="right"  colspan="2" >
				 <input type="text" id="unitPrice" name="unitPrice"  value="${income.unitPrice}" onblur="checkDecimal(this,9,2);" onchange="calSum();"/>
				</td>
				 <td></td>
			</tr>
			<tr>
				<td class="left" width="130">传统方案产量(吨)：</td>
				<td class="right">
				 <input type="text" id="normalProduct" name="normalProduct"  value="${income.normalProduct}" onblur="checkDecimal(this,9,2);" onchange="calSum();"/>
				</td>
				<td class="left" width="130">爱科农方案产量(吨)：</td>
				<td class="right">
				 <input type="text" id="aKLProduct" name="aKLProduct"  value="${income.aKLProduct}" onblur="checkDecimal(this,9,2);" onchange="calSum();"/>
				</td>
			</tr>
			<tr>
				<td class="left" width="130">传统收益：</td>
				<td class="right">
				 <input type="text" id="normalIncome" name="normalIncome" readonly="readonly"  value="${income.normalIncome}" />
				</td>
				<td class="left" width="130">爱科农收益：</td>
				<td class="right">
				 <input type="text" id="aKLIncome" name="aKLIncome" readonly="readonly"  value="${income.aKLIncome}" />
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
