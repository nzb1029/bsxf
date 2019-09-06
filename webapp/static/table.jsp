<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.bsxf.utils.JdbcUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String st=request.getParameter("st");
String[] ts=null;
String[] cs=null;
List<Map<String, Object>>  tList =new ArrayList<Map<String, Object>>();
List<Map<String, Object>> resList = null;
if(st==null ||"".equals(st)){
	out.println("请传参数站点名称：st=demo");
	
}else {
	 
	String pg=request.getParameter("page");
	int start=0;
	int limit =100;
	if(!"".equals(pg)&& pg!=null)
		start=(Integer.valueOf(pg)-1)*limit;
	 String sql1="select table_name,table_comment   from   information_schema.TABLES where TABLE_SCHEMA='"+st+"' and table_name not like 'qrtz_%'and table_name not like 'wf_%'  and table_name not like 'html_%' and table_name not like 'ec_%' ";
	   tList = JdbcUtil.executeQuery(sql1,new HashMap<String, Object>());
	System.out.println(tList);
	 String pstr="";
	 String cstr="";
	 List<String>ids=new ArrayList<String>();
	 if(tList.size()>0){
		 for(Map tMap :tList){ 
		 
		 String table_name= tMap.get("table_name")==null?"":tMap.get("table_name").toString(); 
		 ids.add("'"+table_name+"'");}
		// cstr= tMap.get("table_comment")==null?"":tMap.get("table_comment").toString(); 
	 }
	
	 ts=pstr.split(",");
	 cs=cstr.split(",");
	 pstr=StringUtils.join(ids,",");//"'"+pstr.replaceAll(",","','")+"'";
	
	String sql =  "select COLUMN_NAME,DATA_TYPE,column_comment,"
          +" table_name,character_maximum_length "
 		  +" from information_schema.COLUMNS "
          +" where TABLE_SCHEMA='"+st+"' and table_name in("+pstr+")  " ;
	  System.out.println("++++++++"+sql);
	//System.out.println("++++++++"+sql);
	// System.out.println("++++++++"+ndao);
	resList = JdbcUtil.executeQuery(sql,new HashMap<String, Object>());
	//System.out.println("++++++++"+resList);
	 
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>表结构详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	table {
	    border-collapse: collapse;
	    border-color: #000;
	}
	 td{
	 	border-color: #000;padding: 3px;
	 	}
	.borderBt{
	   border-bottom:1px solid #000;
	   }
	.fborder{border:1px solid #000;}
</style>
  </head>
  
  <body>
  <%
  //String tbname=""; 
  //System.out.println("++++++++"+resList);
  String dstr="";
  String olddstr="";
  if(resList!=null)
  for(int i=0;i<tList.size();i++){
	  String tbname=tList.get(i).get("table_name").toString();//
	  System.out.println("++++++++"+tbname);
	  String tbc=tList.get(i).get("table_comment").toString();
	  out.println("<div style='font-weight: bold;'>"+(i+1)+" "+tbc+"</div>"); 
	  out.println("<div style='font-weight: bold;'>表名"+":"+tbname+"</div>"); 
	 
	 // String dstr="";
  for(Map tmap:resList){ //System.out.println("++++++++"+tbname+":"+tmap.get("TABLE_NAME").toString());
	  if(tbname.equals(tmap.get("TABLE_NAME").toString())) { 
		 String ntabname=tmap.get("TABLE_NAME").toString() ; 
		 String COLUMN_NAME=tmap.get("COLUMN_NAME").toString() ;  
		 String COLUMN_COMMENT=tmap.get("COLUMN_COMMENT")==null?"":tmap.get("COLUMN_COMMENT").toString() ;  
		 String DATA_TYPE=tmap.get("DATA_TYPE").toString() ;  
		 String CHARACTER_MAXIMUM_LENGTH=tmap.get("CHARACTER_MAXIMUM_LENGTH")==null?"":tmap.get("CHARACTER_MAXIMUM_LENGTH").toString() ;  
		 dstr+="<tr><td width='150px;' style=' border-color: #000;'>"+COLUMN_NAME+"</td><td style=' border-color: #000;' width='80px;'>"+DATA_TYPE+"</td><td style=' border-color: #000;' width='80px;'>"+CHARACTER_MAXIMUM_LENGTH+"</td><td style=' border-color: #000;' width='190px;'>"+COLUMN_COMMENT+"</td></tr>"; 
	 
		} 
	 
	  }	
  //if(i>0){
	  out.println("<table style='width:500px;border-collapse: collapse;border-color: #000;'  cellpadding='0' cellspacing='0' border='1' ><tr><td style=' border-color: #000;' align='center'>列名</td><td style=' border-color: #000;' align='center'>类型</td><td style=' border-color: #000;' align='center'>长度</td><td style=' border-color: #000;' align='center'>描述</td></tr>"+dstr+"</table>"); 
    dstr="";  
	  
  //}
  } %>



  </body>
</html>
