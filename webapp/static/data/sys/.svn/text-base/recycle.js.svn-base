var ggridId="contentTable";
$(function(){
	  jQuery("#"+ggridId).jqGrid({ 
			url:ctx+'/sys/recycle/jqgrid', 
			datatype: "json", 
			colModel:[ 
			  {name:'tablec',index:'tablec',  editable:false,label:'表名' },
		      {name:'tableName',index:'tableName',  editable:false,label:'表中文名' },
		      {name:'col',index:'col',  editable:false,label:'列值' },
		      {name:'colName',index:'colName',  editable:false,label:'列文名' },
		       {name:'loginName',index:'loginName',  editable:false,label:'删除人' },
		      {name:'createTime',index:'createTime',  editable:false,label:'删除时间',formatter:function(a,b,rd){
		        return   new Date(a).format("yyyy-MM-dd hh:mm:ss");
		      }  },
			  {name:'edit',index:'edit',align:"center",formatter :function(a,b,rd){
			    return "<a href =# onclick=view('"+rd.id+"')>详情</a>&nbsp;&nbsp;<a onclick=restore('"+rd.id+"')>恢复</a>";
			  
			  },label:"操作"}
			  ], 
			    rowNum:10,
			   // multiselect: true,
			    rownumbers:true,
			    rowList:[10,20,30], 
			    pager: '#pjqgajax',
			    viewrecords: true, 
			    caption:"回收站"+"列表" ,
			    jsonReader:{
                   repeatitems : false
              },
              autowidth:true,
              //width:800,
              height:'100%',
              cellEdit: true,
              postData:{aaa:"ssss"}
	  });
	  jQuery("#"+ggridId).jqGrid('inlineNav',"#pjqgajax");
	  
	 //查询按钮
	 $(".form-search").submit(function(){
	       var postData= $(this).serializeObject();
	       jQGridSupport.reloadGrid(ggridId,postData);
	    return false;
	 });
	 
	  
});

 
function view(id){ 
 	 
	  var url=ctx+'/sys/recycle/detail'; 
     if(id) {
    	 url+="?id="+id;
    	 
     }
      $.dialog({
	          id: 'LHG1976D1',
	          content: "url:"+url,
	          lock:true,
	          title: "详情",
	          height:'auto',
	          width:910,
	          ok:function(){return this.content.okFunc();},
	          init:function(){ 
	          },
		       cancel: true
	      });
	//window.location=ctx+"/sys/recycle/create?id="+id;
	
}
function update(){
var f=confirm("确定入库吗？");
	if(f){
		$.ajax({
			url:ctx+"/sys/recycle/instore/",
			dataType: 'json',
			success:function(d){
			 	jQGridSupport.reloadGrid(ggridId);
			 	alert("入库成功");
			}
			
			
		}).fail(function() { alert("error " ); });
	}
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
		alert("请至少选择一条记录");
	}
}
function restore(id){
	var f=confirm("确定恢复吗？");
	if(f){
		$.ajax({
			url:ctx+"/sys/recycle/restore/"+id,
			dataType: 'json',
			success:function(d){
			 	jQGridSupport.reloadGrid(ggridId);
			 	alert("恢复成功");
			}
			
			
		}).fail(function() { alert("error " ); });
	}
}
 function afterSave(){
 jQGridSupport.reloadGrid(ggridId);
}
function exp(){
   HZ.expGrid(ggridId,null,null,false);
}