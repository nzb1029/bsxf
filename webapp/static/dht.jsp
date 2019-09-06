<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <c:set var="ctx" value="${pageContext.request.contextPath}"/>
   
    <script src="${ctx}/static/jquery.json-2.2.js" type="text/javascript"></script>
    <%@ include file="/WEB-INF/common/dhtmlx.jsp" %>
    <title>My JSP 'dht.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" charset="utf-8">
	function init() {
		   // scheduler.config.readonly=true;
		    // scheduler.attachEvent("onClick",function(id){
              //  CelendarBox(id);
           // });
    //scheduler.showLightbox = CelendarBox;
    //scheduler.attachEvent("onBeforeEventDelete",Del);
    scheduler.attachEvent("onEventChanged", function(event_id,event_object){
         alert("onEventChanged: "+event_id);
          alert(jQuery.toJSON(event_object));
         //Edit(event_id,event_object);
     });
    scheduler.attachEvent("onEventAdded", function(event_id,event_object){
          alert("onEventAdded: "+event_id);
          alert(jQuery.toJSON(event_object));
        // Add(event_id,event_object,function(old_id,new_id){
            // scheduler.changeEventId(old_id, new_id);
        // });
    });
		scheduler.init('scheduler_here',new Date(2010,0,10),"week");
		scheduler.load("events.xml");
		
	}
</script>
  </head>
  
  <body onload="init();">
  <div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
		<div class="dhx_cal_navline">
			<div class="dhx_cal_prev_button">&nbsp;</div>
			<div class="dhx_cal_next_button">&nbsp;</div>
			<div class="dhx_cal_today_button"></div>
			<div class="dhx_cal_date"></div>
			<div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
			<div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
			<div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
		</div>
		<div class="dhx_cal_header">
		</div>
		<div class="dhx_cal_data">
		</div>
	</div>
  </body>
</html>
