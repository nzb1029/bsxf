var ggridId="table_center_table";
$(function(){
	  //editauth="user:edit"; //用作修改删除按钮的权限控制
	  jQuery("#table_center_table").jqGrid({
          url: ctx + '/equipment/jqgrid',
          datatype: "json",
          colNames: ['编号', '区域', '位置', '数量', '类别', '设备1出厂日期', '设备2出厂日期', '设备3出厂日期','巡检负责人', '巡检频率', '状态'],
          colModel: [
              {name: 'eno', index: 'eno', editable: false},
              {name: 'area', index: 'area', editable: false},
              {name: 'location', index: 'location', editable: false},
              {name: 'amount', index: 'amount', editable: false},
              {name: 'subTypeName', index: 'subTypeName', editable: false, sortable: false},
              {
                  name: 'productionDate',
                  index: 'productionDate',
                  editable: false,
                  formatter: "date",
                  formatoptions: {srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i:s'}
              },
              {
                  name: 'productionDate2',
                  index: 'productionDate2',
                  editable: false,
                  formatter: "date",
                  formatoptions: {srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i:s'}
              },
              {
                  name: 'productionDate3',
                  index: 'productionDate3',
                  editable: false,
                  formatter: "date",
                  formatoptions: {srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i:s'}
              },
              {name: 'checkUser.name', index: 'checkUser.name', editable: false, sortable: false},
              {name: 'checkFreqDes', index: 'checkFreqDes', editable: false, sortable: false},
              {name: 'runStatusDes', index: 'runStatusDes', editable: false}
          ],
          rowNum: 10,
          multiselect: true,
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
	 //查询按钮
	 $(".form-search").submit(function(){
	       var postData= $(this).serializeObject();
	       jQGridSupport.reloadGrid(ggridId,postData);
	    return false;
	 });
	 
});

function batchPrint(){
	var ids = jQGridSupport.getSelectRowIds(ggridId);
	var idary=[];
	for(var i=0;i<ids.length;i++){
	    idary.push(ids[i]);
	}
	if(idary.length>0){
		toPrint(idary);
	}
	else {
		alert("请至少选择一条记录!");
	}
}

function toPrint(ids){
    $.ajax({
        type: "POST",
        url:ctx+"/equipment/generateQrcodefile",
        data: JSON.stringify(ids),
        contentType:'application/json;charset=utf-8',
        success:function(d){
            if (d == "") {
                alert("下载失败，请重试")
            } else {
                window.location.href = ctx + "/equipment/downloadQrcodefile/" + d;
                alert("下载二维码...");
            }
            jQGridSupport.reloadGrid(ggridId);
        }
    }).fail(function(d) {
        alert( d.responseText);
    });
}
 
function printAll(){
    toPrint([]);
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
			url:ctx+"/equipment/delete/"+id,
			dataType: 'json',
			success:function(d){
				 	jQGridSupport.reloadGrid(ggridId);
				 	alert("删除设备成功");
				  
				}
			
			
		}).fail(function(d) { 
		alert( d.responseText); });
	}
}

function afterSave(){
	 jQGridSupport.reloadGrid(ggridId);
}