<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/dztree.jsp" %>
<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
<html>
<head>
	<title>帐号管理</title>
	<%@ include file="/WEB-INF/common/jqgrid.jsp" %>
	
	<script>
	$(document).ready(function() {
		loadMenu();
		});
	function loadMenu(){
	 var setting = {
				async: {
					enable: true,
					url: ctx+"/account/menu/menuTree/"
				},
				check: {
					enable: false
				},
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "parentId"
					}
				},
				view: {
					expandSpeed: ""
				},
				edit: {
				enable: true,
				drag: {
					autoExpandTrigger: true,
				    prev: function(treeId, nodes, targetNode){
				   //  alert(targetNode.id);
				     //  if(!targetNode.id)return false;
				    },
					//inner: dropInner,
					next: function(){
					   //alert(2);
					}
					}
				}, 
				callback: {
					  onClick: function(a,b,c){
		                   pid=c.id;
		                   pnode=c;
					  },
					    onRemove: function(a,b,c){
					    
					    },
						onRename: function(a,b,c){
						//alert(c.id);
						} ,
						beforeEditName: function(treeId, treeNode){
						if(treeNode.id=='1'){
						  alert("顶级菜单不允许编辑");
						}
						else {
						updateMenu(treeNode.id);
						}
						return false;
						},
						beforeRemove: function(treeId, treeNode){
						if(treeNode.id=='1'){
						  alert("顶级菜单不允许删除");
						}
						else {
							toRemove(treeNode.id);
							}
						return false;
						},
						onDrop: function(event, treeId, treeNodes, targetNode, moveType, isCopy){
						  if(!targetNode)return false;
						  var cs= targetNode.children;
						  var ps=[];
						  for(var i=0;i<cs.length;i++){
						     ps.push({id:cs[i].id,pid:targetNode.id,sort:i});
						  }
						 /// alert($.toJSON(ps));
						  $.ajax({
								url:ctx+"/account/menu/drop?pstr="+$.toJSON(ps),
								dataType: 'json',
								success:function(d){
								 	
								 	//alert("删除成功");
								}
								
								
							}).fail(function() { alert("error " ); });
						}
					//beforeExpand: beforeExpand,
					//onNodeCreated: onNodeCreated,
				   // onAsyncSuccess: onAsyncSuccess
					//onAsyncError: onAsyncError
				}
			};
			
		  $.fn.zTree.init($("#menuTree"), setting);	
		  var zTree = $.fn.zTree.getZTreeObj("menuTree");
		  zTree.setting.edit.showRemoveBtn = "true";
		  zTree.setting.edit.showRenameBtn = true; 
		  zTree.setting.edit.removeTitle = "删除";
		   zTree.setting.edit.renameTitle = "编辑"; 
	}
		
		var pid;var pnode;
		function updateMenu(id){
			var url=ctx+"/account/menu/createII";
			if(id)url+="?id="+id;
			 $.dialog({
	          id: 'LHG1976D1',
	          content: "url:"+url,
	          lock:true,
	          title:"编辑菜单",
	          height:'auto',
	          width:550,
	          ok:function(){return this.content.okFunc();},
	          init:function(){ 
	          },
		       cancel: true
	      });
		}
		function addMenu(id){
		  if(!pid){
		    alert("请选择上级菜单");return ;
		  } 
		  $.dialog({
	          id: 'LHG1976D1',
	          content: "url:"+ctx+"/account/menu/createII?pid="+pid,
	          lock:true,
	          title:"新建菜单",
	          height:'auto',
	          width:550,
	          ok:function(){return this.content.okFunc();},
	          init:function(){ 
	          },
		       cancel: true
	      });
		}
		function toRemove(id){
	var f=confirm("确定删除吗？");
	if(f){
		$.ajax({
			url:ctx+"/account/menu/delete/"+id,
			dataType: 'json',
			success:function(d){
			  
				loadMenu();
			}
			
			
		}).fail(function(d){ alert(d.responseText); });
	}
}
		function afterSave(menu){
		loadMenu();
		return ;
		//alert($.toJSON(menu));
		 var zTree = $.fn.zTree.getZTreeObj("menuTree");
		 if(menu.add=="true")
		  zTree.addNodes(null, menu);
		 else 
		  {
		 // alert(1);
		  zTree.updateNode(menu);
		  }
		}
		
		function preMenu(){
		  if(!pid){
		    alert("请选择要移动的菜单");return ;
		  } 
		  var zTree = $.fn.zTree.getZTreeObj("menuTree");
		  if(pnode.getPreNode())
		    {
		    var node=[]; 
		  
		     var psort=(pnode.sortNo);
		     var preSortno= pnode.getPreNode().sortNo;
		   //  alert(psort+":"+preSortno);
		     node.push({id:pnode.id,sortNo:preSortno});
		     node.push({id:pnode.getPreNode().id,sortNo:psort});
		     updateSortNo(node);
		       zTree.moveNode(pnode.getPreNode(),pnode, "prev");
		    }
		}
		function afterMenu(){
		  if(!pid){
		    alert("请选择要移动的菜单");return ;
		  } 
		  var zTree = $.fn.zTree.getZTreeObj("menuTree");
		  if(pnode.getNextNode())
		   {
		   
		    var node=[]; 
		     var psort=pnode.sortNo;
		     var preSortno= pnode.getNextNode().sortNo;
		     node.push({id:pnode.id,sortNo:preSortno});
		     node.push({id:pnode.getNextNode().id,sortNo:psort});
		     updateSortNo(node);
		     zTree.moveNode(pnode,pnode.getNextNode(), "prev");
		    }
		}
	function updateSortNo(node){
	   $.ajax({
			url:ctx+"/account/menu/updateSortNo/",
			dataType: 'json',
			type:"POST",
			data:{pstr:$.toJSON(node)},
			success:function(d){
			   
			}
			
			
		}).fail(function() { alert("移动失败"); });
	
	}
	</script>
</head>

<body>
<div id="table_center_header">
                  菜单管理
       </div>
       <div id="table_center_info">
           <div id="table_center_info_header">本管理列表帮助你</div>
           <div id="table_center_info_text"> 修改菜单名称、删除菜单、移动菜单顺序
           </div>
       </div>
<div class="mtoolBar">
	<ul>
	 
	<li auth="menu:edit">
		<span class="out1">
		<img src="${ctx}/static/img/toolbar/16x16/icon_add.png">	</span>
		 <input onclick="addMenu()"  type="button" class="buttonRight"   id="add" value="添加菜单"  >
		 
	
	</li>
	 <li auth="menu:edit">
		<span class="out1">
		<img src="${ctx}/static/img/to_up.gif">	</span>
		 <input onclick="preMenu()"  type="button" class="buttonRight"   id="add" value="上移"  >
		 
	
	</li>
	<li auth="menu:edit">
		<span class="out1">
		<img src="${ctx}/static/img/to_down.gif">	</span>
		 <input onclick="afterMenu()"  type="button" class="buttonRight"   id="add" value="下移"  >
		 
	
	</li>
 
	 </ul>
	</div>
	
	
	<div style="height: 100%;">
	  <ul id="menuTree" class="ztree" style="height: 550px;width: 400px;"></ul>
	
	</div>
</body>
</html>
