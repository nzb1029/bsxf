var ggridId="contentTable";
 editauth="menu:edit";
$(function(){
	  jQuery("#"+ggridId).jqGrid({
			  treeGrid: true,
	          treeGridModel : 'adjacency',
	          ExpandColumn : 'menuName',
	           treeReader:{level_field: "level",
						  parent_id_field: "parentId",
						  leaf_field: "isLeaf",
						  expanded_field: "expanded",
						  loaded: "loaded",
						  icon_field: "icon"},
			  url:ctx+'/account/menu/jqgrid', 
			  datatype: "json", 
			  mtype: "GET",
			  colNames:['菜单名', '链接','排序','操作'],
			  colModel:[ 
				  {name:'menuName',index:'menuName',  editable:false}, 
				  {name:'link',index:'link asc, invdate', editable:false},
				  {name:'sortNo',index:'sortNo asc, invdate', editable:false},
				  {name:'edit',index:'edit',formatter :updateAndDelII}
			  ], 
			  pager: '#pjqgajax',
			  caption:"菜单列表" ,
              autowidth:true,
              height:'auto',
              gridview:true,
              treedatatype: 'json',
              jsonReader : {
            	    id: "id",
            	    repeatitems:false

            	}
             
              });
	 // jQuery("#contentTable").jqGrid('navGrid','#pjqgajax',{edit:false,add:false,del:false,search:false,refresh:true});
	  jQuery("#"+ggridId).jqGrid('inlineNav',"#pjqgajax");
	  
	  
	 
	  
});

function update(id){ 
	window.location=ctx+"/account/menu/create/"+id;
	
}
function batchDel(){
	var ids = jQGridSupport.getSelectRowIds(ggridId);
	var idary=[];
	for(var i=0;i<ids.length;i++){
		if(ids[i]!='1')
			idary.push(ids[i]);
	}
	if(idary.length>0){
		remove(idary.join(","));
	}
	else {
		alert("请至少选择一条除管理员之外的记录");
	}
}
function toRemove(id){
	var f=confirm("确定删除吗？");
	if(f){
		$.ajax({
			url:ctx+"/account/menu/delete/"+id,
			dataType: 'json',
			success:function(d){
			 	jQGridSupport.reloadGrid(ggridId);
			 	alert("删除菜单成功");
				
			}
			
			
		}).fail(function() { alert("发生了错误"); });
	}
}
 

function addMenu(pId){
	
	
}