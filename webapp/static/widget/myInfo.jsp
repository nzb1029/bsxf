<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.bsxf.web.LtSecurityUtils"%>
<%@page import="org.bsxf.common.service.AccountManager"%>
<%@page import="org.springside.web.SpringContextHolder"%>
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
AccountManager accountManager=SpringContextHolder.getBean(AccountManager.class);
if(LtSecurityUtils.getLoginUser()==null){
	return ;
	
}
List<Map<String, Object>> list=accountManager.getUserLog(LtSecurityUtils.getLoginUser().getId());
Map<String, Object> lmap=list.get(0);
Map<String, Object> pmap=null;
if(list.size()>1)
  pmap=list.get(1);
else pmap=lmap;


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  </head>
  
  <body>
   <table style="margin-left: 5px;margin-top: 5px;margin-bottom: 20px;"><tr><td>
		欢迎您登录：<%=LtSecurityUtils.getShiroUser().getLoginName() %>  [ <a target="_top" href="<%=path %>/logout">安全退出</a> ]
   </td></tr>
   <tr><td>您累积登录了 <%=lmap.get("log_count") %> 次
   </td></tr>
   <tr><td>您的上次登录时间是：<%=pmap.get("log_time") %> 于 <%=pmap.get("ip") %></td></tr>
    <tr><td>
请确认是否您本人操作，如登录异常，请 [ <a href="<%=path %>/account/user/userinfo">修改密码</a> ]
</td></tr>
   </table>
  </body>
</html>
