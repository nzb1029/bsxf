<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
<%@ include file="/WEB-INF/common/lhgdialog.jsp"%>
<html>
  <head> 
<title>My JSP 'addpoint.jsp' starting page</title>
<script src="${ctx}/static/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="${ctx}/static/svg/svg.js" type="text/javascript"></script>
<script src="${ctx}/static/svg/jquery.mousewheel.js" type="text/javascript"></script>
<script src="${ctx}/static/svg/drag-move.js" type="text/javascript"></script>
<script src="${ctx}/static/svg/jquery.vsvg.min.js" type="text/javascript"></script>
  <script type="text/javascript">
     var  centerX,centerY;
     
	  $(function(){
	      var moveX=100,moveY=100;
	      var cwidth=300,cheight=300;
	      var draw = SVG('drawing').size(300, 300);
	      var group = draw.group();//.size(300, 300);
	      // new DragMove({defaultWidth:600,defaultHeight:600,width:300,height:300},group,"drawing").makeDraggable();
	    
          //  for(var key in draw)
           // alert(draw.node.setA);
	      group.move(moveX,moveY);
	      var circle = draw.circle(cwidth,cheight).fill("#ffffff").stroke({ width: 5 });
	      group.add(circle);
	      //先移动到已group位基准 移动cwidth/2 位置，再以cwidth/2，0为坐标点旋转90度
	        centerX=cwidth/2;
	        centerY=cheight/2;
	      for(var i=0;i<=12;i++){
	         var rect= draw.rect(20,8).fill("black").move(0,cheight/2).rotate(i*30,centerX,centerY);
	         group.add(rect);
	         var t=9+i;
	         if(t>12)t=t-12;
	        {
	          var text = draw.text(t+"");//.move(22,cheight/2+8);//.rotate(i*30,centerX,centerY);
	           if(t==9){
	             text.move(22,cheight/2-6);
	          }
	            if(t==10){
	             text.move(35,cheight/2-70);
	          }
	           if(t==11){
	             text.move(80,cheight/2-110);
	          }
	           if(t==12){
	             text.move(137,20);
	          }
	            if(t==1){
	             text.move(207,35);
	          } if(t==2){
	             text.move(249,76);
	          }
	           if(t==3){
	             text.move(269,cheight/2-14);
	          }
	           if(t==4){
	             text.move(252,cheight/2+49);
	          }
	          if(t==5){
	             text.move(212,cheight/2+95);
	          }
	          if(t==6){
	             text.move(150,cheight/2+112);
	          }
	          if(t==7){
	             text.move(88,cheight/2+98);
	          }
	           if(t==8){
	             text.move(42,cheight/2+56);
	          }
	          group.add(text);
	        //  text.tspan(t+"").rotate(30,22,cheight/2+8);
	         }
	        //  var text = draw.text("ffff").move(25,cheight/2-50);
	         //  group.add(text);
	      }
	      for(var i=0;i<=60;i++){
	         var rect= draw.rect(10,5).fill("black").move(0,cheight/2).rotate(i*6,centerX,centerY);
	         group.add(rect);
	      }
	      //人脸
	      var tou = draw.circle(80,80).fill("#ffffff").stroke({ width: 1 }).move(450,0);
	      group.add(tou);
	     var yan = draw.ellipse(20,10).fill("#ffffff").stroke({ width: 1 }).move(460,20);
	      group.add(yan);
	     var yan1 = draw.ellipse(20,10).fill("#ffffff").stroke({ width: 1 }).move(500,20);
	      group.add(yan1); 
	        var yan2 = draw.circle(10,10).fill("black").stroke({ width: 1 }).move(505,20);
	      group.add(yan2); 
	         var yan3 = draw.circle(10,10).fill("black").stroke({ width: 1 }).move(465,20);
	      group.add(yan3); 
        var rect= draw.rect(5,20).fill("black").move(487,25);
         group.add(rect);
       var path =draw.path('M480,60 A10,5 0 1 0 500,60');
	    group.add(path);  
	    ///
	    var d=new Date();
        var h=d.getHours() ;//返回 Date 对象的小时 (0 ~ 23)。 
	    var m = d.getMinutes();// 返回 Date 对象的分钟 (0 ~ 59)。 
	    var s=d.getSeconds();// 返回 Date 对象的秒数 (0 ~ 59)。  
	    //小时
	     hour1=90+h*30+30*m/60;
	     hour= draw.rect(cwidth/2-10,12).fill("black").move(0+40,cheight/2-2).rotate(hour1,centerX,centerY);
	     group.add(hour);
	    
	    //分钟
	     minute1=90+m*6;
	     minute= draw.rect(cwidth/2+10,10).fill("black").move(0+20,cheight/2-1).rotate(90+m*6,centerX,centerY);
	     group.add(minute);
		// alert(s);
		// alert(90+s*6);秒
		 seconed3=90+s*6;
	     seconed2= draw.rect(cwidth/2+10,4).fill("red").move(0+30,cheight/2+1).rotate(seconed3,centerX,centerY);
	     group.add(seconed2);
	     seconed1 = draw.circle(10,10).fill("red").stroke({ width: 0 }).move(0+20,cheight/2-2).rotate(seconed3,centerX,centerY);
	     group.add(seconed1);
	    
	    jQuery('#drawing').vectorSvg({
                  svg: draw.node,
                  group:group.node,
                  width:400,
                  height:400//,
                //  container:$()
                });
	    });
	  
	   var seconed1=null,seconed2=null,seconed3,minute,minute1,hour,hour1;   
	   window.setInterval('recalc()', 1000); 
	   var seconedI=1;
	  
	   function recalc(){ 
	       ///
		    var d=new Date();
	        var h=d.getHours() ;//返回 Date 对象的小时 (0 ~ 23)。 
		    var m = d.getMinutes();// 返回 Date 对象的分钟 (0 ~ 59)。 
		    var s=d.getSeconds();// 返回 Date 对象的秒数 (0 ~ 59)。  
	        var  hour1=90+h*30+30*m/60;
		    hour.rotate(hour1,centerX,centerY);
		    
		    //分钟
		     minute1=90+m*6;
		     minute.rotate(90+m*6,centerX,centerY);
			// alert(s);
			// alert(90+s*6);秒
			 seconed3=90+s*6;
		     seconed2.rotate(seconed3,centerX,centerY);
		     seconed1.rotate(seconed3,centerX,centerY);
		   
	      /*  if(seconed1)
	          {
	         
	          seconed1.rotate(seconed3+seconedI*6,centerX,centerY);
	          seconed2.rotate(seconed3+seconedI*6,centerX,centerY);
	          if((seconed3+seconedI*6-90)%360==0){
	             minute1=minute1+6;
	             minute.rotate(minute1,centerX,centerY);
	          }
	          if((minute1-90)%360==0){
	              hour1=hour1+1.2;
	             // hour.rotate(hour1,centerX,centerY);
	          }
	          seconedI++;
	          }
	     */
	     }
 </script>
    
  </head>
  
  <body>
  
     <div id="drawing" style="width: 510px;height: 500px;margin-left: 400px;">
   </div>
      <div id="canvas" >
   </div>
  </body>
</html>
