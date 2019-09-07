<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
<%@include file="/WEB-INF/common/lhgdialog.jsp" %>
<%@include file="/WEB-INF/common/calendar.jsp" %>
<html>
<head>
	<title>灭火器管理</title>
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
				 $("#addpoint").click(function(){
				      var leftp=$("input[name='pointx']").val();
				      var topp=$("input[name='pointy']").val();
					  $.dialog({
						          id: 'LHG1976D1',
						          content: "url:"+ctx+"/baidu/addpoint?x="+leftp+"&y="+topp,
						          lock:false,
						          title: '经纬度获取',
						          height:600,
						          width:900,
						          ok:function(){return this.content.okFunc();},
						          init:function(){ 
						          },
						          zIndex:9999999999,
							       cancel: true
						      });
				  });
	 	          
				var fileType = '3';	
				var businessId = $("#id").val();
				var frameUrl="${ctx }/upload/upload2.jsp?fileType="+fileType+"&businessId="+businessId+"&fileSizeLimit=100MB&uploadLimit=20&multi=true&iframeId=okFrame&adap=true&fileTypeExts=*.jpg;*.jpge;*.gif;*.png;*.pdf"
			    $("#okFrame").attr("src",frameUrl);		

				  
		});
		
	function selUser(){
		 $.dialog({
			          id: 'LHG1976D1',
			          content: "url:"+"${ctx}/account/user/select",
			          lock:true,
			          title: "选择用户", 
			          height:500,
			          width:850,
			          zIndex:999999999,
			          ok:function(){return this.content.okFunc();},
			          init:function(){ 
			          },
				       cancel: true
			      });
		   

		}	
		
		function afterSel(id,name,eno){
			$("#userId").val(id);
			$("#userName").val(name);
		}	

		function AfterAddPoint(x,y){
			 $("#pointx").val(x);
			 $("#pointy").val(y); 
			}	
		function okFunc(){
	         tf=false;
			 $("#submit_btn").click();
			 return false;
		}			
	 
	</script>
</head>

<body>
	<fieldset >
			<legend><small>设备管理</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="equipment" action="${ctx}/equipment/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" id="id" value="${equipment.id}"/>
		<table class="inputView" style="width: 700px;">
			<tr>
				<td class="left"><span class="req">*</span>设备类型：</td>
				<td class="right">
				<select name="equipmentTypeId" id="equipmentTypeId" value="1" class="required">
			 			<c:forEach items="${dic['xf_type']}" var="item">
          		 				<option value="${item.val }">${item.name }</option>
           				</c:forEach>
			 		</select>
				 </td>
			</tr>
			<tr>
				<td class="left">设备名称：</td>
				<td class="right"><input type="text" name="name" size="40" id="name" value="${equipment.name}"/></td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>设备编号：</td>
				<td class="right"><input type="text" name="eno" size="40" id="eno" value="${equipment.eno}" class="required"/></td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>区域：</td>
				<td class="right"><input type="text" name="area" size="40" id="area" value="${equipment.area}" class="required"/></td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>位置：</td>
				<td class="right"><input type="text" name="location" size="40" id="location" value="${equipment.location}" class="required"/></td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>类别：</td>
				<td class="right">
					<select  name="subTypeId" id="subTypeId" value="1" class="required">
				 			<c:forEach items="${dic['xf_category']}" var="item">
	          		 				<option value="${item.val }">${item.name }</option>
	           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			
			<tr>
				<td class="left">有效期：</td>
				<td class="right">
				 <input type="text" id="effDate" name="effDate" onclick="new WdatePicker() "  value="<fmt:formatDate value="${equipment.effDate }" pattern="yyyy-MM-dd"/>" />
				  至
				 <input type="text" id="expDate" name="expDate" onclick="new WdatePicker() "  value="<fmt:formatDate value="${equipment.expDate }" pattern="yyyy-MM-dd"/>" />
				</td>
			</tr>
			<tr>
				<td class="left" width="100">经纬度信息：</td>
		        <td   class="right" colspan="3">
		        <input type="text" class="number" style="width: 80px;"  name="pointx"  id="pointx" value="${equipment.pointx}"/>
		        <input type="text" class="number" style="width: 80px;" name="pointy" id="pointy" value="${equipment.pointy}"/>
		           <a href="#" id="addpoint">选择</a>
		        </td>
			</tr>
			<tr>
				<td class="left" width="100">设备图片：</td>
		        <td   class="right" colspan="2">
	         	<iframe id="okFrame" src="" style="width: 100%;height:200px;  " frameborder="0">
	  			</iframe></td>
			</tr>
			<tr>
				<td class="left">巡检负责人:</td>
				<td class="right">
				<input type="hidden" name="checkUser.id" size="40" id="userId" value="${equipment.checkUser.id}" />
				<input type="text" name="checkUser.name" readonly="readonly" size="40" id="userName" value="${equipment.checkUser.name}" />
				 <a href="#" onclick="selUser()">选择</a>
				</td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>巡检频率设置：</td>
				<td class="right">
					<select  name="checkFreq" id="checkFreq" value="1" class="required">
					  <option>请选择</option>
			 			<c:forEach items="${dic['xf_check_freq']}" var="item">
          		 				<option value="${item.val }">${item.name }</option>
           				</c:forEach>
				 	</select>
				 </td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>备注：</td>
				<td   class="right">
		          <textarea rows="3" style="width: 300px;" name="comments">${equipment.comments}</textarea>
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
