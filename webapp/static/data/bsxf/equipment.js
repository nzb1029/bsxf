var ggridId="table_center_table";
$(function(){
	  //editauth="user:edit"; //用作修改删除按钮的权限控制
	  jQuery("#table_center_table").jqGrid({
          url: ctx + '/equipment/jqgrid',
          datatype: "json",
          colNames: ['编号', '区域', '位置', '数量', '类别', '巡检负责人', '巡检频率', '状态', '操作'],
          colModel: [
              {name: 'eno', index: 'eno', editable: false},
              {name: 'area', index: 'area', editable: false},
              {name: 'location', index: 'location', editable: false},
              {name: 'amount', index: 'amount', editable: false},
              {name: 'subTypeName', index: 'subTypeName', editable: false, sortable: false},
//              {
//                  name: 'productionDate',
//                  index: 'productionDate',
//                  editable: false,
//                  formatter: "date",
//                  formatoptions: {srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i:s'}
//              },
//              {
//                  name: 'productionDate2',
//                  index: 'productionDate2',
//                  editable: false,
//                  formatter: "date",
//                  formatoptions: {srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i:s'}
//              },
//              {
//                  name: 'productionDate3',
//                  index: 'productionDate3',
//                  editable: false,
//                  formatter: "date",
//                  formatoptions: {srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i:s'}
//              },
//              {
//                  name: 'effDate',
//                  index: 'effDate',
//                  editable: false,
//                  formatter: "date",
//                  formatoptions: {srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i:s'}
//              },
//              {
//                  name: 'expDate',
//                  index: 'expDate',
//                  editable: false,
//                  formatter: "date",
//                  formatoptions: {srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i:s'}
//              },
              {name: 'checkUser.name', index: 'checkUser.name', editable: false, sortable: false},
              {name: 'checkFreqDes', index: 'checkFreqDes', editable: false, sortable: false},
              {name: 'runStatusDes', index: 'runStatusDes', editable: false},
              {name: 'edit', index: 'edit', formatter: updateAndDel, sortable: false}
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
	 // jQuery("#"+ggridId).jqGrid('inlineNav',"#pjqgajax");
	  
	  
	 //查询按钮
	 $(".form-search").submit(function(){
	       var postData= $(this).serializeObject();
	       jQGridSupport.reloadGrid(ggridId,postData);
	    return false;
	 });
	 
});
function dwII(id,x,y,name){
	var url=ctx+"/baidu/dingwei?x="+x+"&y="+y+"&id="+id+"&eName="+encodeURIComponent(name);
	window.open(url);
}

function update(id){
	  var cn="添加";
	  var url=ctx+'/equipment/create/'+id;
   if(id) {
  	  cn="编辑";
   }
    $.dialog({
	          id: 'LHG1976D1',
	          content: "url:"+url,
	          lock:true,
	          title: cn+'灭火器',
	          height:500,
	          width:750,
	          ok:function(){return this.content.okFunc();},
	          init:function(){ 
	          },
		       cancel: true
	      });
	//window.location=ctx+"/equipment/create?id="+id;
	
}

function batchImp() {
	$('#importEquipmentList').click();
}

function importEquipmentList(obj) {
	var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	if(fileType != '.xls' && fileType != '.xlsx'){
        alert("请上传Excel文件");
		$(obj).val('');
	}else{
        //获取到选中的文件
        var file = obj.files[0];
        //创建formdata对象
        var formdata = new FormData();
        formdata.append("file", file);
        //创建xhr，使用ajax进行文件上传
        var xhr = new XMLHttpRequest();
        xhr.open("post",ctx+'/equipment/importEquipmentList');
        //回调
        xhr.onreadystatechange = function () {
            if (xhr.readyState==4 && xhr.status==200){
                $(obj).val('');
                var result = xhr.responseText;
                if (result == 'true') {
                    alert('导入成功');
                	afterSave();
                } else {
                	alert(result);
                }
            }
        }
        //获取上传的进度
        xhr.upload.onprogress = function (event) {
            if(event.lengthComputable){
                var percent = event.loaded/event.total *100;
                console.log(percent+"%");
            }
        }
        //将formdata上传
        xhr.send(formdata);
	}
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

function viewDetail(id){
      $.dialog({
	          id: 'LHG1976D12',
	          content: 'url:'+ctx+'/equipment/viewDetail/'+id,
	          lock:true,
	          title: '查看灭火器详情',
	          height:500,
	          width:600,
	          ok:false,
	          init:function(){//this.max();alert(123);
	           //this.max();
	          },
		      cancel: true//,
		    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
	      }); 
}