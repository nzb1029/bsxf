<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/lhgdialog.jsp"%>
<%@include file="/WEB-INF/common/ckeditor.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"> 
<html>
<head>
	<title> </title>
	<script>
		jQuery(document).ready(function() {
			//为inputForm注册validate函数
			//$("#inputForm").validate();
			$("#reload").click(function(){
			   var f=confirm("确定重新加载吗？");
			   if(f){
			      $.ajax({
			         url:"${ctx}/stationConfig/reload",
			         cache:false,
			         success:function(d){
			           alert("加载完成");
			         }
			      });
			   
			   }
			   
			});
			var url="${ctx }/upload/upload.jsp?module=logo&fileTypeExts=*.jpg;*.jpge;*.gif;*.png&fileSizeLimit=1MB&multi=false&iframeId=logoFrame&adap=true&fileName=logo.gif&imgView=true&tt="+new Date().getTime();
			 $("#logoFrame").attr("src",url);
			 
			 
	$("#selectpoint").click(function(){
			 $.dialog({
			          id: 'LHG1976D1',
			          content: "url:"+ctx+"/baidu/addpoint",
			          lock:true,
			          title: '抓取坐标',
			          height:600,
			          width:900,
			          ok:function(){return this.content.okFunc();},
			          init:function(){ 
			          },
				       cancel: true
			      });
			
			});		 
		});
		
	function AfterAddPoint(x,y){
	 $("#pointx").val(x);
	 $("#pointy").val(y); 
	}	
	</script>
 
</head>

<body>
   <input class="btn" id="reload" type="button" value="重新加载application.properties"/>&nbsp;
	<c:if test="${not empty message}">
		<div id="message"   class="alert alert-error">
		<button data-dismiss="alert" class="close">×</button>
		<span id="message_div">${message}</span></div>
	</c:if>
	<fieldset>
	 <legend><small>站点配置</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更。 </div>
        <form:form id="inputForm" modelAttribute="stationConfig" action="${ctx}/stationConfig/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${stationConfig.id}"/>
		<table class="inputView" style="width: 98%;">
		 
			<tr>
				<td class="left" width="150">站点名称：</td>
				<td colspan="2" class="right">
				 <input type="text" class="required span3" name="name" value="${stationConfig.name }"/>
				</td>
			</tr>
	        <tr>
				<td class="left" width="100">文件系统路径：</td>
				<td colspan="2" class="right">
				 <input type="text" class="required span3" name="ename" value="${stationConfig.ename }"/>
				</td>
			</tr>
		   <tr>
				<td class="left" width="100">公司名称：</td>
				<td colspan="2" class="right">
				 <input type="text" class="required span3" name="companyName" value="${stationConfig.companyName }"/>
				</td>
			</tr>
			  <tr>
				<td class="left" width="100">公司地址：</td>
				<td colspan="2" class="right">
				 <input type="text" class="required span3" name="companyAddress" value="${stationConfig.companyAddress }"/>
				</td>
			</tr>
			  <tr>
				<td class="left" width="100">公司电话：</td>
				<td colspan="2" class="right">
				 <input type="text" class="required span3" name="companyTel" value="${stationConfig.companyTel }"/>
				</td>
			</tr>
			<tr id="validaty_tr">
				<td class="left">验证码：</td>
				<td colspan="2"  class="right">
				  <label class="radio">是
				    <form:radiobutton path="authCode" value="Y"/>
				   </label>
				 <label class="radio">否
				   <form:radiobutton path="authCode" value="N"/>
				   </label>
				  
				</td>
			</tr> 
			<tr id="validaty_tr">
				<td class="left">是否启用数据权限：</td>
				<td colspan="2"  class="right">
				  <label class="radio">是
				    <form:radiobutton path="authData" value="Y"/>
				   </label>
				 <label class="radio">否
				   <form:radiobutton path="authData" value="N"/>
				   </label>
				  
				</td>
			</tr> 
			<tr id="validaty_tr">
				<td class="left">登录失败次数限制：</td>
				<td colspan="2"  class="right">
				  <input type="text" class="required span3" name="failCount" value="${stationConfig.failCount }"/>
				  
				</td>
			</tr> 
			 <tr>
				<td class="left" width="100">短信账号：</td>
				<td colspan="2" class="right">
				 <input type="text" class="required span3" name="smsName" value="${stationConfig.smsName }"/>
				(短信使用中国网建短信功能)</td>
			</tr>
			 <tr>
				<td class="left" width="100">短信密钥：</td>
				<td colspan="2" class="right">
				 <input type="text" class="required span3" name="smsPasswd" value="${stationConfig.smsPasswd }"/>
				</td>
			</tr>
			<tr id="validaty_tr">
				<td class="left">LOGO：</td>
				<td colspan="2"  class="right">
				  <iframe id="logoFrame" src="" style="width: 100%;height:100px;  " frameborder="0">
  </iframe>
  
				</td>
			</tr>
			 <tr>
				<td class="left" width="100">中心坐标：</td>
				<td colspan="2" class="right">
				 <input type="text"   name="pointx" id="pointx" value="${stationConfig.pointx }"/>
				  <input type="text"   name="pointy"id="pointy" value="${stationConfig.pointy }"/>
				  <input type="button" value="选择"  id="selectpoint"/>
				</td>
			</tr>
			 <tr>
				<td class="left" width="100">登陆页介绍：</td>
				<td colspan="2" class="right">
			 
				<ckfinder:setupCKEditor   basePath = "/ckfinder"   editor = "intro"   />  
				<ckeditor:editor   value="${stationConfig.intro}" editor="intro" basePath="${ctx}/ckeditor"></ckeditor:editor>
				
				</td>
			</tr>
		     <tr >
				<td colspan="3"   class="bottom">
				    <input class="btn btn-primary" type="submit" value="保存"/>&nbsp;
				</td>
			</tr>
		</table>
	</form:form>
</fieldset>
</body>
</html>
