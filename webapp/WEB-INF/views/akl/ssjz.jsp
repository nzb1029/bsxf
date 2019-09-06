<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
<%@page import="org.bsxf.web.LtSecurityUtils"%>
<html>
<head>
	<script>
		$(document).ready(function() {
			var blockId = '<%=LtSecurityUtils.getShiroUser().getBlockId()%>';
			loadFiles(blockId, '5');
		});
		function loadFiles(blockId,fileType,seedId){
			if (seedId == null || seedId == undefined) seedId='';
		       $.ajax({
		         url:ctx+"/upload/getFileList?blockId="+blockId+"&fileType="+fileType+"&field01="+seedId,
		         cache:false,
		         method:"get",
	             dataType:"json", 
		         success:function(d){ 
		             showFiles(blockId, d, fileType, seedId);
		         },
		         beforeSend:function(){
	                $("#files_div").append("<img src='"+ctx+"/static/fileupload/images/loaders/32x32.gif'>");
	             }
		       });
	} 
	function showFiles(blockId, files, fileType, seedId){
	   if(files.length==0){
	      $("#file00").html("尚未上传任何文件");
	      return ;
	   }
	   var fileLength = (files.length > 16) ? 16 : files.length;
	   
	   for(var i=0;i<fileLength;i++){
	        var  file=files[i];
		    var path=ctx+"/static-content?contentPath="+encodeURIComponent(blockId+"/"+fileType+"/"+file.name)+"&t="+new Date().getTime();
			var pstr= "<a class='file_entry'><div class='image'><div class='img' style=''><img src='"+path+"' width='400px' height='400px' style='padding-bottom:5px;'/></div></div></a>";
		    jQuery("#zwfzjd").html(pstr);
		    jQuery("#zwfzjd").addClass("file_img");
	   }
	} 

	</script>
</head>
<body class="user_page">
<div id="table_center_header">
	                 实时进展信息
	       </div>
	       <div id="table_center_info">
	           <div id="table_center_info_header">本页面包含以下内容</div>
	       </div>
<fieldset>
 <form:form id="inputForm" modelAttribute="blockTrack" class="form-horizontal">
   <table class="noborder" style="width: 100%">
   			<tr>
   				<td class="title" colspan="2">实时进展信息</td>
   			</tr>
			<tr>
				<td class="left">地块名称：</td>
				<td class="right"> ${blockTrack.block.name}</td>
			</tr>
			<tr>
				<td class="left" width="100">病虫害预警：</td>
        		<td class="right"> ${blockTrack.bchyj}</td>
			</tr>
			<tr>
				<td class="left" width="100">病虫防治方案：</td>
        		<td class="right">${blockTrack.bcfzfa}</td>
			</tr>
			<tr>
				<td class="left" width="100">预计收获时间：</td>
        		<td class="right">${blockTrack.yjshsj}</td>
			</tr>
			<tr>
				<td class="left" width="100">本周工作建议：</td>
        		<td class="right">${blockTrack.bzgzjy}</td>
			</tr>
		</table>  
		<table class="noborder" border="0" style="width: 100%">
				<tr>
					<td class="title" colspan="2">作物发展阶段</td>
				</tr>
				<tr>
					<td id="zwfzjd" class="left"></td>
					<td class="left">&emsp;&emsp;</td>
				</tr>
		</table> 
	 </form:form>
	</fieldset>
	<fieldset>
	 <table class="noborder" style="width: 100%">
	 <tr>
		<td class="title" colspan="4">实时田间气象</td>
	 </tr>
	 </table> 
	 <iframe allowtransparency="true" frameborder="0" width="100%" height="900" scrolling="no" src="http://www.nqssjc.com/qxysjcex.aspx?stationid=${blockTrack.block.monitorSite}"></iframe>
    </fieldset>
</body>
</html>
