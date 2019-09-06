var ggridId="contentTable";
$(function(){
	  jQuery("#"+ggridId).jqGrid({ 
			url:ctx+'/account/user/jqgridselect', 
			datatype: "json", 
			colNames:['','登录名', '名称','邮箱','手机号','身份证','用户类型','过期时间','拥有角色'],
			colModel:[ 
			          {name:'id',index:'id',editable:false,formatter:function(a,b,c){
			        	  	return "<input type='radio' qname='"+c.name+"' name='singselect' value='"+c.id+"'/>";
			          } },
			  {name:'loginName',index:'loginName',  editable:false}, 
			  {name:'name',index:'name', editable:false},
			  {name:'email',index:'email', editable:false,sortable:false},
			  {name:'phoneNo',index:'phoneNo', editable:false,sortable:false},
			  {name:'cardNo',index:'cardNo', editable:false,sortable:false},
			  {name:'userTypeName',index:'userTypeName', editable:false},
			  {name:'expDate',index:'expDate',formatter:"date", editable:false},
			  {name:'roles',index:'roles'}
			  ], 
			    rowNum:10,
			    multiselect: false,
			    rowList:[10,20,30], 
			    pager: '#pjqgajax',
			    viewrecords: true, 
			    caption:"用户列表" ,
			    jsonReader:{
                   repeatitems : false
              },
              width:800,
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
function afterSave(){
	 jQGridSupport.reloadGrid(ggridId);
}
