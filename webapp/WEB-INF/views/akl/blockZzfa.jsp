<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="org.bsxf.web.LtSecurityUtils"%>
<%@include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title>制定种植方案</title>
		<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
		<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
		<script>
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
				  // if(file.type && file.type!='' && file.type.indexOf(".")!=-1){ 
				  	if (fileType == '3')
						path=ctx+"/static-content?contentPath="+encodeURIComponent(blockId+"/"+fileType+"/"+seedId+"/"+file.name)+"&t="+new Date().getTime();
					else
						path=ctx+"/static-content?contentPath="+encodeURIComponent(blockId+"/"+fileType+"/"+file.name)+"&t="+new Date().getTime();
					var pstr= "<a class='file_entry'><div class='image'><div class='img' style=''><img src='"+path+"' width='100%' height='100%' style='padding-bottom:5px;'/></div></div></a>";
					if (file.name.indexOf('.pdf')>= 0)
						var pstr = "<a fname='"+file.name+"' class='file_entry' href='"+path+"&pdf=true' target='_Blank' style='width:auto'>"+file.name+"</a>";
					if (fileType == '1')					
				       jQuery("#weather").append(pstr);
				    else if (fileType == '2')
				       jQuery("#futher_weather").append(pstr);
				    else if (fileType == '3')
				       jQuery("#seed_detail").html(pstr);
			   }
			}
			
			function progressbarStart() {
				var value = $('#p').progressbar('getValue');
				if (value < 100){
					value += Math.floor(10);
					$('#p').progressbar('setValue', value);
					setTimeout("progressbarStart()", 200);
				} else {
					$('#p').progressbar('setValue', 0);
					jQuery("#p").hide();
				}
			}
			
			function changeSeed(seedId) {
				var blockId = '<%=LtSecurityUtils.getShiroUser().getBlockId()%>';
				var suitPlants = '${blockParam.block.suitPlant}';
				if (suitPlants) {
					var suitPlantArray = suitPlants.split(',');
					if (seedId == '') {
				       jQuery("#seed_detail").html('');
					} else if ($.inArray(seedId,suitPlantArray) == -1) {
						alert('该地块不适合该品种');
				       jQuery("#seed_detail").html('');
					} else {
						jQuery("#p").show();
						progressbarStart();
						setTimeout("loadFiles('"+blockId+"', '3', '"+seedId+"')", 2000);
					}
				}
			
			}
	    
			$(function(){
				var blockId = '<%=LtSecurityUtils.getShiroUser().getBlockId()%>';
				loadFiles(blockId, '1');
				loadFiles(blockId, '2');
				var suitPlants = '${blockParam.block.suitPlant}';
				if (suitPlants) {
					var suitPlantArray = suitPlants.split(',');
					for (let index=0; index < suitPlantArray.length; index++) {
						$('#seed_'+suitPlantArray[index]).css({"background-color":"yellow"});
					}
				}
				jQuery("#p").hide();
			});
		</script>
		
		<style>
			th {
				background-color: #f1f1f1;
				color: #336699;
			}
		</style>
	</head>
	<body class="user_page" style="padding: 0;margin: 0;">
		<div id="table_center_header">
	                  种植方案信息
	       </div>
	       <div id="table_center_info">
	           <div id="table_center_info_header">本页面包含以下四个子页面</div>
	       </div>
		<div id=″info_tabs″ class="easyui-tabs">
			<div title="气象数据图表">
				<table class="noborder" style="width: 100%;">
					<tr>
						<td class="left">地块名称：</td>
						<td class="right">${block.name }</td>
					</tr>
					<tr>
						<td id="weather" class="file" colspan="2">
						</td>
					</tr>
				</table>
			</div>
			<div title="气象预测图表">
				<table class="noborder" style="width: 100%;">
					<tr>
						<td class="left">地块名称：</td>
						<td class="right">${block.name }</td>
					</tr>
					<tr>
						<td id="futher_weather" class="file" colspan="2">
						</td>
					</tr>
				</table>
			</div>
			<div title="土壤信息">
				<table class="noborder" style="width: 100%;">
					<tr>
						<td class="left">地块名称：</td>
						<td class="right">${block.name }</td>
					</tr>
					<tr>
						<td class="left">土壤名称：</td>
						<td class="right">${blockParam.name}</td>
					</tr>
					<tr>
						<td class="left">PH：</td>
						<td class="right_half">${blockParam.ph}
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp; ${blockParam.phLevel} </td>
					</tr>
					<tr>
						<td class="left">Total N(g kg-1)：</td>
						<td class="right_half">${blockParam.totalN}
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp; ${blockParam.totalNLevel}</td>
					</tr>
					<tr>
						<td class="left">Available P(mg kg-1)：</td>
						<td class="right_half">${blockParam.availableP}
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;${blockParam.availablePLevel}</td>
					</tr>
					<tr>
						<td class="left">Available K(mg kg-1)：</td>
						<td class="right_half">${blockParam.availableK}
						&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;${blockParam.availableKLevel}</td>
					</tr>
					<tr>
						<td class="left">SOM(g kg-1)：</td>
						<td class="right_half">${blockParam.sOM}
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;${blockParam.sOMLevel}</td>
					</tr>
				</table>
			</div>
			<div title="种植方案">
				<table class="noborder" style="width: 100%;">
					<tr>
						<td class="left">地块名称：</td>
						<td class="right">${block.name }</td>
					</tr>
					<tr>
						<td class="left">品种信息：</td>
						<td class="right">
							<select id="seed_select" onchange="changeSeed(this.value)">
								<option value="">请选择</option>
								<c:forEach items="${dic['akl_seed']}" var="item">
									<option id="seed_${item.val }" value="${item.val }">${item.name }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr><td class="right" colspan="2"><div id="p" class="easyui-progressbar" style="width:400px; margin:0 auto;"></div></td></tr>
					<tr>
				        <td id="seed_detail" class="right" colspan="2"></td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>
