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
			refTree();
			
			/* $.ajax({
					url:ctx+"/equipment/loadEqByLikeId?likeId="+likeId,
					dataType: 'json',
					success:function(d){
					 	 showEq(d);
					}
					
					
				}).fail(function() { alert("error " ); });
		  */	
			
		});
function refTree(){
      var setting = {
				async: {
					enable: true,
					url: ctx+"/iotjk/partsCategory/loadtree?st=gis",
					cache:false
				},
				check: {
					enable: false
				},
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "parentId"
					}
				},
				view: {
					expandSpeed: ""
				},
				callback: {
				onClick:function(a,b,c){
				   var likeId=c.likeId;
				   if(likeId){
				      $.ajax({
							url:ctx+"/equipment/loadEqByLikeId?likeId="+likeId,
							dataType: 'json',
							success:function(d){ 
							 	 showEq(d);
							}
							
							
						}).fail(function() { alert("error " ); });
				   }else {
				      $.ajax({
							url:ctx+"/equipment/loadEqByLikeId?id="+c.id,
							dataType: 'json',
							success:function(d){
							 	 showEq(d);
							}
							
							
						}).fail(function() { alert("error " ); });
				   }
                    
				}
				}
			};
		    departTree=$.fn.zTree.init($("#departTree"), setting);	
     }
     var departTree=null;
	function showEq(d){ 
	   map.clearOverlays(); 
	   var f=[];
	   for(var i=0;i<d.length;i++){
	       new newEQ(d[i]).show();
	       if(d[i].pointx && d[i].pointy ){//定位到设备区域
	         f.push( new BMap.Point(d[i].pointx,d[i].pointy));
	       }
	   }
	   
	    if(f.length>0)
		    map.setViewport(f);
	  
	   // map.centerAndZoom(new BMap.Point(f.pointx, f.pointy), 15);
	}	 
	var newEQ=function (d){ 
	    var eq=d;
	   return { 
	     show:function(){
	   
	     if(eq.pointx && eq.pointy){  
	        var point = new BMap.Point(eq.pointx,eq.pointy);
		    var myIcon =  new BMap.Icon(ctx+"/static-content?contentPath="+eq.category.affix+"/parts.gif&defPath=static/img/noeq.gif&t="+new Date().getTime(), new BMap.Size(50,50));
		   // map.centerAndZoom(point, 15);
		    var marker = new BMap.Marker(point,{icon:myIcon});
		    map.addOverlay(marker);  
		    marker.addEventListener("click",function(){
		             var id="${id}"
				     $.dialog({
			          id: 'LHG1976D1',
			          content: "url:"+ctx+"/ws/cat/detail?id="+eq.id,
			          lock:true,
			          title:  '设备详情',
			          height:600,
			          width:650,
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
  
  <ul id="departTree"    style="height: 560px;" class="ztree"></ul>
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
