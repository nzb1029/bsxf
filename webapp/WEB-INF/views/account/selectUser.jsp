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
		$("input[name='userType']").change(refreshTree);
		function refreshTree(){
		      var searchq=$("#searchq").val(); 
		      var userType="1";//$("input[name='userType']:checked").val();
		      var url=ctx+"/account/user/getTreeData/?userType="+userType;
		      if(searchq && searchq!='')
		         url+="&searchq="+searchq;
			  var setting = {
				async: {
					enable: true,
					url: url
				},
				check: {
					enable: ck
				},
				data: {
					simpleData: {
						enable: true,
						idKey:  "id",
						pIdKey: "parentId"
					}
				},
				view: {
					expandSpeed: ""
				},
				callback: {
					//onClick: zTreeOnClick
					//beforeExpand: beforeExpand,
					//onNodeCreated: onNodeCreated,
				   // onAsyncSuccess: onAsyncSuccess
					//onAsyncError: onAsyncError
				}
			};
			
		   $.fn.zTree.init($("#userTree"), setting);	
		   //var zTree = $.fn.zTree.getZTreeObj("userTree");
		   
		   }
		});
		
		function okFunc(){ 
			var treeObj = $.fn.zTree.getZTreeObj("userTree");
			var nodes =[];
			if(ck) nodes=treeObj.getCheckedNodes(true);
			else nodes=treeObj.getSelectedNodes();
			var users=[];//节点数组
			var idMap={};
			 for(var i=0;i<nodes.length;i++){ 
			     if(nodes[i].type=='user' && !idMap[nodes[i].id])
				   { 
				   idMap[nodes[i].id] = "1";
				   users.push(nodes[i]);//选中节点的ID
				   }
			 }
		    if(users.length==0 && $request.must=="true")	{
		       alert("请至少选择一个用户");return false;
		    }	
		  //  alert($request.callback); 
		  if($request.autoIds!=''){//设置的自动设值的val.id 和name.id
		        var autoValId=$request.autoIds.split(",")[0];
		        var autoNameId=$request.autoIds.split(",")[1];
			    var autonames=[],autoids=[];
				for(var i=0;i<users.length;i++){
				  autonames.push(users[i].name);
				  autoids.push(users[i].id);
				}
				W.$("#"+autoNameId).val(autonames.join(","));
				W.$("#"+autoValId).val(autoids.join(","));
		  }else if($request.callback )
			 eval("W."+$request.callback+"(users);"); 
		  else {
		     alert("缺少必要的参数！");return false;
		  }	 
		}
	</script>
</head>

<body>

	<div>
	<div class="toolbar" style="padding-top: 5px;">
	<form class="form-horizontal" id="inputForm">
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
 <fieldset>
 <legend style="line-height: 0px;margin-bottom: 0px;">&nbsp;</legend>
	<ul id="userTree" class="ztree" style="margin-left: 80px;width:320px;"></ul>
</fieldset>
</div>
</body>
</html>
