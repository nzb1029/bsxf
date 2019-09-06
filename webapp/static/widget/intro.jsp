<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.bsxf.utils.EhcacheManager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <!-- 
    感谢您选择本系统.
    我们本着专业的技术、稳定的团队、贴心的服务，最大限度的满足您的需求！
    本系统集成:
    1、apache安全框架shiro，保证系统安全性。
    2、系统用户我们用sha1 散列加密1024次，让密码无法被解密泄露！
    3、系统架构使用最新的spring + mybatis + jquery 结构，保证了开发效率和系统稳定性！
    4、系统部署简单，tomcat,mysql都是很容易安装的系统运行必备软件。
    5、按照“按需服务（Service-on-Demand）”的方式提供软件服务。
    6、我们的开发目标是低成本、简单而强大。
    7、
   -->
   <%=EhcacheManager.getStationConfig().getIntro() %>
  </body>
</html>
