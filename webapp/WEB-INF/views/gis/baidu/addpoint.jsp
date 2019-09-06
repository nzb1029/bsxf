<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/WEB-INF/common/baidu.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>抓取坐标</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 

  </head>
  
  <body>
  <div style="padding: 5px;"> <input type="text" id="search"/> <button onclick="search()">查询</button>  
   X: <input type="text" id="pointx" value="${x }"/>Y: <input type="text" id="pointy" value="${y }"/> </div>
  <div id="map" style="width:100%;height: 550px;"></div>
  
  
    <script type="text/javascript">
    
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
    var map;
    function initialize() {
	      map = new BMap.Map('map');
	      var x= $("#pointx").val();
		  var y=  $("#pointy").val(); 
		  var pointx="${pointx}";
		  var pointy="${pointy}"; 
		  if(x && y){
		    var point = new BMap.Point(x,y);
		    map.centerAndZoom(point, 15);
		    var marker = new BMap.Marker(point);
		    map.addOverlay(marker);  
		    marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
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
		// 创建控件实例  
		//var myZoomCtrl = new ZoomControl();  
		// 添加到地图当中  
		//map.addControl(myZoomCtrl);
	    map.addEventListener("click", function(e){  
		    $("#pointx").val(e.point.lng );
		    $("#pointy").val(e.point.lat);  
		});  
	}
	
	 
	 
	 initialize();
    </script>
  </body>
</html>
