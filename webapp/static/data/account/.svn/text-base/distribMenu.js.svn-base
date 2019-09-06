var ggridId="contentTable";
var api = frameElement.api, W = api.opener;
$(function(){
	  var roleId=$("input[name='roleId']").val();
	 
	  var setting = {
				async: {
					enable: true,
					url: ctx+"/account/role/menuTree/"+roleId
				},
				check: {
					enable: true
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
				callback: {
					  onClick: function(a,b,c){
					  	  if(c.isParent){
						    jQGridSupport.reloadGrid(ggridId,{filter_menuid:""}); 
						    return ;}
		                    var did=c.id;
		                    if(!did)did="";
							jQGridSupport.reloadGrid(ggridId,{filter_menuid:did}); 
					  }
					//beforeExpand: beforeExpand,
					//onNodeCreated: onNodeCreated,
				   // onAsyncSuccess: onAsyncSuccess
					//onAsyncError: onAsyncError
				}
			};
			
		  $.fn.zTree.init($("#menuTree"), setting);	
		
	  
	 
	  
});
function ckSel(ids,flg){
	var userIds=$("input[name='userIds']").val();
	var userArray=[];
	if(userIds!="")
	  userArray=userIds.split(",");
	var userNames=$("input[name='userNames']").val();
	var userNameArray=[];
	if(userNames!='')
	  userNameArray=userNames.split(",");
    for(var i=0;i<ids.length;i++){
    	if(flg){//选中
    		var hs=false; 
    		for(var j=0;j<userArray.length;j++){
    			 if(userArray[j]==ids[i])//原数组已经有了这个用户
    				 hs=true;
    		}
    		if(!hs){
    			userArray.push(ids[i]);
    			var d= jQGridSupport.getRowData(ggridId,ids[i]);
    			userNameArray.push(d.loginName+"["+d.name+"]");
    		}
    	}else {
    		var narray=[],nnameArray=[]; 
    		for(var j=0;j<userArray.length;j++){
    			 if(userArray[j]==ids[i])//原数组已经有了这个用户
    			  {
    				 
    			   }//delete  userArray[j];
    			 else {
    				 narray.push(userArray[j]); 
    				 var d= jQGridSupport.getRowData(ggridId,userArray[j]);
    				 nnameArray.push(d.loginName+"["+d.name+"]");
    				 
    			 }
    		}
    		userArray=narray;
    		userNameArray= nnameArray;
    	 
    		
    	}
    	
    }
    $("input[name='userIds']").val(userArray.join(","));	
    $("input[name='userNames']").val(userNameArray.join(","));	
    $("#viewName").html(userNameArray.join(","));
	 
	
}

function okFunc(){
	var roleId=$("input[name='roleId']").val();   
	var treeObj = $.fn.zTree.getZTreeObj("menuTree");
	var nodes = treeObj.getCheckedNodes(true);
	var ids=[];
	 for(var i=0;i<nodes.length;i++){
		 ids.push(nodes[i].id);//选中节点的ID
	 }
	 var permission=$("input[name='permission']").val();   
	W.saveDistribMenus(roleId,ids,permission); 
	
}