var ggridId="contentTable";
$(function(){
	  jQuery("#"+ggridId).jqGrid({
			 
			  url:ctx+'/config/dictionary/jqgrid', 
			  datatype: "json", 
			  mtype: "GET",
			//  colNames:['规格名','类型','操作'],
			  colModel:[ 
				  {name:'name',index:'name',  editable:false,label:'字典名'}, 
				  //{name:'val',index:'val',label:'字典值'}, 
				  {name:'typeCode',index:'typeCode',  editable:false,label:'字典代码'}, 
				 // {name:'extFiled',index:'extFiled',  editable:false,label:'扩展值'}, 
				 // {name:'defaultFlg',index:'defaultFlg',  editable:false,label:'默认值'}, 
				  {name:'edit',width:30,index:'edit',formatter :updateAndDel,label:'操作'}
			  ], 
			  pager: '#pjqgajax',
			  caption:"字典列表" ,
			  autowidth:true,
              height:'100%',
              gridview:true,
              rowNum:15,
			  multiselect: true,
			  viewrecords: true, 
			  rowList:[10,20,30], 
              jsonReader : {
            	    id: "id",
            	    repeatitems:false

            	},
              subGrid : true, 
              subGridRowExpanded: function(subgrid_id, row_id) {
              			var subgrid_table_id, pager_id;
						subgrid_table_id = subgrid_id+"_t";
						pager_id = "p_"+subgrid_table_id;
						var rowData= jQGridSupport.getRowData(ggridId,row_id);
						$("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
						jQuery("#"+subgrid_table_id).jqGrid({
							url:ctx+'/config/dictionary/jqgrid?pid='+row_id,
							datatype: "json",
							colModel: [
								      {name:'name',index:'name',  editable:false,label:'字典名'}, 
									  {name:'val',index:'viewType',label:'字典值'}, 
									  {name:'typeCode',index:'typeCode',  editable:false,label:'字典代码'}, 
									  {name:'extFiled',index:'extFiled',  editable:false,label:'扩展值'}, 
									  {name:'defaultFlg',index:'defaultFlg',  editable:false,label:'默认值'}, 
									  {name:'status',index:'status',formatter:function(a,b,d){
									    if(d.status=='enabled')return "<a href=\"javascript:senabled('"+d["id"]+"','"+subgrid_table_id+"')\">是</a>";
									    else 
									    return "<a href=\"javascript:senabled('"+d["id"]+"','"+subgrid_table_id+"')\">否</a>";},  editable:false,label:'启用'}, 
								      {name:'edit',index:'edit',formatter :TO_UPANDDOWN,label:'操作'}
							],
						   	rowNum:20,
						   //	pager: pager_id,
						   	sortname: 'num',
						    sortorder: "asc",
						    height: '100%',
						    width:"840",
						    jsonReader : {
					            	    id: "id",
					            	    repeatitems:false
                                         },
                             gridComplete:function(a){
                                        //alert(jQuery("#"+subgrid_table_id).html());
				            		 	//jQuery("#"+subgrid_table_id).find("thead").hide();
				            	}
						});
              
              }
            //  subGridUrl: ctx+'/product/specification/specJqgrid', 
             // subGridNames: ['名称','图片','操作'],
            
              });
	 // jQuery("#contentTable").jqGrid('navGrid','#pjqgajax',{edit:false,add:false,del:false,search:false,refresh:true});
	  jQuery("#"+ggridId).jqGrid('inlineNav',"#pjqgajax");
	  
	  
	 
	  
});
function senabled(id,sid){
   $.ajax({
			url:ctx+"/config/dictionary/enabled/"+id,
			dataType: 'json',
			success:function(d){ 
			if(sid)
				jQGridSupport.reloadGrid(sid);
			else 
			 	jQGridSupport.reloadGrid(ggridId);
			
				
			}
			
			
		}).fail(function() { alert("发生了错误"); });

}
function update(id){ 
	window.location=ctx+"/config/dictionary/create?id="+id;
	
}
function batchDel(){
	var ids = jQGridSupport.getSelectRowIds(ggridId);
	var idary=[];
	for(var i=0;i<ids.length;i++){
		if(ids[i]!='1')
			idary.push(ids[i]);
	}
	if(idary.length>0){
		toRemove(idary.join(","));
	} else {
		alert("请至少选择一条记录");
	}
}
function toRemove(id,curSubGridId){
	var f=confirm("确定删除吗？");
	if(f){
		$.ajax({
			url:ctx+"/config/dictionary/delete/"+id,
			dataType: 'json',
			success:function(d){ 
			if(curSubGridId)
				jQGridSupport.reloadGrid(curSubGridId);
			else 
			 	jQGridSupport.reloadGrid(ggridId);
			 	alert("删除字典成功");
				
			}
			
			
		}).fail(function() { alert("发生了错误"); });
	}
}
function updateAndDel(value, options, rData){
	
	//alert($.toJSON(options));
		var str="<img  style=\"cursor: pointer;\" onclick=\"addSubValue('"+rData['id']+"','add','"+ggridId+"_"+rData['id']+"_t')\" src='"+ctx+"/static/img/add.gif' data-id='"+rData['id']+"'>"
	+"&nbsp;&nbsp;&nbsp;<img  style=\"cursor: pointer;\" onclick=\"update('"+rData['id']+"')\" src='"+ctx+"/static/img/update.png' data-id='"+rData['id']+"'>"
	+"&nbsp;&nbsp;&nbsp;<img style=\"cursor: pointer;\" onclick=\"toRemove('"+rData['id']+"')\" src='"+ctx+"/static/img/delete.png' data-id='"+rData['id']+"'>";
	
	//if(rData['level']=='0')//超级管理员
		//  str="<a href=\"javascript:addMenu('"+rData.id+"')\"> 添加</a>&nbsp;&nbsp;"+str;
   return str;
	
}
  
function afterSaveSpec(){ 
 jQGridSupport.reloadGrid(curSubGridId);
}
function deleteSpec(id,tabId){
var f=confirm("确定删除吗？");
if(f)
 $.ajax({
         url:ctx+"/product/specification/deleteSpecValue/"+id,
         dataType:"json",
         success:function(d){
        	 jQGridSupport.reloadGrid(tabId);
        	 alert("删除成功");
         }
         });
}
function addSubValue(pId,mt,subgrid){
        pId?pId:"";
        mt?mt:"";
		curSubGridId=subgrid;
	    $.dialog({
	          id: 'LHG1976D1',
	          content: "url:"+ctx+'/config/dictionary/create?id='+pId+"&mt="+mt,
	          lock:true,
	          title: '添加字典',
	          height:300,
	          width:650,
	          ok:function(){return this.content.okFunc();},
	          init:function(){//this.max();alert(123);
	         //this.max();
	          },
		       cancel: true
		    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
	      });
	
}
var curSubGridId="";
function TO_UPANDDOWN(value, options, rData){
			curSubGridId=options.gid;
			return "<img  style=\"cursor: pointer;\" onclick=\"addSubValue('"+rData['id']+"','edit','"+curSubGridId+"')\" src='"+ctx+"/static/img/update.png' data-id='"+rData['id']+"'>"
			+"&nbsp;&nbsp;&nbsp;<img style=\"cursor: pointer;\" onclick=\"toRemove('"+rData['id']+"','"+curSubGridId+"')\" src='"+ctx+"/static/img/delete.png' data-id='"+rData['id']+"'>"
			+"&nbsp;&nbsp;&nbsp;<img  style=\"cursor: pointer;\" onclick=\"toUp('"+rData['id']+"')\" src='"+ctx+"/static/img/to_up.gif' data-id='"+rData['id']+"'>"
			+"&nbsp;&nbsp;&nbsp;<img style=\"cursor: pointer;\" onclick=\"toDown('"+rData['id']+"')\" src='"+ctx+"/static/img/to_down.gif' data-id='"+rData['id']+"'>";
	 }
function imgUpdate(value, options, rData){
            //var img="<img id='img_"+rData["id"]+"' style='margin-top:4px;float:left' width=30 height=30 src='"+ctx+"/static-content?contentPath="+rData["imgUrl"]+"'>";
	       // var ipt="<input style='font-size:12px;' type='button' class=\"\" value='选择图片' onclick=\"selectImg('"+rData["id"]+"','"+options.gid+"')\">"
	        //if(!rData["imgUrl"])return ipt;
	      //  if(rData["specification"].viewType==1)
			//return "<img id='img_"+rData["id"]+"' style='margin-top:4px;float:left' width=30 height=30 src='"+ctx+"/static-content?contentPath="+rData["imgUrl"]+"'>"
				 //   +"&nbsp;&nbsp;<input style='font-size:12px;' type='button' class=\"\" value='选择图片' onclick=\"selectImg('"+rData["id"]+"','"+options.gid+"')\">";
		return "&nbsp;";
		}
var curimgId="";
function selectImg(id,subgridid){
		  curimgId=id;
		  curSubGridId=subgridid;
		  $.dialog({
	          id: 'LHG1976D1',
	          content: 'url:'+ctx+'/img/selectImg?type=规格',
	          lock:true,
	          title: '选择规格图片',
	          height:500,
	          width:750,
	          ok:function(){return this.content.okFunc();},
	          init:function(){//this.max();alert(123);
	         //this.max();
	          },
		     cancel: true//,
		    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
	      });
		
		}
function updateSubGrid(id,type,val){
 $.ajax({
         url:ctx+"/config/dictionary/sort",
         dataType:"json",
         data:{id:id,tp:type,val:val},
         success:function(d){
        	 jQGridSupport.reloadGrid(curSubGridId);
         }
         });
}
function seledImg(url){
       updateSubGrid(curimgId,"imgUrl",url); 
		  // $("#img_"+curimgId).attr("src",ctx+"/static-content?contentPath="+url);
		  // jQGridSupport.getRowData(ggridId,curimgId).imgUrl=url;
		}
function toDown(id){
	   updateSubGrid(id,"down"); 
}
function toUp(id){
	   updateSubGrid(id,"up"); 
}
function afterSaveSpec(){ 
 	jQGridSupport.reloadGrid(curSubGridId);
}