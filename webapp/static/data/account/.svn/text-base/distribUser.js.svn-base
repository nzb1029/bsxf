var ggridId="contentTable";
var api = frameElement.api, W = api.opener;
$(function(){
	  var userIds=$("input[name='userIds']").val();
	  var userArray=userIds.split(",");
	  jQuery("#"+ggridId).jqGrid({ 
			url:ctx+'/account/user/jqgrid', 
			datatype: "json", 
			colNames:['用户名','姓名','邮箱'],
			colModel:[ 
			  {name:'loginName',index:'loginName',  editable:false}, 
			  {name:'name',index:'name asc, invdate', editable:false},
			  {name:'email',index:'email'} 
			  ], 
			    rowNum:10,
			    multiselect: true,
			   // rownumbers: true,
			    rowList:[10,20,30], 
			    pager: '#pjqgajax',
			  //  sortname: 'id', 
			    viewrecords: true, 
			  //  sortorder: "desc", 
			    caption:"用户列表" ,
			    jsonReader:{
                repeatitems : false
              },
              width:800,
              height:250,
              cellEdit: true,
              afterInsertRow: function(rowid, aData){ 
            	  var userIds=$("input[name='userIds']").val();
            		var userArray=[];
            		if(userIds!="")
            		  userArray=userIds.split(",");
            	  for(var i=0;i<userArray.length;i++){
            		  if(userArray[i]==rowid){
            			  $("#jqg_"+ggridId+"_"+rowid).attr("checked",true);
            		  }
            	  }
             
              },
              onSelectRow:function(id,ckflg,c){
            	   var ids=[];
            	   ids.push(id);//转成数组
            	   ckSel(ids,ckflg);
           	       
              },
              onSelectAll: function (id,ckflg,c){
            	  ckSel(id,ckflg);
            	//  alert(a);alert(b);
              }
	  });
	 // jQuery("#contentTable").jqGrid('navGrid','#pjqgajax',{edit:false,add:false,del:false,search:false,refresh:true});
	  jQuery("#"+ggridId).jqGrid('inlineNav',"#pjqgajax");
	  
	  
	 
	  
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
	var userIds=$("input[name='userIds']").val();
	var olduserIds=$("input[name='olduserIds']").val();
	var roleId=$("input[name='roleId']").val();
	W.saveDistrib(userIds,olduserIds,roleId); 
	
}