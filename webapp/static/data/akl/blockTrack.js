var ggridId="table_center_table";
$(function(){
	  jQuery("#"+ggridId).jqGrid({ 
			url:ctx+'/track/jqgrid', 
			datatype: "json", 
			colNames:['创建时间','地块名称','病虫害预警','病虫防治方案','预计收获时间','本周工作建议','操作'],
			colModel:[ 
			  {name:'createTime',index:'create_time',  editable:false,formatter:"date",formatoptions:{srcformat:'Y-m-d H:i:s',newformat:'Y-m-d H:i:s'}}, 
			  {name:'block.name',index:'block.name',  editable:false}, 
			  {name:'bchyj',index:'bchyj',  editable:false,sortable:false},
			  {name:'bcfzfa',index:'bcfzfa',  editable:false,sortable:false},
			  {name:'yjshsj',index:'yjshsj',  editable:false,sortable:false},
			  {name:'bzgzjy',index:'bzgzjy',  editable:false,sortable:false}, 
			  {name:'status',index:'status',formatter :updateAndDelII ,sortable:false}
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
	  var url=ctx+'/track/create/'+id; 
   if(id) {
  	  cn="编辑";
   }
    $.dialog({
	          id: 'LHG1976D1',
	          content: "url:"+url,
	          lock:true,
	          title: cn+'地块实时监控数据',
	          height:500,
	          width:750,
	          ok:function(){return this.content.okFunc();},
	          init:function(){ 
	          },
		       cancel: true
	      });
	//window.location=ctx+"/equipment/create?id="+id;
	
}
function afterSave(){
	 jQGridSupport.reloadGrid(ggridId);
}

function viewDetail(id){
      $.dialog({
	          id: 'LHG1976D12',
	          content: 'url:'+ctx+'/block/viewDetail/'+id,
	          lock:true,
	          title: '查看地块实时监控数据详情',
	          height:500,
	          width:600,
	          ok:false,
	          init:function(){//this.max();alert(123);
	           //this.max();
	          },
		      cancel: true//,
		    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
	      }); 
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
			url:ctx+"/track/delete/"+id,
			dataType: 'json',
			success:function(d){
				 	jQGridSupport.reloadGrid(ggridId);
				 	alert("删除实时监控数据成功");
				  
				}
			
			
		}).fail(function(d) { 
		alert( d.responseText); });
	}
}