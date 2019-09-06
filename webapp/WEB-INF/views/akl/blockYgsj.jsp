<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="org.bsxf.web.LtSecurityUtils"%>
<%@include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title>遥感数据</title>
		<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
		<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
		<script>
			function loadFiles(blockId){
				       $.ajax({
				         url:ctx+"/upload/getFileListYG?blockId="+blockId+"&fileType=0",
				         cache:false,
				         method:"get",
			             dataType:"json", 
				         success:function(d){ 
				             showFiles(blockId, d);
				         },
				         beforeSend:function(){
			                $("#files_div").append("<img src='"+ctx+"/static/fileupload/images/loaders/32x32.gif'>");
			             }
				       });
			} 
			function showFiles(blockId, files){
			   if(files.length==0){
			      $("#file00").html("尚未上传任何文件");
			      return ;
			   }
			   var fileLength = (files.length > 16) ? 16 : files.length;
			   for(var i=0;i<fileLength;i++){
			       var  file=files[i];
				  // if(file.type && file.type!='' && file.type.indexOf(".")!=-1){ 
					path=ctx+"/static-content?contentPath="+encodeURIComponent(blockId+"/0/"+file.name)+"&t="+new Date().getTime();
					var pstr= "<a class='file_entry'><div class='image'><div class='img' style=''><img src='"+path+"' width='100%' height='100%' style='padding-bottom:5px;'/></div></div></a>";
					jQuery("#file"+parseInt(i/4)+(i%4)).html(pstr);
					jQuery("#file"+parseInt(i/4)+(i%4)).addClass("file_img");
					jQuery("#file_name_"+parseInt(i/4)+(i%4)).html(file.name.substring(0,file.name.lastIndexOf(".")));
					jQuery("#file_name_"+parseInt(i/4)+(i%4)).addClass("file_name");
			   }
			} 
	    
		    function downFile(fname,blockId){
		        var path=ctx+"/static-content?download=true&contentPath="+getPath(fname)+"&fullpath="+(request["fullpath"]?request["fullpath"]:"")+"&fileType="+(request["fileType"]?request["fileType"]:"")+"&field01="+(request["field01"]?request["field01"]:"");
		        window.location.href=path;
		    } 
			$(function(){
				loadFiles('<%=LtSecurityUtils.getShiroUser().getBlockId()%>');
			});
			function dwII(id,x,y,name){
				var url=ctx+"/baidu/dingwei?x="+x+"&y="+y+"&id="+id+"&eName="+encodeURIComponent(name);
				window.open(url);
			}
		</script>
	</head>
	<body class="user_page" style="width: 1158px; height: 480px;">
	 <div id="table_center_header">
	                  农田遥感数据
	       </div>
	       <div id="table_center_info">
	           <div id="table_center_info_header">本页面包含以下信息</div>
	       </div>
        <form:form id="inputForm" modelAttribute="block">
			<table class="noborder" style="width: 100%;">
				<tr>
					<td class="title" colspan="2">地块信息</td>
				</tr>
				<tr>
					<td class="left">地块名称：</td>
					<td class="right">${block.name}</td>
				</tr>
				<tr>
					<td class="left" width="100">经纬度信息：</td>
		     	   <td class="right">
		     	   		${block.pointx}&nbsp&nbsp&nbsp&nbsp${block.pointy}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		     	   		<a style="cursor: pointer;" title='定位' onclick="dwII('${block.id}','${block.pointx}','${block.pointy}','${block.name}')">定位</a>
		     	   </td>
				</tr>
				<tr>
					<td class="left" width="100">地址：</td>
		        	<td class="right">${provice }&nbsp&nbsp${city }&nbsp&nbsp${block.address}</td>
				</tr>
				<tr>
					<td class="title" colspan="2">地块生产潜力</td>
				</tr>
				<tr>
					<td class="right" colspan="2">${block.blockProduct}</td>
				</tr>
				<tr>
					<td class="title" colspan="2">限制因素</td>
				</tr>
				<tr>
					<td class="right" colspan="2">${block.blockLimit}</td>
				</tr>
			</table>
			<table class="noborder">
				<tr>
					<td class="title" colspan="4">卫星遥感</td>
				</tr>
				<tr>
					<td id="file00" class="file"></td>
					<td id="file01" class="file"></td>
					<td id="file02" class="file"></td>
					<td id="file03" class="file"></td>
				</tr>
				<tr>
					<td id="file_name_00" class="file"></td>
					<td id="file_name_01" class="file"></td>
					<td id="file_name_02" class="file"></td>
					<td id="file_name_03" class="file"></td>
				</tr>
				<tr>
					<td id="file10" class="file"></td>
					<td id="file11" class="file"></td>
					<td id="file12" class="file"></td>
					<td id="file13" class="file"></td>
				</tr>
				<tr>
					<td id="file_name_10" class="file"></td>
					<td id="file_name_11" class="file"></td>
					<td id="file_name_12" class="file"></td>
					<td id="file_name_13" class="file"></td>
				</tr>
				<tr>
					<td id="file20" class="file"></td>
					<td id="file21" class="file"></td>
					<td id="file22" class="file"></td>
					<td id="file23" class="file"></td>
				</tr>
				<tr>
					<td id="file_name_20" class="file"></td>
					<td id="file_name_21" class="file"></td>
					<td id="file_name_22" class="file"></td>
					<td id="file_name_23" class="file"></td>
				</tr>
				<tr>
					<td id="file30" class="file"></td>
					<td id="file31" class="file"></td>
					<td id="file32" class="file"></td>
					<td id="file33" class="file"></td>
				</tr>
				<tr>
					<td id="file_name_30" class="file"></td>
					<td id="file_name_31" class="file"></td>
					<td id="file_name_32" class="file"></td>
					<td id="file_name_33" class="file"></td>
				</tr>
			</table>
		</form:form>
	
	</body>
</html>
