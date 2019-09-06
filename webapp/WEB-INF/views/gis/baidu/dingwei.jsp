<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/WEB-INF/common/baidu.jsp" %>
<%@ include file="/WEB-INF/common/lhgdialog.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>地块定位</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 

  </head>
  
  <body>
 
  <div id="map" style="width:100%;height:600px;"></div>
   
  
    <script type="text/javascript">
    //初始化地图全屏
	$("#map").height($(window).height());
	$(window).resize(function() {
	     $("#map").height($(window).height());
	});
    function okFunc(){
           var x= $("#pointx").val();
		   var y=  $("#pointy").val(); 
		   W.AfterAddPoint(x,y);
    }
    
    
    function search(){
       var search=document.getElementById("search");
       if(search.value!=''){
       	var local = new BMap.LocalSearch("全国", {
			  renderOptions: {
			    map: map,
			    panel : "r-result",
			    autoViewport: true,
			    selectFirstResult: false
			  }
			});
			local.search(search.value);
       }
    }
    var map=null;
    function initialize() {
	      map = new BMap.Map('map');
	      var x= "${x}";
		  var y= "${y}"; 
		  var pointx="${pointx}";
		  var pointy="${pointy}"; 
		  if(x && y){
		    var point = new BMap.Point(x,y);
		    var myIcon =  new BMap.Icon(ctx+"/static-content?contentPath=ning/parts.gif&defPath=static/img/dingwei.jpg&t="+new Date().getTime(), new BMap.Size(50,50));
		    map.centerAndZoom(point, 15);
		    var marker = new BMap.Marker(point,{icon:myIcon});
		    map.addOverlay(marker);  
		   // marker.addEventListener("click",function(){
		   //          var id="${id}"
		   //	     $.dialog({
			//          id: 'LHG1976D1',
			//        content: "url:"+ctx+"/ws/cat/detail?id="+id,
			//      lock:true,
			//    title:  '设备详情',
			//  height:600,
			//width:650,
			//ok:false,
			 //         init:function(){ 
			 //         },
			//	      cancel: true
			 //     });
		    //});
		    //marker.addEventListener("mouseover",function(){
		    //      var label = new BMap.Label("${equipment.name}",{offset:new BMap.Size(20,-10)});
			//	  marker.setLabel(label);
		    // });
		    //  marker.addEventListener("mouseout",function(){
		    //      var label = new BMap.Label("${equipment.name}",{offset:new BMap.Size(20,-10)});
			//	  marker.getLabel().hide();
		    // });
		   // marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
		  }else if(pointx && pointy){
		    map.centerAndZoom(new BMap.Point(pointx, pointy), 15);
		  } else{
		      var myCity = new BMap.LocalCity();
			  myCity.get(function(c){
			  map.centerAndZoom(new BMap.Point(c["center"].lng, c["center"].lat), 15);
			  });
		  }
		map.enableScrollWheelZoom();//开启滚轮缩放
		
		
		
	    ////添加控件
	    map.addControl(new BMap.NavigationControl());  
		map.addControl(new BMap.ScaleControl());  
		map.addControl(new BMap.OverviewMapControl());  
		map.addControl(new BMap.MapTypeControl());  
		 
	}
	
	 
	 
	 initialize();
    </script>
  </body>
</html>
