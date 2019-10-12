<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
<%@include file="/WEB-INF/common/lhgdialog.jsp" %>
<%@include file="/WEB-INF/common/calendar.jsp" %>
<%@page import="org.bsxf.common.entity.bsxf.CheckHistory"%>
<%@page import="org.bsxf.common.entity.bsxf.Equipment"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

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
				<td class="left"><span class="req">*</span>数量：</td>
				<td class="right"><input type="text" name="amount" disabled="disabled" size="40" id="amount" value="${checkHistory.equipment.amount}" class="required"/></td>
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
			<%
			    CheckHistory check =  (CheckHistory)request.getAttribute("checkHistory");
                  if(StringUtils.isNotEmpty(check.getEquipment().getEno()) &&
               		   StringUtils.contains(check.getEquipment().getEno(), "FBGG")){
           %>
           <tr>
				<td class="left">CO2标识：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field04 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<tr>
				<td class="left">模块报警是否正常：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field05 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<tr>
				<td class="left">灭火器联动盘是否无锈蚀，无变形，指示是否在绿区：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field06 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<tr>
				<td class="left">灭火器插销，阀门是否正常：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field07 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
           <%}else{ %>
			<tr>
				<td class="left">消防设施是否被遮挡，灭火器箱是否完好，灭火器数量是否缺少：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field04 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<tr>
				<td class="left">灭火器的铭牌是否残缺，并清晰明了：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field05 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<tr>
				<td class="left">灭火器上关于灭火剂、驱动气体的种类、充装压力、总质量、灭火级别、制造厂名和生产日期或维修日期等标志及操作说明是否齐全：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field06 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<tr>
				<td class="left">灭火器的铅封、销闩等保险装置是否损坏：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field07 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<tr>
				<td class="left">灭火器的筒体是否无明显的损伤（磕伤、划伤）、缺陷、锈蚀（特别是筒底和焊缝）、泄漏：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field08 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<tr>
				<td class="left">灭火器的喷射软管是否完好，无明显龟裂，喷嘴不堵塞：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field09 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<tr>
				<td class="left">灭火器的驱动气体压力是否在工作压力范围：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field10 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<tr>
				<td class="left">灭火器的零部件是否齐全，并且无松动、脱落或损伤现象：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field11 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<% if(StringUtils.isNotEmpty(check.getEquipment().getEno()) &&
            		   StringUtils.contains(check.getEquipment().getEno(), "FHB")){
			%>
			<tr>
				<td class="left">水枪、水带、水管是否齐全，无破损，易连接：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field12 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<tr>
				<td class="left">消火栓水压是否正常，启泵按钮是否有效：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" class="required" disabled="disabled">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_status']}" var="item">
          		 				<option value="${item.val }" <c:if test="${checkHistory.field13 == item.val}">selected="true"</c:if>>${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			 <% }
			   } %>
			<tr>
				<td class="left">检查情况：</td>
				<td   class="right">
		          <textarea rows="3" style="width: 300px;" name="comments" disabled="disabled">${checkHistory.comments}</textarea>
       		    </td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>上传图片：</td>
				<td   class="right" colspan="2">
	         	<iframe id="okFrame" src="" style="width: 100%;height:200px;  " frameborder="0">
	  			</iframe></td>
			</tr>
		</table>
	</form:form>
</fieldset>
</body>
</html>
