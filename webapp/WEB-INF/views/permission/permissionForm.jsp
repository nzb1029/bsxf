<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/dztree.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"> 
<html>
<head>
	<title> </title>
	<script>
		jQuery(document).ready(function() {
			//为inputForm注册validate函数
			 $("#inputForm").validate({
			 	submitHandler:function(){
			 	       $("#submitBtn").attr("disabled","disabled");
				        var formData = $("#inputForm").serializeObject();
					    $.ajax({
					        url:$("#inputForm").attr("action"),
					        data:formData,
					        type:"POST",
					        success:function(){
					          
					           W.afterSave();
					           api.close();
					        }
					     });
					 
				 }
			 });
	 var setting = {
			async: {
					enable: true,
					url: ctx+"/permission/menutree"
				},
			view: {
				dblClickExpand: false
			},
			data: {
				key: {
			        children: "children",
					name: "menuName",
					title: "",
					url: "url"
					    },
			   simpleData: {
					enable: true,
					idKey: "id",
					pIdKey: "parentId"
					}
			},
			callback: {
				 beforeClick: beforeClick,
				 onClick: onClick
			}
		};
		//var zNodes=  
		$.fn.zTree.init($("#treeDemo"), setting);
		});
		
	function showMenu() {
			var cityObj = $("#menuName");
			var cityOffset = $("#menuName").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}	
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				$("#menuContent").fadeOut("fast");
			    $("body").unbind("mousedown", onBodyDown);
			}
		}
		
		function beforeClick(treeId, treeNode) {
			var check = (treeNode && !treeNode.isParent);
			if (!check) alert("只能选择二级菜单...");
			return check;
		}
		
		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			v = "";
			$("#menuName").val( nodes[0].menuName);
			$("#menuId").val( nodes[0].id);
			/*nodes.sort(function compare(a,b){return a.id-b.id;});
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			*/
		//	var cityObj = $("#citySel");
			//cityObj.attr("value", v);
		}
	</script>
 
</head>

<body style="padding-left: 20px;">
	<c:if test="${not empty message}">
		<div id="message"   class="alert alert-error">
		<button data-dismiss="alert" class="close">×</button>
		<span id="message_div">${message}</span></div>
	</c:if>
	<fieldset>
			<legend><small>管理权限</small></legend>
		<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更! </div>
        <form:form id="inputForm" modelAttribute="permission" action="${ctx}/permission/save" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${permission.id}"/>
		<table class="inputView" style="width: 500px;">
			<tr>
				<td class="left" width="100">权限名：</td>
				<td colspan="2" class="right">
				 <input type="text" class="required" name="name" value="${permission.name }"/>
				</td>
			</tr>
			<tr id="validaty_tr">
				<td class="left">权限值：</td>
				<td colspan="2"  class="right">
					<input type="text" class="required" name="val" value="${permission.val }" /> 
				(user:edit)</td>
			</tr>
			<tr id="validaty_tr">
				<td class="left">所属菜单：</td>
				<td colspan="2"  class="right">
					<input type="text" class="required" placeholder="点击选择"  onclick="showMenu()" readonly="readonly" id="menuName" name="menuName" value="${permission.menu.menuName }" /> 
					<input type="hidden" class="required" id="menuId" name="menu.id" value="${permission.menu.id }" /> 
				</td>
			</tr>
		     <tr>
				<td colspan="3"   class="bottom">
				    <input class="btn btn-primary" id="submitBtn" type="submit" value="提交"/>&nbsp;
				</td>
			</tr>
		</table>
	</form:form>
</fieldset>
<div id="menuContent" class="menuContent" style="display:none; ; position: absolute;">
	<ul id="treeDemo" class="ztree" style="margin-top:0;  "></ul>
</div>
</body>
</html>
