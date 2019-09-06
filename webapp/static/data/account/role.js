var ggridId="table_center_table";
editauth="role:edit";
$(function(){
	  jQuery("#"+ggridId).jqGrid({ 
			url:ctx+'/account/role/jqgrid', 
			datatype: "json", 
			colNames:['角色名','别名','说明' ,'操作'],
			colModel:[ 
			  {name:'roleName',index:'roleName asc, invdate', editable:false},
			  {name:'alias',index:'alias asc, invdate', editable:false},
			  {name:'remark',index:'remark asc, invdate', editable:false},
			  {name:'edit',index:'edit',formatter :updateAndDelII}
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
              cellEdit: true,
            
              postData:{aaa:"ssss"}
			    });
	 // jQuery("#contentTable").jqGrid('navGrid','#pjqgajax',{edit:false,add:false,del:false,search:false,refresh:true});
	  jQuery("#"+ggridId).jqGrid('inlineNav',"#pjqgajax");
	  
	  
	  //查询按钮
	 $(".form-search").submit(function(){
	       var postData= $(this).serializeObject();
	       jQGridSupport.reloadGrid(ggridId,postData);
	    return false;
	 });
	  
});
function updateAndDelII(value, options, rData){
	if(editauth)// 
	{
	   if(Permission[editauth]){
	   //igore
	   }else  return "";
	}
	return "<img  style=\"cursor: pointer;\" title='编辑' onclick=\"update('"+rData['id']+"')\" src='"+ctx+"/static/img/update.png' data-id='"+rData['id']+"'>"
	+"&nbsp;&nbsp;&nbsp;<img style=\"cursor: pointer;\"title='删除' onclick=\"toRemove('"+rData['id']+"')\" src='"+ctx+"/static/img/delete.png' data-id='"+rData['id']+"'>";
}
function update(id){ 
	window.location=ctx+"/account/role/create/"+id;
	
}
function batchDel(){
	var ids = jQGridSupport.getSelectRowIds(ggridId);
	var idary=[];
	for(var i=0;i<ids.length;i++){
		//if(ids[i]!='1')
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
			url:ctx+"/account/role/delete/"+id,
			dataType: 'json',
			success:function(d){
			 	jQGridSupport.reloadGrid(ggridId);
			 	alert("删除角色成功");
				
			}
			
			
		}).fail(function(d) {alert( d.responseText); });
	}
}
function distribUser(roleId){
 	 var ids = jQGridSupport.getSelectRowIds(ggridId);
 	 if(ids.length==0 || ids.length>1){
         alert("请至少且只能选择一个角色");return ;
       }
		 $.dialog({
	          id: 'LHG1976D1',
	          content: 'url:'+ctx+'/account/role/distribUser/'+ids[0],
	          lock:true,
	          title: '分配用户',
	          height:500,
	          width:900,
	          ok:function(){return this.content.okFunc();},
	         init:function(){//this.max();alert(123);
	         //this.max();
	         },
		      cancel: true//,
		    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
	      }); 
	 
}

 
function saveDistrib(userIds,olduserIds,roleId){
	$.ajax({
		url:ctx+"/account/role/saveDistrib",
		dataType: 'json',
		data:{userIds:userIds,olduserIds:olduserIds,roleId:roleId},
		success:function(d){
		 	jQGridSupport.reloadGrid(ggridId);
		 	alert("分配用户成功");
			
		}
		
		
	}).fail(function() { alert("发生了错误"); });
}

function distribMenu(roleId){
  var ids = jQGridSupport.getSelectRowIds(ggridId);
  if(ids.length==0 || ids.length>1){
      alert("请至少且只能选择一个角色");return ;
    }
		 $.dialog({
	          id: 'LHG1976D1',
	          content: 'url:'+ctx+'/account/role/distribMenu/'+ids[0],
	          lock:true,
	          title: '分配菜单',
	          height:500,
	          width:800,
	          ok:function(){return this.content.okFunc();},
	          init:function(){//this.max();alert(123);
	         //this.max();
	          },
		      cancel: true//,
		    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
	      }); 
	 
}
function distribAuth(roleId){
      var ids = jQGridSupport.getSelectRowIds(ggridId);
      if(ids.length==0){alert("请选择一个角色");return ;}
 
		 $.dialog({
	          id: 'LHG1976D1',
	          content: 'url:'+ctx+'/account/role/distribAuth/'+ids[0],
	          lock:true,
	          title: '分配权限',
	          height:500,
	          width:400,
	          ok:function(){return this.content.okFunc();},
	          init:function(){//this.max();alert(123);
	         //this.max();
	          },
		      cancel: true//,
		    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
	      }); 
	 
}
function saveDistribMenus(roleId,ids,permission){
	$.ajax({
		url:ctx+"/account/role/saveDistribMenu",
		dataType: 'json',
		data:{roleId:roleId,menuIds:ids.join(","),permission:permission},
		success:function(d){
		 	//jQGridSupport.reloadGrid(ggridId);
		 	alert("分配菜单权限成功");
			
		}
		
		
	}).fail(function() { alert("发生了错误"); });
	
}
