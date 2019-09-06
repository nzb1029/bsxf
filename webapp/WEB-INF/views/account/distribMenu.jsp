<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/jqgrid.jsp" %>
<%@ include file="/WEB-INF/common/dztree.jsp" %>
<html>
<head>
	<title>分配菜单权限</title>
	<script type="text/javascript" src="${ctx }/static/data/account/distribMenu.js"></script>
	<script>
	    var ggridId="contentTable";
		$(document).ready(function() {
		  jQuery("#"+ggridId).jqGrid({ 
			url:ctx+'/account/role/loadauth?roleid='+$("input[name='roleId']").val(), 
			datatype: "json", 
			colNames:['权限名','权限值','所属菜单'],
			colModel:[ 
			 // {name:'loginName',index:'loginName',  editable:false}, 
			  {name:'name',index:'name asc, invdate', editable:false},
			  {name:'val',index:'val'},
			  {name:'menu.menuName',index:'menu.menuName'}
			  ], 
			    rowNum:100,
			    multiselect: true,
			   // rownumbers: true,
			    //rowList:[10,20,30], 
			   // pager: '#pjqgajax',
			  //  sortname: 'id', 
			    viewrecords: true, 
			  //  sortorder: "desc", 
			    caption:"权限列表" ,
			    jsonReader:{
                 repeatitems : false
              },
              width:500,
              height:250,
              cellEdit: true
              ,onSelectRow:function(id,ckflg,c){
            	   var ids=[];
            	   ids.push(id);//转成数组
            	   ckSel(ids,ckflg);
           	       
              },
              onSelectAll: function (id,ckflg,c){
            	  ckSel(id,ckflg);
            	//  alert(a);alert(b);
              },
              afterInsertRow: function(rowid, aData){ 
            	  var  permission= $("input[name='permission']").val();
            	  if(permission!=''){
            	      var ps=permission.split(",");
            	      for(var i=0;i<ps.length;i++){
            		  if(ps[i]==aData.val){
            		 	  $("#jqg_"+ggridId+"_"+rowid).attr("checked",true);
            		   }
            	    }
            	  }
            	
            	  }
			    });
	 // jQuery("#contentTable").jqGrid('navGrid','#pjqgajax',{edit:false,add:false,del:false,search:false,refresh:true});
	 		  jQuery("#"+ggridId).jqGrid('inlineNav',"#pjqgajax");
		});
		
		function ckSel(ids,flg){
		    var permission=$("input[name='permission']").val();
		    var ps=[];
		    if(permission!='')ps=permission.split(",");
		   // for(var j=0;j)
		    for(var i=0;i<ids.length;i++){
		       if(flg){
		        var d=jQGridSupport.getRowData(ggridId,ids[i]);
		        var hs=false;
		         for(var j=0;j<ps.length;j++){
		            if(ps[j]==d.val){
		              hs=true;
		            }
		         }
		         if(!hs){
		            ps.push(d.val);
		         }
		       }else {
		           var nps=[];
		           var d=jQGridSupport.getRowData(ggridId,ids[i]);
		           for(var j=0;j<ps.length;j++){
		            if(ps[j]!=d.val){
		             nps.push(ps[j]);
		            }
		            }
		            ps=nps;
		       }
		    }
		    ////
		  $("input[name='permission']").val(ps.join(","))  ;
		}
	</script>
</head>

<body style="padding-left: 20px;">

	<fieldset>
    <legend><small>当前角色：${role.roleName }</small></legend>
        <form action="" id="inputForm" style="display: none;">
              <input type="hidden" name="roleId" value="${role.id }">
              <input type="hidden" name="permission" value="${role.permissions }">
         </form>
      <table><tr><td>
       <ul id="menuTree" class="ztree"></ul>
       </td>
       <td valign="top">
        <table id="contentTable"></table>
	      <div id="pjqgajax"></div>
       </td>
       </tr></table>
       
</fieldset>
</body>
</html>
