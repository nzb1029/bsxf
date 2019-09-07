<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
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
			 $("#provice").change(function(){
				    var val=$(this).val();
				    var area=$("#city");
				    if(val){
				   $.ajax({
						url:ctx+"/block/loadCity/"+val,
						dataType: 'json',
						success:function(d){
						    area.html("");
							for(var i=0;i<d.length;i++){
							 $("<option value=\""+d[i].id+"\">"+d[i].name+"</option>").appendTo(area);
							}
							var f=$("#cityf").val();
							if(f){
							   area.val(f);
							}
						}
						
						
					}).fail(function() { alert("error " ); });
				  }else {
				     area.html("");
				 }
				 });
			 
				 $("#provice").change();

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
	 	          
				var fileType = '0';	
				var blockId = $("#id").val();
				var frameUrl="${ctx }/upload/upload2.jsp?fileType="+fileType+"&blockId="+blockId+"&fileSizeLimit=100MB&uploadLimit=20&multi=true&iframeId=okFrame&adap=true&fileTypeExts=*.jpg;*.jpge;*.gif;*.png;*.pdf"
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
			<legend><small>地块管理</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="block" action="${ctx}/block/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" id="id" value="${block.id}"/>
		<input type="hidden" name="suitPlant" id="suitPlant" value="${block.suitPlant}"/>
		<table class="inputView" style="width: 700px;">
			<tr>
				<td class="left"><span class="req">*</span>地块名称：</td>
				<td class="right"><input type="text" name="name" size="40" id="name" value="${block.name}" class="required"/></td>
			</tr>
			<tr>
				<td class="left" width="100">经纬度信息：</td>
		        <td   class="right" colspan="3">
		        <input type="text" class="number" style="width: 80px;"  name="pointx"  id="pointx" value="${block.pointx}"/>
		        <input type="text" class="number" style="width: 80px;" name="pointy" id="pointy" value="${block.pointy}"/>
		           <a href="#" id="addpoint">选择</a>
		        </td>
			</tr>
			<tr>
				<td class="left" width="100">地址：</td>
		        <td   class="right">
				    <form:select path="provice.id" id="provice">
				    <form:option value="">请选择</form:option>
				    <form:options items="${plist}" itemLabel="name" itemValue="id"/>
				    </form:select>
				     <form:select path="city.id"  id="city">
				    </form:select>
				    <br/>
   					 <input type="text"   name="address" style="width: 450px;" value="${block.address}"/>
				</td>
			</tr>
			<tr>
				<td class="left">绑定用户:</td>
				<td class="right">
				<input type="hidden" name="user.id" size="40" id="userId" value="${block.user.id}" />
				<input type="text" name="user.name" readonly="readonly" size="40" id="userName" value="${block.user.name}" />
				 <a href="#" onclick="selUser()">选择</a>
				</td>
			</tr>
			<tr>
				<td class="left"><span class="req">*</span>监测站点编号：</td>
				<td class="right"><input type="text" name="monitorSite" size="40" id="name" value="${block.monitorSite}" class="required"/></td>
			</tr>
			<tr>
			<td class="left" width="100">地块遥感数据图片：</td>
	        <td   class="right" colspan="2">
         	<iframe id="okFrame" src="" style="width: 100%;height:200px;  " frameborder="0">
  			</iframe></td>
			</tr>
			<tr>
				<td class="left" width="100">地块生产潜力：</td>
		        <td   class="right">
		        <textarea rows="3" style="width: 300px;" name="blockProduct">${block.blockProduct}</textarea>
       		    </td>
		 
		    </tr>
			<tr>
				<td class="left" width="100">限制因素：</td>
        		<td class="right"> <textarea rows="3" style="width: 300px;" name="blockLimit">${block.blockLimit}</textarea></td>
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
