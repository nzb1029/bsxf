var ggridId="contentTable";
$(function(){
	  jQuery("#"+ggridId).jqGrid({ 
			url:ctx+'/sys/emialSend/jqgrid', 
			datatype: "json", 
			colModel:[ 
			  {name:'host',index:'host',  editable:false,label:'SMTP服务器' },
		      {name:'username',index:'username',  editable:false,label:'用户名' },
		    //  {name:'password',index:'password',  editable:false,label:'密码' },
		      {name:'port',index:'port',  editable:false,label:'端口' },
		      {name:'subject',index:'subject',  editable:false,label:'主题' },
		      {name:'message',index:'message',  editable:false,label:'内容' },
		      {name:'toemail',index:'toemail',  editable:false,label:'接收者' },
		      {name:'fsend',index:'fsend',  editable:false,label:'是否发送',formatter:function(a,b,c){
		         if(a=='0')return "未发送";
		         else   if(a=='1')return "成功";
		         else   if(a=='2')return "<span style='color:red;'>失败</span>";
		         else return "";
		      } },
		      {name:'sendTime',index:'sendTime',  editable:false,label:'发送时间' ,formatter:"datetime",formatoptions: { srcformat:'u',newformat:'Y-m-d H:i:s'}}
		      
			// {name:'edit',index:'edit',align:"center",formatter :updateAndDelII,label:"操作"}
			  ], 
			    rowNum:10,
			    multiselect: true,
			    rownumbers:true,
			    rowList:[10,20,30], 
			    pager: '#pjqgajax',
			    viewrecords: true, 
			    caption:"邮箱发送记录"+"列表" ,
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

function update(id){ 
 	  var cn="添加";
	  var url=ctx+'/sys/emialSend/create'; 
     if(id) {
    	 url+="?id="+id;
    	 cn="编辑";
     }
      $.dialog({
	          id: 'LHG1976D1',
	          content: "url:"+url,
	          lock:true,
	          title: cn+"邮箱发送记录",
	          height:'auto',
	          width:850,
	          ok:function(){return this.content.okFunc();},
	          init:function(){ 
	          },
		       cancel: true
	      });
	//window.location=ctx+"/sys/emialSend/create?id="+id;
	
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
function toRemove(id){
	var f=confirm("确定删除吗？");
	if(f){
		$.ajax({
			url:ctx+"/sys/emialSend/delete/"+id,
			dataType: 'json',
			success:function(d){
			 	jQGridSupport.reloadGrid(ggridId);
			 	alert("删除成功");
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