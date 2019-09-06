var DATE_DELIMITER="-";       //日期分隔符
var MAX_INTEGER  = Math.pow(2,31) - 1;
var MIN_INTEGER  = -MAX_INTEGER;

String.prototype.replaceAll =function(AFindText,ARepText){ 
	var raRegExp = new RegExp(AFindText.replace(/([\(\)\[\]\{\}\^\$\+\-\*\?\.\"\'\|\/\\])/g,"\\$1"),"ig"); 
	return this.replace(raRegExp,ARepText); 
}

String.prototype.toDate = function()
{
        try
        {
                return new Date(this.replace(/-/g, "\/"));
        }
        catch(e)
        {
                return null;
        }
};
String.prototype.startWith=function(str){
  var reg=new RegExp("^"+str);
  return reg.test(this);
}

String.prototype.endWith=function(str){
  var reg=new RegExp(str+"$");
  return reg.test(this);
}
Date.prototype.addDate=function(  days )
{
    var tempDate = this.valueOf();
    tempDate = tempDate + days * 24 * 60 * 60 * 1000;
    tempDate = new Date(tempDate);
    return tempDate;
};

Date.prototype.format = function(style) {
	if(style==undefined || style==null) style="yyyy-MM-dd";
	var o = {
		"M+" : this.getMonth() + 1, //month
		"d+" : this.getDate(),      //day
		"h+" : this.getHours(),     //hour
		"m+" : this.getMinutes(),   //minute
		"s+" : this.getSeconds(),   //second
		"w+" : "天一二三四五六".charAt(this.getDay()),   //week
		"q+" : Math.floor((this.getMonth() + 3) / 3), //quarter
		"S" : this.getMilliseconds() //millisecond
	}
	if(/(y+)/.test(style)) {
		style = style.replace(RegExp.$1,
		(this.getFullYear() + "").substr(4 - RegExp.$1.length));
	}
	for(var k in o){
		if(new RegExp("("+ k +")").test(style)){
			style = style.replace(RegExp.$1,
			RegExp.$1.length == 1 ? o[k] :
			("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return style;
};


jQuery.iAreaCascade = {
			   bind:function(){
			         var province=this;
			   	     var cascade=$(province).attr("cascade");
			   	     var city=$("#"+cascade);
			   	         cascade=$(city).attr("cascade");
			   	     var area= $("#"+cascade);
			   	     $("<option value=\"\">"+"--请选择--"+"</option>").appendTo(province);
					 for(var i=0;i<areaList.length;i++){
						  	$("<option value=\""+areaList[i].id+"\">"+areaList[i].name+"</option>").appendTo(province);
					  }
			         province.bind("change",function(){
			             var val=$(this).val();
			             area.empty();
			             if(val==''){
			                  city.empty();return ;
			             }
			             city.empty().append("<option value=\"\">"+"--请选择--"+"</option>");
			             for(var i=0;i<areaList.length;i++){
			                 if(areaList[i].id==val){
			                    var cityList=areaList[i].list;
			                    jQuery.iAreaCascade.curProvince= areaList[i];
			                      for(var j=0;j<cityList.length;j++){
			                     	 $("<option value=\""+cityList[j].id+"\">"+cityList[j].name+"</option>").appendTo(city);
			                      }
			                    
			                    break;
			                 }
			             }
			         
			         });
			         city.bind("change",function(){
			                var val=$(this).val();
			                area.empty().append("<option value=\"\">"+"--请选择--"+"</option>");
			                var p=jQuery.iAreaCascade.curProvince;
			                for(var i=0;i<p.list.length;i++){
			                   if(p.list[i].id==val){
			                      var aList=p.list[i].list;
			                      for(var j=0;j<aList.length;j++){
			                     	 $("<option value=\""+aList[j].id+"\">"+aList[j].name+"</option>").appendTo(area);
			                      }
			                     break;
			                   }
			                }
			         });
			       },
			      update:function(pId,cId,aId){
					       var cascade=$(this).attr("cascade");
					   	   var city=$("#"+cascade);
					   	         cascade=$(city).attr("cascade");
					   	   var area= $("#"+cascade);
			               $(this).find("option").attr("selected",false);
					       $(this).find("option[value='"+pId+"']").attr("selected",true);
					       $(this).change();
					       city.find("option").attr("selected",false);
					       city.find("option[value='"+cId+"']").attr("selected",true);
					       city.change();
					       area.find("option[value='"+aId+"']").attr("selected",true);
			      
			      } 
			       
			}
jQuery.fn.areaCascade=jQuery.iAreaCascade.bind;
jQuery.fn.update=jQuery.iAreaCascade.update;


function GetRequest() {
		   var url = location.search; //获取url中"?"符后的字串
		   var theRequest = new Object();
		   if (url.indexOf("?") != -1) {
		      var str = url.substr(1);
		      strs = str.split("&");
		      for(var i = 0; i < strs.length; i ++) {
		         theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
		      }
		   }
		   return theRequest;
		}
var $request = new Object();
$request = GetRequest();
///选择用户
/**
 callback: 回掉的父页面的函数
 mt:true,至少选一条
 single:true,单选，否则多选
 
  
*/
HZ=function(){};
HZ.GridList={};
HZ.selectUser=function(callback,must,single,autoId){
		  var mt=false;
            if(must)mt=true;
          var sg=false
            if(single)sg=true;
          var autoIds="";
             if(autoId) autoIds=autoId; 
  			$.dialog({
		          id: 'LHG1980D1',
		          content: "url:"+ctx+'/account/user/selectUser?callback='+callback+"&must="+mt+"&single="+sg+"&autoIds="+autoIds,
		          lock:true,
		          title: '选择人员',
		          height:400,
		          width:500,
		          ok:function(){
		                return this.content.okFunc();
			          	
		              
		          },
		          init:function(){},
			      cancel: true,
			      zIndex:999999
			    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
		      });

}
HZ.selectDepartment=function(callback,must,single){
		  var mt=false;
            if(must)mt=true;
          var sg=false
            if(single)sg=true;
  			$.dialog({
		          id: 'LHG1980D2FFFFF',
		          content: "url:"+ctx+'/account/user/selectDepart?callback='+callback+"&must="+mt+"&single="+sg,
		         // lock:true,
		          title: '选择机构',
		          height:400,
		          width:500,
		          ok:function(){
		                return this.content.okFunc();
		          },
		          zIndex:999999,
		          init:function(){},
			      cancel: true
			    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
		      });

}

/** 
   表格导出js
url:account/user/jqgrid
	expCols="name:姓名,loginName:登录名"
	postData:传递的过滤参数
	excel最大不能超过65500条数据
**/

function ss(){
$("#loading_img").hide();
}
	/**
	 HZ.expGrid(ggridId,['no'],["id:id"]);
	*/
 HZ.expGrid=function(ggridId,filterCols,addCols,currentPage){
	    var url =  jQGridSupport.getParam(ggridId,"url");
	    var colModel =  jQGridSupport.getParam(ggridId,"colModel");
	    var pstrlist=[];
	    for(var i=0;i<colModel.length;i++){
	     if(colModel[i].label && colModel[i].name && colModel[i].name!='edit'){
	        var add=true;
	        if(filterCols)//过滤不需要导出的列
	        for(var j=0;j<filterCols.length;j++){
	           if(filterCols[j]==colModel[i].name){add=false;break;}
	        }
	        if(add)pstrlist.push(colModel[i].name+":"+colModel[i].label);
	     }
	      
	    }
	    //添加页面没有显示的列
	    if(addCols)for(var k=0;k<addCols.length;k++)pstrlist.push(addCols[k]);
	    var data = jQGridSupport.getParam(ggridId,"postData");
	    var rowNum=false;
	    if(currentPage)
	       rowNum=  jQGridSupport.getParam(ggridId,"rowNum");
		HZ.exportExcel(url,pstrlist.join(","),data,rowNum);
	
	}
HZ.exportExcel=function(url,expCols,postData,rownum){ 
     var rows=60000;
     if(rownum)rows=rownum;
     var data={page:1,rows:rows,exportFlg:"true",expCols:expCols};
     if(postData)
     {
       postData.page=1;
       data=$.extend(true,{},postData,data);
     }
    $.ajax({
        url : url,
        success:function(downUrl){
              var path=ctx+"/static-content?download=true&contentPath="+downUrl.url;
	          window.location.href=path;
        },
        type:"POST",
        cache:false,
        data:data,
        beforeSend:function(){
                     $("<img id='loading_img' src='"+ctx+"/static/img/006.gif' style='position: absolute;top:50px;left:300px;z-index:1000;'/>").appendTo(document.body) ;
                 },
         complete:function(){ $("#loading_img").remove();}
    
    });

}
/**

  流程跟踪js
**/
function graphTrace(options) {
    	var pid= $(this).attr('pid');  
    	if(!pid)pid=options.pid;
    	if(!pid){
    	  alert("未传流程实例ID");return ;
    	}
	    $.dialog({
		          id: 'LHG1976D1',
		          content: 'url:'+ctx+'/wf/process/traceFlow/'+pid,
		          lock:true,
		          title: '流程跟踪',
		          height:400,
		          width:800,
		          ok:false,//function(){return this.content.okFunc();},
		          init:function(){//this.max();alert(123);
		            //this.max();
		          },
			      cancel: true//,
			    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
		      }); 

return ;

    var _defaults = {
        srcEle: this,
        pid: $(this).attr('pid')
    };
    var opts = $.extend(true, _defaults, options);

    // 获取图片资源
    var imageUrl = ctx + "/wf/resource/process-instance?pid=" + opts.pid + "&type=image";
    $.getJSON(ctx + '/wf/process/trace?pid=' + opts.pid, function(infos) {

        var positionHtml = "";

        // 生成图片
        var varsArray = new Array();
        $.each(infos, function(i, v) {
            var $positionDiv = $('<div/>', {
                'class': 'activity-attr'
            }).css({
                position: 'absolute',
                left: (v.x - 1),
                top: (v.y - 1),
                width: (v.width - 2),
                height: (v.height - 2),
                backgroundColor: 'black',
                opacity: 0,
                zIndex: $.fn.qtip.zindex - 1
            });

            // 节点边框
            var $border = $('<div/>', {
                'class': 'activity-attr-border'
            }).css({
                position: 'absolute',
                left: (v.x - 1),
                top: (v.y - 1),
                width: (v.width - 4),
                height: (v.height - 3),
                zIndex: $.fn.qtip.zindex - 2
            });

            if (v.currentActiviti) {
                $border.addClass('ui-corner-all-12').css({
                    border: '3px solid red'
                });
            }
            positionHtml += $positionDiv.outerHTML() + $border.outerHTML();
            varsArray[varsArray.length] = v.vars;
        });

        if ($('#workflowTraceDialog').length == 0) {
            $('<div/>', {
                id: 'workflowTraceDialog',
                title: '查看流程（按ESC键可以关闭）',
                html: "<div><img src='" + imageUrl + "' style='position:absolute; left:0px; top:0px;' />" +
                "<div id='processImageBorder'>" +
                positionHtml +
                "</div>" +
                "</div>"
            }).appendTo('body');
        } else {
            $('#workflowTraceDialog img').attr('src', imageUrl);
            $('#workflowTraceDialog #processImageBorder').html(positionHtml);
        }

        // 设置每个节点的data
        $('#workflowTraceDialog .activity-attr').each(function(i, v) {
            $(this).data('vars', varsArray[i]);
        });

        // 打开对话框
        $('#workflowTraceDialog').dialog({
            modal: true,
            resizable: false,
            dragable: false,
            open: function() {
                $('#workflowTraceDialog').css('padding', '0.2em');
                $('#workflowTraceDialog .ui-accordion-content').css('padding', '0.2em').height($('#workflowTraceDialog').height() - 75);

                // 此处用于显示每个节点的信息，如果不需要可以删除
                $('.activity-attr').qtip({
                    content: function() {
                        var vars = $(this).data('vars');
                        var tipContent = "<table class='need-border'>";
                        $.each(vars, function(varKey, varValue) {
                            if (varValue) {
                                tipContent += "<tr><td class='label'>" + varKey + "</td><td>" + varValue + "<td/></tr>";
                            }
                        });
                        tipContent += "</table>";
                        return tipContent;
                    },
                    position: {
                        at: 'bottom left',
                        adjust: {
                            x: 3
                        }
                    }
                });
                // end qtip
            },
            width: document.documentElement.clientWidth * 0.95,
            height: document.documentElement.clientHeight * 0.95
        });

    });
}


/**
onlyInt(IPT);
st=true;整数
bathOnly(['1','2'])
*/

function bathOnly(ids,st,dit,callback){
   for(var i=0;i<ids.length;i++){
  // alert(ids[i]+document.getElementById(ids[i]));
   	   onlyFloat(document.getElementById(ids[i]),st,dit,callback);
   }
}

function onlyFloat(ipt,st,dit,callback){
	addEvent(ipt,"keypress",function(e){
	  if(e.keyCode==45){
		if(ipt.value.indexOf("-")==-1){
		return true;
		}else{
		return false;
		}
	}
	if(e.keyCode==46){
	    if(st==true)return false;
		if(ipt.value.indexOf(".")==-1){
			return true;
		}else{
			return false;
		}
		}else{
		if((e.keyCode>=48&&e.keyCode<=57&&e.ctrlKey==false&&e.shiftKey==false)||e.keyCode==0||e.keyCode==8){
			return true;
		}else{
		if(e.ctrlKey==true&&(e.keyCode==99||e.keyCode==118)){
			return true;
		}else{
			return false;
		}
		}
		}
	});
	addEvent(ipt,"blur",function(e){
	    if(ipt.value=='.')ipt.value="0";
	     else if(isNaN(ipt.value)){
	      ipt.value="0";
	    } 
	    else  {
	    if(dit)
	    ipt.value=Number(ipt.value).toFixed(dit);
	    else  ipt.value=Number(ipt.value);
	    }
	    if(callback)
	       callback(e);
	});
}
function addEvent(obj,type,fun){
	//obj=$(obj);
	if(obj.addEventListener){
		obj.addEventListener(type,fun);
		return true;
	}else if(obj.attachEvent){
		return obj.attachEvent("on"+type,fun);
	}else{
		return false;
	};
};
//导入数据模板
function importXls(title,url,tempFileName){
	var tname="";
	if(tempFileName)tname=tempFileName;
     $.dialog({
	          id: 'LHG1976D111',
	          content: 'url:'+ctx+'/upload/importXls?url='+url+"&tempFileName="+tname,
	          lock:true,
	          title: title?title:"",
	          height:200,
	          width:500,
	          ok:false,//function(){return this.content.okFunc();},
	          init:function(){//this.max();alert(123);
	           //this.max();
	          },
		      cancel: true//,
		    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
	      }); 

}
/**
  页面加载完处理的一些问题
*/
$(function(){
	  if($request.view=='view'){//查看页面
	     
	     jQuery("input,select,textarea").attr("readonly",'readonly');
	  }
	  
//tab也处理
/**
   <div class="div_tab">
	    <a id="tab_0"   href="javascript:void(0);" class="on">个人基本信息</a>
	    <a id="tab_1"   href="javascript:void(0);" >扩展信息</a>
	    <a id="tab_2"   href="javascript:void(0);" >育龄妇女、劳动保障</a>
	    
    </div>
    
    
    <table>
    	 <tbody  name="tab_0">	 
    	 </tbody>
    	  <tbody  name="tab_1">	 
    	 </tbody>
    	  <tbody  name="tab_2">	 
    	 </tbody>
   </table> 	 
*/
var tabs =  $("div.div_tab").find("a");
var curtab= $("div.div_tab").find("a[class='on']");
 var curid=curtab.attr("id");
tabs.each(function(n,el){
  var id=$(el).attr("id");
 
  if(id!=curid) { 
     $("[name='"+id+"']").hide();
     }
 

});
 $("[name='"+curtab.attr("id")+"']").show();
//$("[tabindex='"+curtab.attr("id")+"']").show();
tabs.click(function(){ 
     curtab.removeClass("on");
    $("[name='"+curtab.attr("id")+"']").hide();
     $(this).addClass("on");
     curtab=$(this);
    $("[name='"+curtab.attr("id")+"']").show();
});

 //级联处理,只适用于两级级联
 /**
  <form:select path="city" casval="${community.city}"  cascade="area" cascadeUrl="${ctx }/getCasecadeArea/">
     
        </form:select>
 */
 
 $("select[cascade]").each(function(n,e){
   var caseP=$(e);
   var cascade= caseP.attr("cascade");
   var casval=$("#"+cascade).attr("casval")
   var url= caseP.attr("cascadeUrl");
   caseP.change(function(){
	   $.ajax({
				url:url,
				dataType: 'json',
				data:{val:caseP.val()},
				success:function(d){
				      $("#"+cascade).empty();
				      for(var i=0;i<d.length;i++)
				 	    $("#"+cascade).append("<option value='"+d[i].id+"'>"+d[i].name+"</option>");
				 	      if(casval){
						   	  $("#"+cascade).val(casval);
						   }
				}
			}).fail(function() { alert("error " ); });
   
   });
   //修改时设置选中值
   if(casval){
   	   caseP.change();
   }
 });
 
});

/**
多层级级联
[{eid:'privice',url:'/getCasecadeArea/',val:''},{eid:'city',url:'/getCasecadeArea/',val:''},{eid:'area',url:'/getCasecadeArea/',val:''}]
*/
function cascadeMulit(flist){
 for(var i=0;i<flist.length;i++){
	    var f=flist[i];
	    if(i==(flist.length-1))return ;
	     var fp=flist[i+1];
	     addCascade(f,fp);
 }
function addCascade(f,fp){
      $("#"+f.eid).change(function(){ 
           var val = $("#"+f.eid).val();
           if(val==null)return ;
		   $.ajax({
					url:ctx+"/"+f.url,
					dataType: 'json',
					data:{val: val},
					success:function(d){
					      $("#"+fp.eid).empty();
					      if(fp.q){
					       $("#"+fp.eid).append("<option value=''>请选择</option>");
					      }
					      for(var i=0;i<d.length;i++)
					 	      $("#"+fp.eid).append("<option value='"+d[i].id+"'>"+d[i].name+"</option>");
					 	      if(fp.val){
							    $("#"+fp.eid).val(fp.val);
							   }
							  $("#"+fp.eid).change(); 
					}
				}).fail(function() { alert("error " ); });
	   
	   });
     if(f.val){
	    $("#"+f.eid).val(f.val);
	    $("#"+f.eid).change(); 
	   }
}
}
/***
工作流部分
*/
HZ.startWorkFlow=function(processKey,professId){ 
  var str="<form id='startFlowForm' method='post' action=\""+ctx+"/hflow/excumethod\">"
   +"<input type=\"hidden\" name=\"m\" value=\"startflow\"/>"
   +"<input type=\"hidden\" name=\"processKey\" value=\""+processKey+"\"/>";
   if(professId)
      str+="<input type=\"hidden\" name=\"professId\" value=\""+professId+"\"/>";
   jQuery(str+"</form>").appendTo(document.body).submit();
}
HZ.pendingWorkFlow=function(processId,professId){ 
  var str="<form id='startFlowForm' method='post' action=\""+ctx+"/hflow/pendingDeal.html\">"
   +"<input type=\"hidden\" name=\"wf_processId\" value=\""+processId+"\"/>"
   +"<input type=\"hidden\" name=\"wf_professId\" value=\""+professId+"\"/>";
  // if(professId)
   //   str+="<input type=\"hidden\" name=\"professId\" value=\""+professId+"\"/>";
   jQuery(str+"</form>").appendTo(document.body).submit();
}
/////导出页面到excel
function exportPageToExcel(tabId){
	     var rows=[];
	     $("#"+tabId).find("tr").each(function(n,e){
	           var rowmap=[];
		       $(e).find("td").each(function(tn,te){
		             var val=$(te).attr("title");
		             if(!val)val=$(te).text();
		             var rowspan=$(te).attr("rowspan");
		             if(!rowspan)rowspan=1;
		             var colspan=$(te).attr("colspan");
		             if(!colspan)colspan=1;
		             var align= $(te).css("text-align");
		             if(!align)align=$(te).attr("align");
		             if(!align)align="left";
		             var weight= $(te).css("fontWeight");
		             if(!weight)weight="1";
		             var fontSize= $(te).css("fontSize");
		             if(!fontSize)fontSize="1";
		             var borderLeftWidth= $(te).css("borderLeftWidth");
		             if(!borderLeftWidth)borderLeftWidth="0px";
		             var borderRightWidth= $(te).css("borderRightWidth");
		             if(!borderRightWidth)borderRightWidth="0px";
		             var borderTopWidth= $(te).css("borderTopWidth");
		             if(!borderTopWidth)borderTopWidth="0px";
		             var borderBottomWidth= $(te).css("borderBottomWidth");
		             if(!borderBottomWidth)borderBottomWidth="0px";
		             //alert(val+":"+borderBottomWidth);
		           var imgstr="";
		           $(te).find("img").each(function(fn,fe){
		                 var src= $(fe).attr("src");
		                 var iw= $(fe).css("width");
		                 var ih= $(fe).css("height");
		                 if(src){
		                    var url=window.location+"";
		                    if(!src.startWith("http://")){
		                        src=url.substring(0,url.indexOf(ctx))+src;
		                    }  
		                 } 
		                 imgstr+=src+"$"+iw+"$"+ih+",";
		           });
		             rowmap.push({val:val,rowspan:rowspan,colspan:colspan,align:align,weight:weight,fontSize:fontSize,borderLeftWidth:borderLeftWidth,
		             borderRightWidth:borderRightWidth,borderTopWidth:borderTopWidth,borderBottomWidth:borderBottomWidth,imgstr:imgstr}); 
		             
		            
		       });
		      rows.push(rowmap); 
	     });
	$.ajax({
        url : ctx+"/exportPageToExcel",
        success:function(downUrl){
              var path=ctx+"/static-content?download=true&contentPath="+downUrl;
	          window.location.href=path;
        },
        type:"POST",
        cache:false,
        data:{pageStr:$.toJSON(rows)},
        beforeSend:function(){
                     $("<img id='loading_img' src='"+ctx+"/static/img/loading/006.gif' style='position: absolute;top:50px;left:300px;z-index:1000;'/>").appendTo(document.body) ;
                 },
        complete:function(){ $("#loading_img").remove();}
    
    });
	}

function insertRow(pageCode,dataPageCode)
{
  var oTBODY     = document.getElementById(pageCode).tBodies.item(0);
  var oTBODYData = document.getElementById(dataPageCode).tBodies.item(0);
  var rowsCount = oTBODYData.rows.length;
  for(var i=0;i<rowsCount;i++){
	  
    oTBODY.appendChild(oTBODYData.rows[i].cloneNode(true));
  }
}

function deleteRow(PageCode,Field)
{

  var intIndex = parseInt(getElementOrder(Field),10) - 1;  //顺序改为以0开始  
  var oTBODY   = document.getElementById(PageCode).tBodies.item(0);
  intIndex = intIndex - 1;  //去掉隐含域中的控制按钮的个数
  oTBODY.deleteRow(intIndex);
}

function getRealElementOrder(Field){
	 var intIndex = parseInt(getElementOrder(Field),10) - 1;  //顺序改为以0开始  
	 return intIndex;
}

//得到一页的多行纪录的记录数
//页名称
function getRowsCount(PageCode)
{
  var oTBODY   = document.getElementById(PageCode).tBodies.item(0);
  var intCount = oTBODY.rows.length;
  return intCount;
}

function getElementOrder(field)
{	
  var intOrder = 0;
  var intCount = getElementCount(field.name);

  if(intCount>1)
  {
    for(var i=0;i<intCount;i++)
    {
      if($('[name='+field.name+']')[i].name==field.name)
      {
        intOrder++;
      }
      if($('[name='+field.name+']')[i]==field)
      {
        break;
      }
    }
  }
  else
  {
    intOrder = 1;
  }
  return intOrder;
}

function getElementCount(strFieldName)
{
  var intCount = 0;
  try
  {
    intCount = eval( $('[name='+strFieldName+']').length );
    if(isNaN(intCount)) intCount = 1;
  }
  catch(E)
  {
	  alert(E);
    intCount = 0;
  }

  return intCount;
}


function setRealValue(value,type){
	if(type == 'date'){
		if(value =='null' || value == null){
			return '';
		}else{
			return new Date(value).format("yyyy-MM-dd");
		}
		
	}else if(type == 'number'){
		if(value == '0'){
			return '';
		}else{
			return value;
		}
		
	}else if(type == 'string'){
		if(value =='null' || value == null){
			return '';
		}else{
			return value;
		}
		
	}
	
}

function errorMessage(strErrMsg)
{
  var strMsg = "系统信息:\n\n" + strErrMsg;
  alert(strMsg);
}

function isEmpty(field)
{
  if(field.value==null || trim(field.value)=="")
  {
    return true;
  }

  return false;
}

//替换字符串函数
function replace(strExpression,strFind,strReplaceWith)
{
  var strReturn;
  var re = new RegExp(strFind,"g");
  if(strExpression==null)
    return null;

  strReturn = strExpression.replace(re,strReplaceWith);
  return strReturn;
}

//去掉字符串头空格
function leftTrim(strValue)
{
  var re =/^\s*/;
  if(strValue==null)
    return null;

 strValue= "" + strValue;
  var strReturn = strValue.replace(re,"");

  return strReturn;
}

//去掉字符串尾空格
function rightTrim(strValue)
{
  var re =/\s*$/;
  if(strValue==null)
    return null;

  var strReturn = strValue.replace(re,"");

  return strReturn;
}

//去掉字符串头尾空格
function trim(s)
{
  var strReturn;
  strReturn = leftTrim(s);
  strReturn = rightTrim(strReturn);

  return strReturn;
}

//得到下n天
function getNextDateFullDate(strDate,intCount)
{
  var tempDate = new Date(replace(strDate,"-","/"));
  if(intCount == null)
  {
    intCount =1;
  }

  var nextDateInMS = tempDate.getTime() + (intCount * 24 * 60 * 60 * 1000 );
  var strReturn = convertFullDateToString(new Date(nextDateInMS));
  return strReturn;
}


//得到下n个月
function getNextMonthFullDate(strDate,intCount)
{
  var tempDate = new Date(replace(strDate,"-","/"));
  if(intCount == null)
  {
    intCount =1;
  }

  tempDate.setMonth(tempDate.getMonth() + intCount );
  var strReturn = convertFullDateToString(tempDate);
  return strReturn;
}


//得到下n个年
function getNextYearFullDate(strDate,intCount)
{
  var tempDate = new Date(replace(strDate,"-","/"));
  if(intCount == null)
  {
    intCount =1;
  }

  tempDate.setFullYear(tempDate.getFullYear() + intCount );
  var strReturn = convertFullDateToString(tempDate);
  return strReturn;
}


//得到日期的字符串表达形式，传入参数为Date类型
//如果不传，则默认为当天
function convertFullDateToString(date)
{
  if(date==null)
  {
    date = new Date();
  }

  var strDate = "";
  
  //转换成标准格式YYYY-MM-DD
  if (date.getMonth()+1<10)
  {
     chgMonth = date.getMonth() + 1 ;//
     chgMonth ="0" + chgMonth ;
  }
  else
  {
     chgMonth = date.getMonth() + 1 ;//
  }
  if (date.getDate()<10)
  {
     chgDay = date.getDate();//
     chgDay ="0" + chgDay ;
  }
  else
  {
     chgDay = date.getDate() ;//
  }
  
  strDate = date.getFullYear() + DATE_DELIMITER +
            chgMonth + DATE_DELIMITER +
            chgDay;
  return strDate;
}
//RegExt Test
function regExpTest(source,re)
{
  var result = false;

  if(source==null || source=="")
    return false;

  if(source==re.exec(source))
    result = true;

  return result;
}

//对输入域是否是整数的校验,即只包含字符0123456789
function isInteger(strValue)
{
  var result = regExpTest(strValue,/\d+/g);
  return result;
}

//对输入域是否是数字的校验
function isNumeric(strValue)
{
  var result = regExpTest(strValue,/\d*[.]?\d*/g);
  return result;
}

//离开域时的数字校验Decimal
function checkDecimal(field,p,s,MinValue,MaxValue)
{
  //alert("--------------"+MaxValue);
  field.value = trim(field.value);
  var strValue=field.value;
  if(strValue=="")
    strValue = "0";

  var desc = field.title;
  //如果title属性不存在，则用name属性
  if(desc==null)
    desc = field.name;

  if(!isNumeric(strValue))
  {
    errorMessage("请输入合法的数字");
    field.focus();
    field.select();
    return false;
  }
  p = parseInt(p,10);
  s = parseInt(s,10);

  var pLength;
  var sLength;
  var position = strValue.indexOf(".");
  if(position>-1)
  {
    pLength = position;
    sLength = strValue.length - position - 1;
  }
  else
  {
    pLength = strValue.length;
    sLength = 0;
  }

  if(pLength>(p-s) || sLength>s)
  {
    errorMessage("请输入合法的" + desc +"\n类型为数字,整数位最长为" + (p-s) + ",小数位最长为" + s);
    field.focus();
    field.select();
    return false;
  }

  var value = parseFloat(strValue);
  if(MaxValue!=null && MinValue!=null && trim(MaxValue)!="" && trim(MinValue)!="")
  {
    MinValue = parseFloat(MinValue);
    MaxValue = parseFloat(MaxValue);
    if(isNaN(value) || value>MaxValue || value<MinValue)
    {
      errorMessage("请输入合法的" + desc +"\n类型为数字,最小值为" + MinValue + ",最大值为" +MaxValue);
      field.focus();
      field.select();
      return false;
    }
  }

  return true;
}

//离开域时的数字校验
function checkInteger(field,MinValue,MaxValue)
{
  field.value = trim(field.value);
  var strValue=field.value;
  if(strValue=="")
    return true;
  var desc = field.title;
  //如果title属性不存在，则用name属性
  if(desc==null)
    desc = field.name;

  if(!isInteger(strValue))
  {
    errorMessage("请输入合法的数字");
    field.focus();
    field.select();
    return false;
  }

  MinValue = parseInt(MinValue,10);
  if(isNaN(MinValue))
    MinValue = MIN_INTEGER;

  MaxValue = parseInt(MaxValue,10);
  if(isNaN(MaxValue))
    MaxValue = MAX_INTEGER;
  var value = parseInt(strValue,10);
  if(isNaN(value) || value>MaxValue || value<MinValue)
  {
    errorMessage("请输入合法的" + desc +"\n类型为数字(integer),最小值为" + MinValue + ",最大值为" +MaxValue);
    field.focus();
    field.select();
    return false;
  }
  return true;
}

function round(number,precision)
{
  if(isNaN(number))
    number = 0;
  var prec = Math.pow(10,precision);
  var result = Math.round(number*prec);
  result = result/prec;
  return result;
}


//对数字进行格式化,保证precision位
function point(number,precision)
{
  if(isNaN(number))
    number = 0;
  var result = number.toString();
  if(result.indexOf(".")==-1)
    result = result + ".";

  result = result + newString("0",precision);
  result = result.substring(0,precision + result.indexOf(".") + 1);
  return result;
}

//对数字第三位四舍五入
function mathRound(number)
{
  return round(number,2);
}

//对数字按0.00格式化
function pointTwo( s )
{
  return point(s,2);
}


