var ggridId="table_center_table";
$(function(){
      editauth="user:edit"; //用作修改删除按钮的权限控制
	  jQuery("#"+ggridId).jqGrid({ 
			url:ctx+'/account/user/jqgrid', 
			datatype: "json", 
			colNames:['登录名', '名称','邮箱','手机号','身份证','用户类型','过期时间','拥有角色','操作'],
			colModel:[ 
			  {name:'loginName',index:'loginName',  editable:false}, 
			  {name:'name',index:'name', editable:false},
			  {name:'email',index:'email', editable:false,sortable:false},
			  {name:'phoneNo',index:'phoneNo', editable:false,sortable:false},
			  {name:'cardNo',index:'cardNo', editable:false,sortable:false},
			  {name:'userTypeName',index:'userTypeName', editable:false},
			  {name:'expDate',index:'expDate',formatter:"date", editable:false},
			  {name:'roles',index:'roles'},
			  {name:'status',index:'status',formatter :updateAndDelII,sortable:false}
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
/** url:account/user/jqgrid
	expCols="name:姓名,loginName:登录名"
**/
function exp(){
	HZ.exportExcel(ctx+'/account/user/jqgrid',"name:姓名,loginName:登录名,email:邮箱,status:状态",{fs:"1111"});
}

function afterSave(){
	 jQGridSupport.reloadGrid(ggridId);
}

function update(id){ 
	  var cn="添加";
	  var url=ctx+'/account/user/create/'+id; 
   if(id == '0') {
  	  cn="编辑";
   }
    $.dialog({
	          id: 'LHG1976D1',
	          content: "url:"+url,
	          lock:true,
	          title: cn+'用户',
	          height:500,
	          width:800,
	          ok:function(){return this.content.okFunc();},
	          init:function(){ 
	          },
		       cancel: true
	      });
	//window.location=ctx+"/equipment/create?id="+id;
	
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
			url:ctx+"/account/user/delete/"+id,
			dataType: 'json',
			success:function(d){
				 	jQGridSupport.reloadGrid(ggridId);
				 	alert("删除用户成功");
				  
				}
			
			
		}).fail(function(d) { 
		alert( d.responseText); });
	}
}
function updateAndDel(value, options, rData){
if(editauth)//需要权限
	{
	   if(Permission[editauth]){
	   //igore
	   }else  return "";
	}
	if(rData['id']!='1')//超级管理员
		return "<img style=\"cursor: pointer;\" onclick=\"remove('"+rData['id']+"')\" src='"+ctx+"/static/img/delete.png' data-id='"+rData['id']+"'>"
		+"&nbsp;&nbsp;<a href=\"javascript:distribRole('"+rData['id']+"')\">分配角色</a> ";
	else return "&nbsp;&nbsp;<a href=\"javascript:distribRole('"+rData['id']+"')\">分配角色</a> ";
	
}

function distribRole(userId){
 
 //alert(window.parent.$.dialog);
		$.dialog({
	          id: 'LHG1976D1',
	          content: 'url:'+ctx+'/account/user/distribRole/'+userId,
	          lock:true,
	          title: '分配角色',
	          height:500,
	          width:600,
	          ok:function(){return this.content.okFunc();},
	          init:function(){//this.max();alert(123);
	           //this.max();
	          },
		      cancel: true//,
		    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
	      }); 
	 
}
function saveDistrib(roleIds,oldroleIds,userId){
	$.ajax({
		url:ctx+"/account/user/saveDistrib",
		dataType: 'json',
		data:{roleIds:roleIds,oldroleIds:oldroleIds,userId:userId},
		success:function(d){
		 	jQGridSupport.reloadGrid(ggridId);
		 	alert("分配角色成功");
			
		}
		
		
	}).fail(function() { alert("发生了错误"); });
}

function viewUserP(){
      var ids = jQGridSupport.getSelectRowIds(ggridId);
      if(ids.length==0 || ids.length>1){
        alert("请至少且只能选择一条记录");return ;
      }
      $.dialog({
	          id: 'LHG1976D12',
	          content: 'url:'+ctx+'/account/user/viewUserP/'+ids[0],
	          lock:true,
	          title: '查看用户权限',
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