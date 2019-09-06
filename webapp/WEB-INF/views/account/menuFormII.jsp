<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/WEB-INF/common/lhgdialog.jsp" %>
<%@include file="/WEB-INF/common/calendar.jsp" %>
<html>
<head>
	<title>帐号管理</title>
	<script>
		$(document).ready(function() {
		 
			$("#inputForm").validate({ 
				submitHandler:function(){
				 	      
				 	          $("#inputForm").ajaxSubmit({
				 	           success:function(d){
						           W.afterSave(d);
						           api.close();
						          }
				 	          });
					     
					 
						 } 
			});
		});
	function okFunc(){
         tf=false;
		 $("#submit_btn").click();
		 return false;
 
	}

	function selPermitDepart(){
		HZ.selectDepartment("afterSelPermitDep",true,false);
	 }
	 
	function afterSelPermitDep(nodes){
	    var names=[],ids=[];
		for(var i=0;i<nodes.length;i++){
		  names.push(nodes[i].name);
		  ids.push(nodes[i].id);
		}
		$("#permitDepNames").val(names.join(","));
		$("#permitDepIds").val(ids.join(","));
	}
	
	function clearPermitDepart(){
		$("#permitDepNames").val("");
		$("#permitDepIds").val("");
	}	
	
	function selExceptDepart(){
		HZ.selectDepartment("afterSelExceptDep",true,false);
	 }
	function afterSelExceptDep(nodes){
	    var names=[],ids=[];
		for(var i=0;i<nodes.length;i++){
		  names.push(nodes[i].name);
		  ids.push(nodes[i].id);
		}
		$("#exceptDepNames").val(names.join(","));
		$("#exceptDepIds").val(ids.join(","));
	}
	function clearExceptDepart(){
		$("#exceptDepNames").val("");
		$("#exceptDepIds").val("");
	}	
	</script>
</head>

<body>

	<fieldset>
			<legend><small>管理菜单</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
        <form:form id="inputForm" modelAttribute="menu" action="${ctx}/account/menu/saveII" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${menu.id}"/>
		<input type="hidden" name="parentId" value="${menu.parentId}"/>
		<table class="inputView" style="width: 500px;">
		<tr>
				<td class="left">上级菜单:</td>
				<td class="right">
				${pmenu.menuName }
				
				</td>
			</tr>
				<tr>
				<td class="left">菜单名:</td>
				<td class="right"><input type="text" name="menuName" size="40" id="name" value="${menu.menuName}" class="required"/></td>
			</tr>
			<tr>
				<td class="left">链接:</td>
				<td class="right"><input type="text" name="link" size="40" id="link" value="${menu.link}" /></td>
			</tr>
			<tr>
				<td class="left">排序:</td>
				 
				<td class="right"><input type="text" name="sortNo" size="40" id="sortNo" value="${menu.sortNo}" /></td>
			 
			</tr>
			
		    <tr style="display: none;">
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
