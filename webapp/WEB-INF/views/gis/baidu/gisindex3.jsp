<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/WEB-INF/common/baidu.jsp" %>
<%@ include file="/WEB-INF/common/lhgdialog.jsp"%>
	<%@ include file="/WEB-INF/common/dztree.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'gisindex.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	   <script>
		jQuery(document).ready(function() {
			//refTree();
			
			  $.ajax({
					url:ctx+"/architecture/loadgis",
					dataType: 'json',
					success:function(d){
					 	   for(var i=0;i<d.length;i++){
					 	    new newArich(d[i]).show();
					 	   }
					}
					
					
				}).fail(function() { alert("error " ); });
		   	
			
		}); 
   
	 
     
     
    /////
    var newArich=function (d){
	   var eq=d;
	   return { 
	     show:function(){
	     if(eq.leftp && eq.topp){
	        var point = new BMap.Point(eq.leftp,eq.topp);
		    var myIcon =  new BMap.Icon(ctx+"/static/img/house.png?t="+new Date().getTime(), new BMap.Size(50,50));
		    var marker = new BMap.Marker(point,{icon:myIcon});
		    map.addOverlay(marker);  
		    marker.addEventListener("click",function(){
				     $.dialog({
			          id: 'LHG1976D1',
			          content: "url:"+ctx+"/architecture/baidu?aid="+eq.id,
			          lock:false,
			          title:  '建筑详情',
			          height:600,
			          width:850,
			          ok:false,
			          init:function(){ 
			          },
				      cancel: true
			      });
		    });
		     marker.addEventListener("mouseover",function(){
		          var label = new BMap.Label(eq.name,{offset:new BMap.Size(20,-10)});
				  marker.setLabel(label);
		     });
		      marker.addEventListener("mouseout",function(){
		          var label = new BMap.Label(eq.name,{offset:new BMap.Size(20,-10)});
				  marker.getLabel().hide();
		     });
		    }
	    }
	    }
	}
	</script>
  </head>
  
  <body>
  <div style="position: absolute;top: 0px;left: 0px;z-index: 999999999999">
  
  <ul id="departTree"    style="height: 560px;display: none;" class="ztree"></ul>
  </div>
     <div id="map" style="width:100%;height:600px;"></div>
   <script type="text/javascript">
        $("#map").height($(window).height());
         $("#departTree").height($(window).height()-15);
        // $("#departTree").fadeOut('slow');
		$(window).resize(function() {
		     $("#map").height($(window).height());
		     $("#departTree").height($(window).height()-15);
		});
	var  map = null;
	 function initialize() {
	      map = new BMap.Map('map');
		  var pointx="${pointx}";
		  var pointy="${pointy}"; 
		  if(pointx && pointy){
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
