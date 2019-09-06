<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/dztree.jsp" %>
<%@ include file="/WEB-INF/common/lhgdialog.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"> 
<html>
<head>
	<title> </title>
	<script>
		jQuery(document).ready(function() {
		  setting = {
				async: {
					enable: true,
					url: ctx+"/stationConfig/areatree"
				},
				check: {
					enable: false
				},
				  
				data: {
					key: {
						children: "children",
						name: "name",
						title: "",
						url: "url"
					    },
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "parent_id"
					}
				},
				view: {
					expandSpeed: ""
				},
				callback: {
				onClick:function(a,b,c){
				     $.dialog({
				          id: 'LHG1976D1',
				          content: "url:"+ctx+"/stationConfig/areaform/?pid="+c.id,
				          lock:true,
				          title: c.name+'添加子地区',
				          height:'auto',
				          width:550,
				          ok:function(){return this.content.okFunc();},
				          init:function(){ 
				          },
					       cancel: true
				      });
				}
				}
			};  
	    $.fn.zTree.init($("#permissionTree"), setting);	//refTree();
			 
		});
		
		
	</script>
 
</head>

<body>
    
<table style="margin-top: 15px;">
<tr><td valign="top" width="300px;"  >

 <ul id="permissionTree" class="ztree" style="height: 500px;"></ul>

</td><td valign="top">		
		
		<table id="contentTable"></table>
		<div id="pjqgajax"></div>
</td></tr></table>	
</body>
</html>
