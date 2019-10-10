var ggridId="table_center_table";
$(function(){
	  jQuery("#table_center_table").jqGrid({
          url: ctx + '/history/jqgrid',
          datatype: "json",
          colNames: ['灭火器编号', '区域', '位置', '数量', '状态', '巡检人', '巡检时间', '检查情况', '操作'],
          colModel: [
              {name: 'equipment.eno', index: 'e.eno', editable: false},
              {name: 'equipment.area', index: 'e.area', editable: false},
              {name: 'equipment.location', index: 'e.location', editable: false,},
              {name: 'equipment.amount', index: 'e.amount', editable: false},
              {name: 'runStatusDes', index: 'runStatus', editable: false},
              {name: 'checkUser.name', index: 'checkUser.name', editable: false, sortable: false},
              {
                  name: 'checkTime',
                  index: 'checkTime',
                  editable: false,
                  formatter: "datetime",
                  formatoptions: {srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i:s'}
              },
              {name: 'comments', index: 'comments', editable: false},
              {
                  name: 'edit', index: 'edit', formatter: function (value, options, rData) {
                      return "<a  style=\"cursor: pointer;\" title='详情' onclick=\"viewDetail('" + rData['id'] + "')\" >查看详情</a>";
                  }, sortable: false
              }
          ],
          rowNum: 10,
          //multiselect: true,
          rowList: [10, 20, 30],
          pager: '#pjqgajax',
          viewrecords: true,
          // caption:"地块列表" ,
          jsonReader: {
              repeatitems: false
          },
          autowidth: true,
          height: 'auto',
          cellEdit: true
      });
	 // jQuery("#"+ggridId).jqGrid('inlineNav',"#pjqgajax");
	  
	  
	 //查询按钮
	 $(".form-search").submit(function(){
	       var postData= $(this).serializeObject();
	       jQGridSupport.reloadGrid(ggridId,postData);
	    return false;
	 });
	 
});
//function dwII(id,x,y,name){
//	var url=ctx+"/baidu/dingwei?x="+x+"&y="+y+"&id="+id+"&eName="+encodeURIComponent(name);
//	window.open(url);
//}
//
//function update(id){ 
//	  var cn="添加";
//	  var url=ctx+'/block/create/'+id; 
//   if(id) {
//  	  cn="编辑";
//   }
//    $.dialog({
//	          id: 'LHG1976D1',
//	          content: "url:"+url,
//	          lock:true,
//	          title: cn+'地块',
//	          height:500,
//	          width:750,
//	          ok:function(){return this.content.okFunc();},
//	          init:function(){ 
//	          },
//		       cancel: true
//	      });
//	//window.location=ctx+"/equipment/create?id="+id;
//	
//}
//
//function batchDel(){
//	var ids = jQGridSupport.getSelectRowIds(ggridId);
//	var idary=[];
//	for(var i=0;i<ids.length;i++){
//			idary.push(ids[i]);
//	}
//	if(idary.length>0){
//		toRemove(idary.join(","));
//	}
//	else {
//		alert("请至少选择一条记录!");
//	}
//}
//function toRemove(id){
//	var f=confirm("确定删除吗？");
//	if(f){
//		$.ajax({
//			url:ctx+"/block/delete/"+id,
//			dataType: 'json',
//			success:function(d){
//				 	jQGridSupport.reloadGrid(ggridId);
//				 	alert("删除地块成功");
//				  
//				}
//			
//			
//		}).fail(function(d) { 
//		alert( d.responseText); });
//	}
//}

function afterSave(){
	 jQGridSupport.reloadGrid(ggridId);
}

function viewDetail(id){
      $.dialog({
	          id: 'LHG1976D12',
	          content: 'url:'+ctx+'/history/viewDetail/'+id,
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