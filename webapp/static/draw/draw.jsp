<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deaw.jsp' starting page</title>
        <style type="text/css">
.popupcontent  
{  
position: absolute;  
border:1px solid #CCC;     
background-color:#F9F9F9;     
border:1px solid #333;     
padding:5px;  
} 
    </style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="static/jquery/1.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="static/draw/jquery.draw.js"></script>
	<script type="text/javascript" src="static/draw/jquery.hot.js"></script>
	 <script type="text/javascript">
	 $(function(){
	         $("#hotImg").drawLine();
	          $("#hotImg").addHot({clickEvent:function(e,div){alert(e+div);}});
			 //x:311,320,501,266,309
			 //y:206,325,322,285,207
	 })
	 </script>

  </head>
  
  <body>
  <div style="padding: 10;">
   <img drawtitle='A部位_B部位_C部位'   xcoords="311,320,501,266,309_265,439,260,262_193,299,424,333,196" ycoords="206,325,322,285,207_377,470,529,383_656,804,739,633,656" src="static/draw/73e94c6cjw1dxcdbx282kj.jpg" id="hotImg"/>
   </div>
   <div id="tip" class="popupcontent"  ></div>    
   
  </body>
</html>
