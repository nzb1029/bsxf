<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
<%@include file="/WEB-INF/common/lhgdialog.jsp" %>
<html>
<head>
	<title>帐号管理</title>
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
			initSuitPlant();
			initUpload();
		});
		function initSuitPlant() {
			var suitPlants = '${blockParam.block.suitPlant}';
			if (suitPlants) {
				var suitPlantArray = suitPlants.split(',');
				$('#last_suit_plant_seq').val(suitPlantArray.length);
				var blockId = $("#block_id").val();
				for (let index=0; index < suitPlantArray.length; index++) {
					$('#seed_table').append(
						'<tr id="seed_tr_'+index+'"><td>'
						+'	<select class="required" id="seed_select_'+index+'" onchange="changeSeed(this.value,'+index+')">'
						+'		<option value="">请选择</option>'
						+'		<c:forEach items="${dic[\'akl_seed\']}" var="item">'
						+'			<option value="${item.val }">${item.name }</option>'
						+'		</c:forEach>'
						+'	</select>'
						+'</td><td>'
						+'	<iframe id="seed_pic_'+index+'" src="" style="width: 100%;height:200px  " frameborder="0"/>'
						+'</td><td>'
						+'	<img style="cursor: pointer;" title="删除" onclick="removeSeed('+index+')" src="'+ctx+'/static/img/delete.png"/>'
						+'</td></tr>'
					);
					$('#seed_select_'+index).val(suitPlantArray[index]);
				}
			}
		}
		function formatSuitPlant() {
			var result = "";
			$('select[id^="seed_select_"]').each(function() {
				result += $(this).val() + ",";
			});
			$('#block_suitPlant').val(result.substring(0, (result.length - 1)));
		}
		function addSeed() {
			var lastSuitPlantSeq = parseInt($('#last_suit_plant_seq').val()) + 1;
			$('#seed_table').append(
				'<tr id="seed_tr_'+lastSuitPlantSeq+'"><td>'
				+'	<select class="required" id="seed_select_'+lastSuitPlantSeq+'" onchange="changeSeed(this.value,'+lastSuitPlantSeq+')">'
				+'		<option value="">请选择</option>'
				+'		<c:forEach items="${dic[\'akl_seed\']}" var="item">'
				+'			<option value="${item.val }">${item.name }</option>'
				+'		</c:forEach>'
				+'	</select>'
				+'</td><td>'
				+'	<iframe id="seed_pic_'+lastSuitPlantSeq+'" src="" style="width: 100%;height:200px  " frameborder="0"/>'
				+'</td><td>'
				+'	<img style="cursor: pointer;" title="删除" onclick="removeSeed('+lastSuitPlantSeq+')" src="'+ctx+'/static/img/delete.png"/>'
				+'</td></tr>'
			);
			$('#last_suit_plant_seq').val(lastSuitPlantSeq);
			formatSuitPlant();
		}
		function removeSeed(index) {
			var blockId = $("#block_id").val();
			var seedId = $('#seed_select_'+index).val() ;
			$('#seed_tr_'+index).remove();
			if(seedId != null && seedId != undefined && seedId != ''){
				deleteFile(blockId,seedId);
			}
			formatSuitPlant();
		}
		
		function deleteFile(blockId,seedId){
		      var f=confirm("确定删除吗？");  
		      if(f){
		       $.ajax({
			         url:ctx+"/upload/deleteMutiFile",
			         cache:false,
			         method:"POST",
	                 dataType:"json", 
	                 data:{blockId:blockId,fileType:"3",field01:seedId},
			         success:function(d){
			         }
			          
			       });
		      }
		} 
		function changeSeed(value, index) {
			var blockId = $("#block_id").val();
			var picSrc="" ;
			var suit = $('#block_suitPlant').val();
			var suitPlantArray = suit.split(',');
			if($.inArray(value,suitPlantArray) > -1){
			  alert("该品种已经添加，请重新选择！");
			  $('#seed_select_'+index).val("");
			  return false ;
			 }
			if (blockId != null && blockId != undefined && blockId != ''
				&& value != null && value != undefined && value != '') 
				picSrc = "${ctx }/upload/upload2.jsp?field01="+value+"&fileType=3&blockId="+blockId+"&fileSizeLimit=100MB&uploadLimit=20&multi=false&iframeId=seed_select_"+index+"&adap=true&fileTypeExts=*.jpg;*.pdf";
			$('#seed_pic_'+index).attr("src",picSrc);
			formatSuitPlant();
		}
		function initUpload() {
			var blockId = $("#block_id").val();
			var weatherFrameUrl="";
			var futherWeatherFrameUrl="";
			if (blockId != null && blockId != undefined && blockId != '') {
				var weatherFrameUrl="${ctx }/upload/upload2.jsp?fileType=1&blockId="+blockId+"&fileSizeLimit=100MB&uploadLimit=20&multi=true&iframeId=weather&adap=true&fileTypeExts=*.jpg;*.jpge;*.gif;*.png;*.pdf";
				var futherWeatherFrameUrl="${ctx }/upload/upload2.jsp?fileType=2&blockId="+blockId+"&fileSizeLimit=100MB&uploadLimit=20&multi=true&iframeId=futher_weather&adap=true&fileTypeExts=*.jpg;*.jpge;*.gif;*.png;*.pdf";
			}
			$('select[id^="seed_select_"]').each(function(index, seed) {
				var seedId = seed.value;
				var picSrc=""
				if (blockId != null && blockId != undefined && blockId != ''
					&& seedId != null && seedId != undefined && seedId != '') 
					picSrc = "${ctx }/upload/upload2.jsp?field01="+seedId+"&fileType=3&blockId="+blockId+"&fileSizeLimit=100MB&uploadLimit=20&multi=false&iframeId=seed_select"+seed.id.substring(seed.id.lastIndexOf('_'))+"&adap=true&fileTypeExts=*.jpg;*.pdf";
				$('#seed_pic_'+index).attr("src",picSrc);
			});
			$("#weather").attr("src",weatherFrameUrl);
			$("#futher_weather").attr("src",futherWeatherFrameUrl);
		}
		function okFunc(){
	         tf=false;
			 $("#submit_btn").click();
			 return false;
	 
		}
	 
	</script>
	<style>
		input[type=text].test {
			border:none; 
		}
		
		th {
			background-color: #f1f1f1;
			color: #336699;
		}
  </style>
</head>

<body>
	<fieldset >
			<legend><small>种植方案</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="blockParam" action="${ctx}/param/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" id="id" value="${blockParam.id}"/>
		<input type="hidden" name="block.suitPlant" id="block_suitPlant" value="${blockParam.block.suitPlant}"/>
		<input type="hidden" name="last_suit_plant_seq" id="last_suit_plant_seq" value="0"/>
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
			<td class="left" width="100">气象数据图表：</td>
	        <td   class="right" colspan="2">
         	<iframe id="weather" src="" style="width: 100%;height:200px  " frameborder="0">
  			</iframe></td>
			</tr>
			<tr>
			<td class="left" width="100">气象预测图表：</td>
	        <td class="right" colspan="2">
         	<iframe id="futher_weather" src="" style="width: 100%;height:200px  " frameborder="0">
  			</iframe></td>
			</tr>
			<tr><td class="right" colSpan="2"><table border="1px solid #a8cbf1" cellspacing="0" cellpadding="0">
				<tr><th rowSpan="2" width='15px'>土壤</th><th rowSpan="2" width='15px'>pH</th><th width='15px'>Total N</th><th width='15px'>Available P</th><th width='15px'>Available K</th><th width='15px'>SOM</th></tr>
				<tr><th>g kg-1</th><th>mg kg-1</th><th>mg kg-1</th><th>g kg-1</th></tr>
				<tr>
					<td rowSpan="2"><input class="test" type="text" name="name" size="20" id="name" value="${blockParam.name}" style="height:50px;"/></td>
					<td><input class="test" type="text" name="ph" id="ph" size="20" value="${blockParam.ph}"/></td>
					<td><input class="test" type="text" name="totalN" id="totalN" size="20" value="${blockParam.totalN}"/></td>
					<td><input class="test" type="text" name="availableP" id="availableP" size="20" value="${blockParam.availableP}"/></td>
					<td><input class="test" type="text" name="availableK" id="availableK" size="20" value="${blockParam.availableK}"/></td>
					<td><input class="test" type="text" name="sOM" id="sOM" size="20" value="${blockParam.sOM}"/></td>
				</tr>
				<tr>
					<td><input class="test" type="text" name="phLevel" id="phLevel" size="20" value="${blockParam.phLevel}"/></td>
					<td><input class="test" type="text" name="totalNLevel" id="totalNLevel" size="20" value="${blockParam.totalNLevel}"/></td>
					<td><input class="test" type="text" name="availablePLevel" id="availablePLevel" size="20" value="${blockParam.availablePLevel}"/></td>
					<td><input class="test" type="text" name="availableKLevel" id="availableKLevel" size="20" value="${blockParam.availableKLevel}"/></td>
					<td><input class="test" type="text" name="sOMLevel" id="sOMLevel" size="20" value="${blockParam.sOMLevel}"/></td>
				</tr>
			</table></td></tr>
			<tr>
				<td class="left" style="text-align: left;border-bottom: 0px;border-right: 0px;">种子配置</td>
				<td class="left" style="text-align: right;border-bottom: 0px;border-left: 0px;">
					<input type="button" onclick="addSeed()" class="btn btn-primary" value="添加适宜种子 ">
				</td>
			</tr>
			<tr><td class="right" colSpan="2">
				<table id="seed_table" border="1px solid #a8cbf1" cellspacing="0" cellpadding="0" width="100%">
					<tr><th width="230px">种子</th><th width="300px">图片</th><th width="50px">操作</th></tr>
				</table>
			</td></tr>
			
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
