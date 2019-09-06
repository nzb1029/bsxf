var ggridId="table_center_table";
$(function(){
	  jQuery("#"+ggridId).jqGrid({ 
			url:ctx+'/cost/jqgrid', 
			datatype: "json", 
			colNames:['地块名称','时间','传统 每公顷成本(元)','爱科农 每公顷成本(元)','操作'],
			colModel:[ 
			  {name:'block.name',index:'block.name',  editable:false}, 
			  {name:'time',index:'time',  editable:false,formatter:"date",formatoptions:{srcformat:'Y-m-d H:i:s',newformat:'Y-m-d H:i:s'}},
			  {name:'normalCost',index:'normalCost',formatter:"number",  editable:false},
			  {name:'aKLCost',index:'aKLCost',formatter:"number",  editable:false},
			  {name:'',index:'',formatter :updateAndDelII ,sortable:false}
			  ], 
			    rowNum:10,
			    multiselect: true,
			    rowList:[10,20,30], 
			    pager: '#pjqgajax',
			    viewrecords: true, 
			    jsonReader:{
                   repeatitems : false
              },
              autowidth:true,
              height:'auto',
              cellEdit: true 
             // postData:{aaa:"ssss"}
			    });
	  jQuery("#"+ggridId).jqGrid('inlineNav',"#pjqgajax");
	  
	  
	 //查询按钮
	 $(".form-search").submit(function(){
	       var postData= $(this).serializeObject();
	       jQGridSupport.reloadGrid(ggridId,postData);
	    return false;
	 });
	 
});

function update(id){ 
	  var cn="添加";
	  var url=ctx+'/cost/create/'+id; 
   if(id) {
  	  cn="编辑";
   }
    $.dialog({
	          id: 'LHG1976D1',
	          content: "url:"+url,
	          lock:true,
	          title: cn+'成本数据',
	          height:500,
	          width:750,
	          ok:function(){return this.content.okFunc();},
	          init:function(){ 
	          },
		       cancel: true
	      });
}
function afterSave(){
	 jQGridSupport.reloadGrid(ggridId);
}
function batchDel(){
	var ids = jQGridSupport.getSelectRowIds(ggridId);
	var idary=[];
	for(var i=0;i<ids.length;i++){
			idary.push(ids[i]);
	}
	if(idary.length>0){
		toRemove(idary.join(","));
	}
	else {
		alert("请至少选择一条记录!");
	}
}
function toRemove(id){
	var f=confirm("确定删除吗？");
	if(f){
		$.ajax({
			url:ctx+"/cost/delete/"+id,
			dataType: 'json',
			success:function(d){
				 	jQGridSupport.reloadGrid(ggridId);
				 	alert("删除成功");
				  
				}
			
			
		}).fail(function(d) { 
		alert( d.responseText); });
	}
}