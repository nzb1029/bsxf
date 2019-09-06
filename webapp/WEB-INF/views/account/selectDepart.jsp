<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/dztree.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>帐号管理</title>
	<script>
	    var api = frameElement.api, W = api.opener;
	    var ck=true;
	    if($request.single=="true")
	    	ck=false;
		$(document).ready(function() {
		
			$("#inputForm").validate({
				 submitHandler:function(){
				      refreshTree();
				 }
				});
		refreshTree();
		//$("input[name='userType']").change(refreshTree);
		function refreshTree(){
		      var searchq=$("#searchq").val(); 
		     // var userType=$("input[name='userType']:checked").val();
		      var url=ctx+"/account/user/getDepartTreeData/";
		      if(searchq && searchq!='')
		         url+="?searchq="+searchq;
			  var setting = {
				async: {
					enable: true,
					url: url
				},
				check: {
					enable: ck,
					chkboxType: { "Y": "s", "N": "ps" }
				},
				data: {
					simpleData: {
						enable: true,
						idKey:  "id",
						pIdKey: "parentId"
					}
				},
				view: {
					expandSpeed: "",
				},
				callback: {
					onCheck:function(event, treeId, treeNode){
					var treeObj = $.fn.zTree.getZTreeObj(treeId);
					var parentNode = treeNode.getParentNode();
					var nodes = parentNode.children;
					var lengthChild = nodes.length;
					var result = true;
					for(var i=0;i<lengthChild;i++){
					var checked = nodes[i].checked;
					if(!checked){
						result = false;
						break;
						}
					}
					if(result){
						treeObj.checkNode(parentNode, true, false);
					}
					}
				}
			};
			
		   $.fn.zTree.init($("#departTree"), setting);	
		   //var zTree = $.fn.zTree.getZTreeObj("userTree");
		   
		   }
		});
		
		function okFunc(){
			var treeObj = $.fn.zTree.getZTreeObj("departTree");
			var nodes =[];
			if(ck) nodes=treeObj.getCheckedNodes(true);
			else nodes=treeObj.getSelectedNodes();
			var users=[];//节点数组
			var idMap={};
			for(var i=0;i<nodes.length;i++){
			     if(!idMap[nodes[i].id])
				 { 
				    nodes[i].id=nodes[i].id;
			   		idMap[nodes[i].id] = "1";
			   		users.push(nodes[i]);//选中节点的ID
				 }
			 }
		    if(users.length==0 && $request.must=="true")	{
		       alert("请至少选择一个部门");return false;
		    }	
			if($request.callback ) eval("W."+$request.callback+"(users);"); 
		}
	</script>
</head>

<body style="width: 90%">

	<div>
	<div class="toolbar" style="padding-top: 5px;">
	<form class="form-horizontal" id="inputForm" style="display: none;">
	 <div class="control-group">
				<label for="loginName" class="control-label">关键字:</label>
				<div class="controls">
					<input type="text" id="searchq" name="searchq" value="" class="input-large"/>
					<input type="submit" class="btn btn-primary" value="查询"> 
				</div>
		</div>
	 </form>
    </div>
    </div>
    <div>
 <fieldset style="margin-left: 10px;">
 <legend style="line-height: 0px;margin-bottom: 0px;">&nbsp;</legend>
	<ul id="departTree" class="ztree" style="width: 400px;"></ul>
</fieldset>
</div>
</body>
</html>
