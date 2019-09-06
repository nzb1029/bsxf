<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!--  onclick="new WdatePicker() "  2012-12-21
      onclick="new WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'}) "  2012-12-21 22:12:30
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/dhtmlxScheduler/dhtmlxscheduler.css" />
<script type="text/javascript" src="${ctx}/static/dhtmlxScheduler/dhtmlxscheduler-source.js"></script>
<script type="text/javascript" src="${ctx}/static/dhtmlxScheduler/locale_cn.js"></script>
<script type="text/javascript" charset="utf-8">
            var ctx="${ctx}";
		    scheduler.config.first_hour=8;
		    scheduler.config.api_date="%Y-%m-%d %H:%i";
		    scheduler.config.xml_date="%Y-%m-%d %H:%i";
		    scheduler.config.hour_date="%H:%i";
		    scheduler.config.default_date="%Y年%m月%d日";
		    scheduler.config.month_date="%Y年 %m月";
		    scheduler.config.day_date="%m月%d日";
		    scheduler.config.start_on_monday=true;
		    scheduler.showLightbox=showLightbox;
		    scheduler.attachEvent("onEventAdded",   addScheduler);
		    scheduler.attachEvent("onEventChanged", addScheduler);
		    scheduler.attachEvent("onBeforeEventDelete", function(event_id, event_object){
				 $.ajax({
		            url:ctx+"/sevent/delete/"+event_id,
		            type:  'POST',
		            success:function(){
		            
		            }
		             }); 
		        return true;
		    
		    });
		    ////
		/*    scheduler.locale={
        date:{
            month_full:["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            month_short:["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],
            day_full:["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
            day_short:["日", "一", "二", "三", "四", "五", "六"]
        },
        labels:{
            dhx_cal_today_button:"今天",
            day_tab:"日",
            week_tab:"周",
            month_tab:"月",
            new_event:"新工作计划",
            icon_save:"保存",
            icon_cancel:"取消",
            icon_details:"详细",
            icon_edit:"编辑",
            icon_delete:"删除",
            confirm_closing:"", //Your changes will be lost, are your sure?
            confirm_deleting:"请确认你是否需要删除该工作计划?",
            section_content:"内容",
            section_description:"内容",
            section_views:"上级意见",
            section_time:"时间"
        }
    };*/
    /**
     if(!Owner)
    {
        scheduler.config.drag_resize=false; 
        scheduler.config.drag_move=false; 
        scheduler.config.drag_create=false; 
        scheduler.config.dblclick_create=false;
        scheduler.config.edit_on_create=false;
        scheduler.config.details_on_create=false;

        if(!Permission.Edit)
        {
            scheduler.config.readonly=true;
            scheduler.attachEvent("onClick",function(id){
                CelendarBox(id);
            });
        }
    }
    */
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
function getSchedulerData(event_object){
    var formData={};
    formData.title=event_object.text;
    formData.startDate=(new Date(event_object.start_date).format("yyyy-MM-dd hh:mm")) ;
    formData.endDate=(new Date(event_object.end_date).format("yyyy-MM-dd hh:mm")) ;
    formData.id=event_object.id;
    return formData;
    //formData.content=json.title;
   // $("#content",f).attr("value",json.content);
    /*$("#views",f).attr("value",json.views);
    $("#superior",f).attr("value",json.superior);
    if(isEmpty(json.startTime))
    {
        json.startTime=DateFormat(json.start_date);
        json.endTime=DateFormat(json.end_date);
    }
    $("#startTime",f).attr("value",json.startTime);
    $("#endTime",f).attr("value",json.endTime);*/
} 
/**
  日程添加事件
*/   
function addScheduler(event_id,event_object){
        // alert($.toJSON(event_object));
         var formData=getSchedulerData(event_object);
         $.ajax({
            url:ctx+"/sevent/save",
            type:  'POST',
            data: formData,
            success:function(){
            
            }
         
         }); 
}  
function afterSaveScheduler(d){ 
      var ev = scheduler.getEvent(d.id);
      ev.text=d.title;
      ev.start_date=new Date(d.startDate) ;
      ev.end_date= new Date(d.endDate);
      scheduler.updateEvent(d.id);
     // scheduler.render_view_data();
}
function showLightbox(id,isview){
         var url=ctx+'/sevent/create/?id='+id;
         var okf=function(){return this.content.okFunc();};
         var obj=scheduler.getEvent(id);
        // alert(obj.start_date);
         var start_date= (new Date(obj.start_date).format("yyyy-MM-dd hh:mm"));
         var end_date= (new Date(obj.end_date).format("yyyy-MM-dd hh:mm"));
         if(isview)okf=false;
         url+="&start_date="+start_date+"&end_date="+end_date;
         $.dialog({
	          id: 'LHG1976D1',
	          content: 'url:'+url,
	          lock:true,
	          title: '工作计划',
	          height:500,
	          width:700,
	          ok:okf,
	          init:function(){//this.max();alert(123);
	           //this.max();
	          },
		      cancel: true//,
		    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
	      }); 
	 
}

  
var _CelendarBox;//该处为，弹出窗口的HTML源码，我该处是通过AJAX预先载入HTML文件。
function CelendarBox(id)
{
    if (!id) {
        return
    }
    if (!scheduler.callEvent("onBeforeLightbox", [id])) {
        return;
    }
    var o=scheduler.getEvent(id);
    var h=240
    o.superior=o.superior?Trim(o.superior):"";
    o.views=o.views?Trim(o.views):"";
    o.content=o.content?Trim(o.content):"";
    alert(o.text);
    var tmp=Box_Html.replace(/{title}/g,o.text);//替换窗口HTML代码的{title}
    tmp=tmp.replace(/{content}/g,o.content);//替换窗口HTML代码的{content}
    tmp=tmp.replace(/{superior}/g,o.superior);
    tmp=tmp.replace(/{views}/g,o.views);

    if(isEmpty(o.startTime))
    {
        o.startTime=DateFormat(o.start_date);//日期格式转换为这样的格式2009-12-33
        o.endTime=DateFormat(o.end_date);//日期格式转换为这样的格式2009-12-33
    }
    tmp=tmp.replace(/{startTime}/g,o.startTime);
    tmp=tmp.replace(/{endTime}/g,o.endTime);
    
//弹出weeboxs的窗口
    _CelendarBox=$.weeboxs.open(tmp, {
        boxid:'box',
        title:'工作计划: ', 
        width:500, height:h,
        showOk:ShowOk,
        oncancel:function(box){
            scheduler._edit_stop_event(o, false);//当点击取消按钮时候，将dhtmlxScheduler的状态edit mode关闭，提交，触发相应动作（或者大家看看源码，好理解点）
            _CelendarBox.close();//关闭窗口
            _CelendarBox=null;
        },
        onok:function(box){
            var f=$("#boxForm");
            o.text=$("#title",f).attr("value");
            o.content=$("#content",f).attr("value");
            o.startTime=$("#startTime",f).attr("value");
            o.endTime=$("#endTime",f).attr("value");
            if(Permission.Edit)
            {
                o.superior=$("#superior",f).attr("value");
                o.views=$("#views",f).attr("value");
            }
            o._timed = scheduler.is_one_day_event(o);//这里忘了什么意思，看看源码吧。
            o.start_date=scheduler.templates.api_date(o.startTime);//将2009-12-22的日期格式转换为dhtmlxScheduler内置的日期格式，忘记了是什么
            o.end_date=scheduler.templates.api_date(o.endTime);//将2009-12-22的日期格式转换为dhtmlxScheduler内置的日期格式，忘记了是什么
            scheduler._edit_stop_event(o, true);//将dhtmlxScheduler的状态edit mode关闭，提交，触发相应动作（或者大家看看源码，好理解点）
        }
    });
}
//关闭窗口函数
function CelendarBoxCloseing(id,data)
{
    scheduler.setEvent(id,data);
    scheduler.event_updated(data);//更新显示的对象
    
    if(_CelendarBox)
    {
        _CelendarBox.close();
        _CelendarBox=null;
    }
    scheduler.callEvent("onAfterLightbox", [])//调用为onAfterLightbox的动作
}

function DateFormat(d)
{
    return new Date(d).pattern("yyyy-MM-dd HH:mm");
}
//修改函数，其他函数大同小异
function Edit(id,data)
{
    json2from(data);
    var f=$("#calendarForm");
    if(isEmpty($("#title",f).attr("value")))
    {
        WarnBox("对不起,请输入标题!","错误");
        return false;
    }
    if(isEmpty($("#startTime",f).attr("value")))
    {
        WarnBox("对不起,请选择开始时间!","错误");
        return false;
    }
    if(isEmpty($("#endTime",f).attr("value")))
    {
        WarnBox("对不起,请选择结束时间!","错误");
        return false;
    }
    //GlobaAjax是我自己封装的AJAX提交的函数，其实大同小异。
    new GlobaAjax().Submit({
        url:"Edit.action?calendar.id="+id,
        form:f,
        LoadingLayer:'#DataLoading',
        successFunction: function(json) {

            CelendarBoxCloseing(id,data);//成功以后，还要更新页面上的信息喔。
        }
    });
}
function json2from(json)
{
    var f=$("#calendarForm");
    $("#title",f).attr("value",json.text);
    $("#content",f).attr("value",json.content);
    $("#views",f).attr("value",json.views);
    $("#superior",f).attr("value",json.superior);
    if(isEmpty(json.startTime))
    {
        json.startTime=DateFormat(json.start_date);
        json.endTime=DateFormat(json.end_date);
    }
    $("#startTime",f).attr("value",json.startTime);
    $("#endTime",f).attr("value",json.endTime);
    //alert(f.html());
}
 </script>
