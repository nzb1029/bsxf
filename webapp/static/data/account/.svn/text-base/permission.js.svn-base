var ggridId="table_center_table";
 editauth="permi:edit";
$(function(){
	  jQuery("#"+ggridId).jqGrid({ 
			url:ctx+'/permission/jqgrid', 
			datatype: "json", 
			colModel:[ 
			  {name:'name',index:'name',  editable:false,label:"权限名"}, 
			  {name:'val',index:'val',  editable:false,label:"权限值"},
			  {name:'menu.menuName',index:'menu.menuName', editable:false,label:"所属菜单"},
			  {name:'edit',index:'edit',formatter :updateAndDelII,label:"操作"}
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
	  jQuery("#"+ggridId).jqGrid('inlineNav',"#pjqgajax");
	  
	 //查询按钮
	 $(".form-search").submit(function(){
	       var postData= $(this).serializeObject();
	       jQGridSupport.reloadGrid(ggridId,postData);
	    return false;
	 });
	 
	
	
	////
	$("#createBtn").click(function(){
		  var mid="";  
		 var  permissionTree=$.fn.zTree.getZTreeObj("permissionTree"); 
		  ///alert(menuTree);
		  if(permissionTree.getSelectedNodes().length>0){
		       if(!permissionTree.getSelectedNodes()[0].isParent)
			   mid=permissionTree.getSelectedNodes()[0].id;
		   }
		  
	    $.dialog({
		          id: 'LHG1976D1',
		          content: 'url:'+ctx+'/permission/create?mid='+mid,
		          lock:true,
		          title: '编辑权限',
		          height:400,
		          width:600,
		          ok:false,//function(){return this.content.okFunc();},
		          init:function(){//this.max();alert(123);
		            //this.max();
		          },
			      cancel: true//,
			    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
		      }); 
	});
	  /////tree
	  
	  setting = {
				async: {
					enable: true,
					url: ctx+"/permission/menutree"
				},
				check: {
					enable: false
				},
				data: {
					key: {
						children: "children",
						name: "menuName",
						title: "",
						url: "url"
					    },
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "parentId"
					}
				},
				view: {
					expandSpeed: ""
				},
				callback: {
				onClick:function(a,b,c){
				    if(c.isParent){
				    jQGridSupport.reloadGrid(ggridId,{filter_menuid:""}); 
				    return ;}
                    var did=c.id;
                    if(!did)did="";
					jQGridSupport.reloadGrid(ggridId,{filter_menuid:did}); 
				}
				}
			};  
	    $.fn.zTree.init($("#permissionTree"), setting);	//refTree();
});

 function refTree(){
      
		//	 alert($.fn.zTree.init);
		   
     }
function update(id){ 
	 $.dialog({
		          id: 'LHG1976D2',
		          content: 'url:'+ctx+'/permission/create?id='+id,
		          lock:true,
		          title: '编辑权限',
		          height:400,
		          width:600,
		          ok:false,//function(){return this.content.okFunc();},
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
		alert("请至少选择一条记录");
	}
}
function toRemove(id){
	var f=confirm("确定删除吗？");
	if(f){
		$.ajax({
			url:ctx+"/permission/delete/"+id,
			dataType: 'json',
			success:function(d){
			 	jQGridSupport.reloadGrid(ggridId);
			 	alert("删除成功");
			}
			
			
		}).fail(function() { alert("error " ); });
	}
}
 