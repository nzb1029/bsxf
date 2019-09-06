var ggridId="contentTable";
var api = frameElement.api, W = api.opener;
$(function(){
	  var roleIds=$("input[name='roleIds']").val();
	  var roleArray=roleIds.split(",");
	  jQuery("#"+ggridId).jqGrid({ 
			url:ctx+'/account/role/jqgrid', 
			datatype: "json", 
			//colNames:['角色名'],
			colModel:[ 
			  {name:'name',index:'name',  editable:false,label:"角色名"}
			 // {name:'name',index:'name asc, invdate', editable:false},
			 // {name:'email',index:'email'} 
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
              width:500,
              height:250,
              cellEdit: true,
              afterInsertRow: function(rowid, aData){ 
            	  var roleIds=$("input[name='roleIds']").val();
            		var roleArray=[];
            		if(roleIds!="")
            		  roleArray=roleIds.split(",");
            	  for(var i=0;i<roleArray.length;i++){
            		  if(roleArray[i]==rowid){
            			  $("#jqg_"+ggridId+"_"+rowid).attr("checked",true);
            		  }
            	  }
             
            	//  alert(rowid);
            	 // switch (aData.name) {
            	 // case 'Client 1': jQuery("#ainsrow").jqGrid('setCell',rowid,'total','',{color:'green'}); break; 
            	//  case 'Client 2': jQuery("#ainsrow").jqGrid('setCell',rowid,'total','',{color:'red'}); break; 
            	//  case 'Client 3': jQuery("#ainsrow").jqGrid('setCell',rowid,'total','',{color:'blue'}); break; 
            	 // } 
              }
              ,onSelectRow:function(id,ckflg,c){
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
	var roleIds=$("input[name='roleIds']").val();
	var roleArray=[];
	if(roleIds!="")
	  roleArray=roleIds.split(",");
	var roleNames=$("input[name='roleNames']").val();
	var roleNameArray=[];
	if(roleNames!='')
	  roleNameArray=roleNames.split(",");
    for(var i=0;i<ids.length;i++){
    	if(flg){//选中
    		var hs=false; 
    		for(var j=0;j<roleArray.length;j++){
    			 if(roleArray[j]==ids[i])//原数组已经有了这个用户
    				 hs=true;
    		}
    		if(!hs){
    			roleArray.push(ids[i]);
    			var d= jQGridSupport.getRowData(ggridId,ids[i]);
    			roleNameArray.push( d.name );
    		}
    	}else {
    		var narray=[],nnameArray=[]; 
    		for(var j=0;j<roleArray.length;j++){
    			 if(roleArray[j]==ids[i])//原数组已经有了这个用户
    			  {
    				 
    			   }//delete  userArray[j];
    			 else {
    				 narray.push(roleArray[j]); 
    				 var d= jQGridSupport.getRowData(ggridId,roleArray[j]);
    				 nnameArray.push( d.name );
    				 
    			 }
    		}
    		roleArray=narray;
    		roleNameArray= nnameArray;
    	 
    		
    	}
    	
    }
    $("input[name='roleIds']").val(roleArray.join(","));	
    $("input[name='roleNames']").val(roleNameArray.join(","));	
    $("#viewName").html(roleNameArray.join(","));
	 
	
}

function okFunc(){
	var roleIds=$("input[name='roleIds']").val();
	var oldroleIds=$("input[name='oldroleIds']").val();
	var userId=$("input[name='userId']").val();
	W.saveDistrib(roleIds,oldroleIds,userId); 
	
}