jQGridSupport=function(){};
 jQGridSupport.getSelectRowIds=function(tabId){
	 var id = jQGridSupport.getParam(tabId,"selarrrow");
	 if (id) { 
		 return id;
	 }else return null;
	 
 } ;
 jQGridSupport.removeRow=function(tabId,rowNum){
	 var su=jQuery("#"+tabId).jqGrid('delRowData',rowNum);
	 if(su)
		 return true;
	 else 
		 return false;
 };
 jQGridSupport.updateRowData=function(tabId,rowid,data){
	 //data={amount:"333.00",tax:"33.00",total:"366.00",note:"<img src='images/user1.gif'/>"}
	 var su=jQuery("#"+tabId).jqGrid('setRowData',rowid,data);
	 if(su)
		 return true;
	 else 
		 return false;
 };
 jQGridSupport.addRowData=function(tabId,data){
	 //data={amount:"333.00",tax:"33.00",total:"366.00",note:"<img src='images/user1.gif'/>"}
	 var su=jQuery("#"+tabId).jqGrid('addRowData',-1,data);
	 if(su)
		 return true;
	 else 
		 return false;
 };
 jQGridSupport.clearRowData=function(tabId){
	 jQuery("#"+tabId).jqGrid('clearGridData',true);
	 
 };
 /**
 example:
	 'url'  ,'sortname' ,'sortorder' ,'selrow' ,'page' ,'rowNum' ,'datatype'
 	 ,'records'
 */
  jQGridSupport.getSelectedData=function(tabId){
	return jQuery("#"+tabId).jqGrid('getGridParam',"selarrrow");
 };
 jQGridSupport.getParam=function(tabId,param){
	return jQuery("#"+tabId).jqGrid('getGridParam',param);
 };
 jQGridSupport.getRowData=function(tabId,rowid){
		return jQuery("#"+tabId).jqGrid('getRowData',rowid);
	 };
jQGridSupport.getAllRowData=function(tabId){
		return jQuery("#"+tabId).getRowData();
	 };
jQGridSupport.getGridData=function(tabId){
		return jQuery("#"+tabId).jqGrid('getGridParam', 'data');
	};
jQGridSupport.setGridData=function(tabId,data){
		return jQuery("#"+tabId).jqGrid('setGridParam', 'data',data);
	};
 /**
    {url:"server.php?q=2"}
 return : jqgrid对象，可接着执行.trigger("reloadGrid")
 */
 jQGridSupport.setParam=function(tabId,param){
		return jQuery("#"+tabId).jqGrid('setGridParam',param);
	 };
	 
jQGridSupport.reloadGrid=function(tabId,postData){
			if(!postData)postData={};
			//jQGridSupport.setParam(tabId,{page:1});
			jQuery("#"+tabId).jqGrid('setGridParam',{postData:postData});
			return jQuery("#"+tabId).trigger("reloadGrid");
		 };
//["amount","tax"]		 
jQGridSupport.showCol=function(tabId,cols){
		 jQuery("#"+tabId).jqGrid('showCol',cols);
		 }
jQGridSupport.hideCol=function(tabId,cols){
		 jQuery("#"+tabId).jqGrid('hideCol',cols);
		 }
jQGridSupport.selectRow=function(tabId,rowid){
		 jQuery("#"+tabId).jqGrid('setSelection',rowid);
		 }
var editauth;	//用户在页面定义此变量来定义编辑删除需要的权限	 
function updateAndDel(value, options, rData){
	if(editauth)//需要权限
	{
	   if(Permission[editauth]){
	   //igore
	   }else  return "";
	}
	return "<img  style=\"cursor: pointer;\" onclick=\"update('"+rData['id']+"')\" src='"+ctx+"/static/img/update.png' data-id='"+rData['id']+"'>"
	+"&nbsp;&nbsp;&nbsp;<img style=\"cursor: pointer;\" onclick=\"remove('"+rData['id']+"')\" src='"+ctx+"/static/img/delete.png' data-id='"+rData['id']+"'>";
}
function updateAndDelII(value, options, rData){
	if(editauth)//需要权限
	{
	   if(Permission[editauth]){
	   //igore
	   }else  return "";
	}
	return "<img  style=\"cursor: pointer;\" title='编辑' onclick=\"update('"+rData['id']+"')\" src='"+ctx+"/static/img/update.png' data-id='"+rData['id']+"'>"
	+"&nbsp;&nbsp;&nbsp;<img style=\"cursor: pointer;\"title='删除' onclick=\"toRemove('"+rData['id']+"')\" src='"+ctx+"/static/img/delete.png' data-id='"+rData['id']+"'>";
}
function Del(value, options, rData){
	if(editauth)//需要权限
	{
	   if(Permission[editauth]){
	   //igore
	   }else  return "";
	}
	return "<img style=\"cursor: pointer;\" onclick=\"toRemove('"+rData['id']+"')\" src='"+ctx+"/static/img/delete.png' data-id='"+rData['id']+"'>";
}

jQGridSupport.bindText=function(value, options, rData,_act){
     if(!value) value="";
	 return "<input type='text' gid='"+options.gid+"' onchange='valChg(this)' data-index='"+options.colModel.index+"' data-id='"+rData["id"]+"' id='"+options.colModel.index+"_"+rData["id"]+"' value='"+value+"'/>";
}
/**
客户自己的验证重写该函数
*/
function validataVal(ipt){
	return true;
}
function valChg(ipt){
      if(!validataVal(ipt)){
         return ;
      }
      var gid=$(ipt).attr("gid");
      var val=$(ipt).val();
      var index=$(ipt).attr("data-index");
      var dId=$(ipt).attr("data-id");
      var data = jQGridSupport.getGridData(gid);
      for(var i=0;i<data.length;i++){
         if(data[i].id==dId){
            data[i][index]=val;
         }
      }
      
      
    //  alert($.toJSON(jQGridSupport.getGridData(gid)));
}

  /*扩展自定义格式*/
            jQuery.extend($.fn.fmatter, {
                userLinkFmatter: function (cellvalue, options, rowdata) {alert(123);
                    var op = { onclick: options.onclick };
                    alert(cellvalue);
                    var onclick = "";
                    if (!isUndefined(options.colModel.formatoptions)) {
                        op = $.extend({}, op, options.colModel.formatoptions);
                    }
                    if (op.onclick) { onclick = 'onclick="' + op.onclick + '(\'' + cellvalue + '\',\'' + rowdata + '\')"'; }
                    if (!isEmpty(cellvalue)) {
                        return "<a href='javascript:' " + onclick + ">" + cellvalue + "</a>";
                    } else {
                        return $.fn.fmatter.defaultFormat(cellvalue, options);
                    }
                }
            });

	   /*去掉自定义的样式，返回的是原始的数据格式*/
            jQuery.extend($.fn.fmatter.userLinkFmatter, {
                unformat: function (cellvalue, options) {
                    var valNum = cellvalue.toString().indexOf(">");
                    if (valNum >= 0) {
                        var html = cellvalue.substring(valNum + 1);
                        valNum = html.toString().indexOf("<");
                        html = html.substring(0, valNum);
                        return html;
                    }
                    else {
                        return cellvalue;
                    }
                }
            });
            
            
  //////
  function textchg(ipt,colname,id,gridId){
       var d = HZ.GridList[gridId];
       for(var i=0;i<d.length;i++){
          if(d[i].id==id){
            d[i][colname]=ipt.value;
          }
       }
  }
   jQuery.extend($.fn.fmatter, {
                text: function (val, options, rowdata) {  
                   /* var op = { onclick: options.onclick };
                    var onclick = "";
                    if ((options.colModel.formatoptions)) {
                        op = $.extend({}, op, options.colModel.formatoptions);
                    }
                    if (op.onclick) { onclick = 'onclick="' + op.onclick + '(\'' + cellvalue + '\',\'' + rowdata + '\')"'; }
                   */
                  // alert($.toJSON(options));
                  if(!val)val=rowdata[options.colModel.index];
                   var str="";
                    if(val)
                          str= "<input type=\"text\" onchange=\"textchg(this,'"+options.colModel.index+"','"+rowdata["id"]+"','"+options.gid+"')\" value='"+val+"'/>";
                    else   
                          str= "<input type=\"text\" onchange=\"textchg(this,'"+options.colModel.index+"','"+rowdata["id"]+"','"+options.gid+"')\"/>";
                  // alert(str);
                   return str;
                   /* if (!isEmpty(cellvalue)) {
                        return "<a href='javascript:' " + onclick + ">" + cellvalue + "</a>";
                    } else {
                        return $.fn.fmatter.defaultFormat(cellvalue, options);
                    }*/
                }
            });

	   /*去掉自定义的样式，返回的是原始的数据格式*/
            jQuery.extend($.fn.fmatter.text, {
                unformat: function (cellvalue, options) { 
                    var valNum = cellvalue.toString().indexOf(">");
                    if (valNum >= 0) {
                        var html = cellvalue.substring(valNum + 1);
                        valNum = html.toString().indexOf("<");
                        html = html.substring(0, valNum);
                        return html;
                    }
                    else {
                        return cellvalue;
                    }
                }
            });
 //////
  jQuery.extend($.fn.fmatter, {
                update_remove: function (cellvalue, options, rowdata) { 
                   return   "<img  style=\"cursor: pointer;\" onclick=\"update('"+rowdata['id']+"')\" src='"+ctx+"/static/img/update.png' data-id='"+rowdata['id']+"'>"
							+"&nbsp;&nbsp;&nbsp;<img style=\"cursor: pointer;\" onclick=\"remove('"+rowdata['id']+"')\" src='"+ctx+"/static/img/delete.png' data-id='"+rowdata['id']+"'>";
                }
            });
  jQuery.extend($.fn.fmatter, {
                update: function (cellvalue, options, rowdata) { 
                   return   "<img  style=\"cursor: pointer;\" onclick=\"update('"+rowdata['id']+"')\" src='"+ctx+"/static/img/update.png' data-id='"+rowdata['id']+"'>"
							;//+"&nbsp;&nbsp;&nbsp;<img style=\"cursor: pointer;\" onclick=\"remove('"+rowdata['id']+"')\" src='"+ctx+"/static/img/delete.png' data-id='"+rowdata['id']+"'>";
                }
            });
  jQuery.extend($.fn.fmatter, {
                remove: function (cellvalue, options, rowdata) { 
                   return "<img style=\"cursor: pointer;\" onclick=\"remove('"+rowdata['id']+"')\" src='"+ctx+"/static/img/delete.png' data-id='"+rowdata['id']+"'>";
                }
            });
    jQuery.extend($.fn.fmatter, {
                date: function (cellvalue, options, rowdata) { 
                       return   new Date(cellvalue).format("yyyy-MM-dd");
                }
            });
      jQuery.extend($.fn.fmatter, {
                datetime: function (cellvalue, options, rowdata) { 
                       return   new Date(cellvalue).format("yyyy-MM-dd hh:mm:ss");
                }
            }); 