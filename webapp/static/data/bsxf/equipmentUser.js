var ggridId="table_center_table";
$(function(){
	  //editauth="user:edit"; //用作修改删除按钮的权限控制
	  jQuery("#table_center_table").jqGrid({ 
			url:ctx+'/equipment/jqgrid', 
			datatype: "json", 
			colNames:['编号','区域', '位置','类别','有效起期','有效止期','巡检负责人','巡检频率','状态','操作'],
			colModel:[ 
			  {name:'eno',index:'eno', editable:false}, 
			  {name:'area',index:'area',  editable:false}, 
			  {name:'location',index:'location', editable:false,},
			  {name:'subTypeName',index:'subTypeName',editable:false,sortable:false},
			  {name:'effDate',index:'effDate',editable:false,formatter:"date",formatoptions:{srcformat:'Y-m-d H:i:s',newformat:'Y-m-d H:i:s'}},
			  {name:'expDate',index:'expDate', editable:false,formatter:"date",formatoptions:{srcformat:'Y-m-d H:i:s',newformat:'Y-m-d H:i:s'}},
			  {name:'checkUser.name',index:'checkUser.name', editable:false,sortable:false},
			  {name:'checkFreqDes',index:'checkFreqDes', editable:false,sortable:false},
			  {name:'runStatusDes',index:'runStatusDes',editable:false},
			  {name:'edit',index:'edit', formatter :function(value, options, rData){
				  return "<a  style=\"cursor: pointer;\" title='详情' onclick=\"viewDetail('"+rData['id']+"')\" >查看详情</a>";
			  },sortable:false}
			  ], 
			    rowNum:10,
			    //multiselect: true,
			    rowList:[10,20,30], 
			    pager: '#pjqgajax',
			    viewrecords: true, 
			   // caption:"地块列表" ,
			    jsonReader:{
                   repeatitems : false
              },
              autowidth:true,
              height:'auto',
              cellEdit: true 
			    });
	 //查询按钮
	 $(".form-search").submit(function(){
	       var postData= $(this).serializeObject();
	       jQGridSupport.reloadGrid(ggridId,postData);
	    return false;
	 });
	 
});


function viewDetail(id){
      $.dialog({
	          id: 'LHG1976D12',
	          content: 'url:'+ctx+'/equipment/viewDetail/'+id,
	          lock:true,
	          title: '查看巡检记录详情',
	          height:600,
	          width:700,
	          ok:false,
	          init:function(){//this.max();alert(123);
	           //this.max();
	          },
		      cancel: true//,
		    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
	      }); 
}