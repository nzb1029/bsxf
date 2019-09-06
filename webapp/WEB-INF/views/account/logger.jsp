<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>帐号管理</title>
		<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
		<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
		<script type="text/javascript"
			src="${ctx }/static/data/account/user.js"></script>
		<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#user-tab").addClass("active");
			
			$("#viewLog").click(function(){
			   var logName=$("#logName").val();
			   if(logName==''){
			      alert("请输入ogger名称");
			   }
			   else {
			      $.ajax({
			      	     url:ctx+"/account/user/loggerGet?logName="+logName,
			      	     type:"POST",
					     success:function(d){
					           $("select[name='logLevel']").val(d);
					        }
			      });
			   
			   }
			});
			//
			$("#stepLog").click(function(){
			       var logLevel=$("select[name='logLevel']").val();
			       var logName=$("#logName").val();
			       $.ajax({
			      	     url:ctx+"/account/user/loggerSet?logLevel="+logLevel+"&logName="+logName,
			      	     type:"POST",
					     success:function(d){
					           $("select[name='logLevel']").val(d);
					        }
			      });   
			
			});
		});
	</script>
	</head>
	<body style="padding: 0;margin: 0;">
	
	<table class="inputView" style="width: 800px;margin-top: 20px;margin-left: 5px;">
			<tr>
				<td class="left">log名(如org.springframework):</td>
				<td class="right"><input type="text" name="logName" size="40" id="logName" value="" class="required"/>
				<input class="btn btn-primary" type="button" id="viewLog" value="查看"/>
				</td>
			</tr>
			<tr>
				<td class="left">设置等级:</td>
				<td class="right">
                         <select name="logLevel">
                           <option value="ERROR">ERROR
                           <option value="DEBUG">DEBUG
                           <option value="INFO">INFO
                         </select>
              <input class="btn btn-primary" type="button" id="stepLog" value="设置"/>  </td>
			</tr>
	</table>
	</body>
</html>
