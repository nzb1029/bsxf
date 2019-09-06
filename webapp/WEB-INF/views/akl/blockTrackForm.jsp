<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/WEB-INF/common/lhgdialog.jsp" %>
<html>
<head>
	<title>地块管理</title>
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
			$('#block_id').change(function() {
				initUpload();
			});
			initUpload() ;
		});
		function okFunc(){
	         tf=false;
			 $("#submit_btn").click();
			 return false;
		}
		function initUpload(){
			var fileType = '5';	
			var blockId = $("#block_id").val();
			var frameUrl="" ;
			if (blockId != null && blockId != undefined && blockId != '') {
			   frameUrl="${ctx }/upload/upload2.jsp?fileType="+fileType+"&blockId="+blockId+"&fileSizeLimit=100MB&uploadLimit=20&multi=true&iframeId=okFrame&adap=true&fileTypeExts=*.jpg;*.jpge;*.gif;*.png;*.pdf"
			}
		    $("#okFrame").attr("src",frameUrl);		
		}
	</script>
</head>

<body>
	<fieldset >
			<legend><small>地块实时监控数据管理</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="blockTrack" action="${ctx}/track/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" id="id" value="${blockTrack.id}"/>
		<table class="inputView" style="width: 700px;">
			<tr>
				<td class="left"><span class="req">*</span>地块名称：</td>
				<td class="right">
				    <form:select path="block.id" id="block_id" class="required">
				    <form:option value="">请选择</form:option>
				    <form:options items="${blockList}" itemLabel="name" itemValue="id"/>
				    </form:select>
				</td>
			</tr>
			<tr>
				<td class="left" width="100">病虫害预警：</td>
        		<td class="right"> <textarea rows="3" style="width: 300px;" name="bchyj">${blockTrack.bchyj}</textarea></td>
			</tr>
			<tr>
				<td class="left" width="100">病虫防治方案：</td>
        		<td class="right"> <textarea rows="3" style="width: 300px;" name="bcfzfa">${blockTrack.bcfzfa}</textarea></td>
			</tr>
			<tr>
				<td class="left" width="100">预计收获时间：</td>
        		<td class="right"> <textarea rows="3" style="width: 300px;" name="yjshsj">${blockTrack.yjshsj}</textarea></td>
			</tr>
			<tr>
				<td class="left" width="100">本周工作建议：</td>
        		<td class="right"> <textarea rows="3" style="width: 300px;" name="bzgzjy">${blockTrack.bzgzjy}</textarea></td>
			</tr>
			<tr>
				<td class="left" width="100">作物发展阶段：</td>
		        <td   class="right" colspan="2">
	         	<iframe id="okFrame" src="" style="width: 100%;height:200px;  " frameborder="0">
	  			</iframe></td>
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
