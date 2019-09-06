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
	  city2_map.city2_map.delallspeinfo();
	   var f;
	   for(var i=0;i<d.length;i++){
	       new newEQ(d[i]).show();
	       if(d[i].leftp && d[i].topp ){//定位到设备区域
	         f=d[i];
	       }
	   }
	   if(f)
	     city2_map.city2_map.mapmove(f.leftp,f.topp);
	}	 
	var newEQ=function (d){
	    var eq=d;
	   return { 
	     show:function(){
	        var x=eq.leftp;
			var y=eq.topp;
			var str="<div style=' height:15px'><img   style='cursor: pointer;' onclick=parent.detail('"+eq.id+"') src='"+ctx+"/static-content?contentPath="+eq.category.affix+"/parts.gif&defPath=static/img/noeq.gif&t="+new Date().getTime()+"'/>"
			+"<div style='position: absolute;top: -10px;left: 18px;width:180px;border:1px solid red;background-color:white;padding:3px;'>"+eq.name+"</div> "
			+"</div>";
			var id=eq.id;
			var ox=0;
			var oy=0;
		    city2_map.city2_map.listdiv(x,y,str,id,ox,oy);
		   
	    }
	    }
	}
   function detail(id){
		     $.dialog({
	          id: 'LHG1976D1',
	          content: "url:"+ctx+"/ws/cat/detail?id="+id,
	          lock:true,
	          title:  '设备详情',
	          height:600,
	          width:650,
	          ok:false,
	          init:function(){ 
	          },
		      cancel: true
	      });
   }  
	</script>
  </head>
  
  <body>
  <div style="position: absolute;top: 0px;left: 0px;z-index: 999999999999">
  
  <ul id="departTree"    style="height: 560px;" class="ztree"></ul>
  </div>
      <div id="map" style="width:100%; height: 100%">
      <script language="javascript" src='http://10.170.126.191/kangaroo/showmapuser/indexuser.jsp?city=yx&w=100&h=100&defaultx=-32768&defaulty=-4096&time=2&maproadline=false&mapbus=false&zb=false&mapscal=true&smallmap=false&wu=mm&maptype=2&mapzoom=8&navigator=false&toolbar=false&scalebar=true&minimap=false&menusearch=false&hots=false&doors=false&views=false&zoomable=true&dragable=true&wheelable=true&mapx=&mapy=&mapw=100&maph=100&newpage=false&uid=null&uniturl=http://qd.city2.cc&dz=http://10.170.126.191/'></script></div>

   <script type="text/javascript">
       
        $("#departTree").height($(window).height()-15);
         $("#map").height($(window).height());
		$(window).resize(function() {
		 $("#map").height($(window).height());
		     $("#departTree").height($(window).height()-15);
		});
	 function ycimgShowRight(){
		if(city2_map){ 
			var imgShowRight=city2_map.document.getElementById("imgShowRight");
			imgShowRight.style.display="none";
		}else{
			window.setTimeout("ycimgShowRight",20);
		}
	}
	 ycimgShowRight();
	 </script>
  </body>
</html>
