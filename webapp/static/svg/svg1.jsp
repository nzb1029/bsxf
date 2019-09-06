<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
<%@ include file="/WEB-INF/common/lhgdialog.jsp"%>
<html>
  <head> 
<title>My JSP 'addpoint.jsp' starting page</title>
<script src="${ctx}/static/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="${ctx}/static/svg/svg.js" type="text/javascript"></script>
<script src="${ctx}/static/svg/svg.draggable.js" type="text/javascript"></script>  
<script src="${ctx}/static/svg/jquery.mousewheel.js" type="text/javascript"></script>  
<script src="${ctx}/static/svg/jquery.vsvg.min.js" type="text/javascript"></script>  
  <script type="text/javascript">
     var  centerX,centerY;
     
	  $(function(){ 
	    var draw = SVG('drawing');//.size(300, 300).style({left:100});
	    var group = draw.group();
        // create image
        var image = draw.image('${ctx}/static/svg/2340259_204911005918_2.jpg').loaded(function(loader) { 
				  jQuery('#drawing').vectorSvg({
	                  svg: draw.node,
	                  group:group.node,
	                  width:loader.width,
	                  height:loader.height
	                 //container:$()
	                }); 
				});
		    group.add(image)
		    image.animate(3000).move(900,-200).loop();
		 	//image.animate(1000).move(0,-200).loop();   
		   var text = draw.text("想要吗？").move( 100 , -30 ).font({ size: 46 }).style({cursor: "pointer"});
		   text.animate(3000).move(0,-200).loop();
		   group.add(text); 
	    });
	  
	  
	     
 </script>
    
  </head>
  
  <body>
  
     <div id="drawing" style="width: 510px;height: 500px; border: 1px solid red;margin-left: 400px;">
   </div>
      <div id="canvas" >
   </div>
  </body>
</html>
