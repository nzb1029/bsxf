var ggridId="contentTable";
$(function(){
	  jQuery("#"+ggridId).jqGrid({ 
			url:ctx+'/printTemp/jqgrid', 
			datatype: "json", 
			colModel:[ 
			   {name:'name',index:'name',  editable:false,label:"名称"},
			   {name:'alias',index:'alias',  editable:false,label:"别名"}, 
			   {name:'sqlStr',index:'sqlStr', editable:false,label:"SQL"},
			   {name:'edit',index:'edit',formatter :updateAndDel,label:"操作"},
			   {name:'demo',index:'demo',formatter:function(val,op,rowdata){
			       return "<a target='_black' href="+ctx+"/printTemp/demo/?alias="+rowdata['alias']+"&type=>demo</a>";
			   }, label:"示例"}
			  ], 
			    rowNum:10,
			    multiselect: true,
			    rowList:[10,20,30], 
			    pager: '#pjqgajax',
			    viewrecords: true, 
			    caption:"模板列表" ,
			    jsonReader:{
                   repeatitems : false
              },
              width:800,
              height:250,
              cellEdit: true,
              postData:{aaa:"ssss"}
	  });
	  jQuery("#"+ggridId).jqGrid('inlineNav',"#pjqgajax");
	  
	  
	 
	  
});

function update(id){ 
	window.location=ctx+"/printTemp/create?id="+id;
	
}
function batchDel(){
	var ids = jQGridSupport.getSelectRowIds(ggridId);
	var idary=[];
	for(var i=0;i<ids.length;i++){
			idary.push(ids[i]);
	}
	if(idary.length>0){
		remove(idary.join(","));
	}
	else {
		alert("请至少�?择一条除管理员之外的记录");
	}
}
function remove(id){
	var f=confirm("确定删除吗？");
	if(f){
		$.ajax({
			url:ctx+"/printTemp/delete/"+id,
			dataType: 'json',
			success:function(d){
			 	jQGridSupport.reloadGrid(ggridId);
			 	alert("删除成功");
			}
			
			
		}).fail(function() { alert("error " ); });
	}
}
 