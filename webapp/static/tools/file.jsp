<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.commons.lang.StringUtils"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dpath=request.getSession().getServletContext().getRealPath("/");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>服务器文件浏览</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="static/jquery/1.7.1/jquery.min.js"></script>
	<style type="text/css">
	table{
	border:#c3daf0 1px solid;
	}
	td{
	border:#c3daf0 1px solid;
	padding: 10px;
	
	}
	</style>
	<script type="text/javascript">
	  function del(path){
	  alert("不支持此操作");
	     /* var st=document.body.scrollTop;
	      //$("#passwdDiv").css("top",Number(st)+100);
	      $("#passwdDiv").show();
	      $("#passwd").focus();
	      $("#delFilePath").val(path);
	      return ;
	      var a =  window.prompt("请输入密码");
	      if(a){
	    
	      
	      }
	      */
	  }
	  function delFile(){
	       var path=  $("#delFilePath").val();
	       var ppath=document.getElementById("ppath").value; 
	       var a=$("#passwd").val()
	       window.location.href="<%=path%>/page/hzj/fileshow.jsp?path="+ppath+"&delpath="+path+"&pswd="+a;
	  }
	  
	  function upFile(a){
	     // alert(a);
	    // alert($(a).attr("fpath"));
	     var path="upload/upload.jsp?module="+$(a).attr("fpath")+"&fileSizeLimit=100MB&uploadLimit=13&multi=true&fullpath=true";
	     $("#uploadFrame").attr("src",path).show();
	   // var path="<%=path%>/"+$(a).attr("fpath") ;
       // window.showModalDialog(path,window,"dialogHeight: 400; dialogWidth:600;dialogTop: 100; dialogLeft:300; resizable: no; status: no;scroll:no;toolbar=no; menubar=no;"); //  $("officeFrame").src= path;
	  
	  
	  }
	  function show(fname){ 
	     $("#fimstr").attr("src","<%=path%>/static-content?fullpath="+$(fname).attr("imgsrc"));
	     $("#imgshow").show(); 
	  }
	</script>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%
   
   try{
	   String fpath=request.getParameter("path");
 
    if(StringUtils.isBlank(fpath))fpath=dpath;
    String delpath=request.getParameter("delpath");
    String pswd=request.getParameter("pswd");
    String msg="";
    
    if(delpath!=null && !delpath.equals("")){//删除文件
    	if(pswd!=null && !pswd.equals("")){
    		//if("bfdc5ab7a9c8aad0994c0447efffdfbe".equals(MD5Crypt.getMD5(pswd.getBytes())))
    		{//密码正确
    			File delFile=new File(delpath);
    			 System.out.println("==========delFile:"+delFile);	
                 if(delFile.exists()){delFile.delete();msg="删除文件"+delFile+"成功";}
                 else {
                	 msg="文件"+delFile+"不存在"; 
                	 
                 }
    			
    		}//else msg="密码错误";
    		
    	}else msg="请输入密码";
    	
    	
    }
    if(fpath==null || fpath.equals(""))
    	fpath="/";
    File pf=new   File(fpath);
	File[] files = pf.listFiles();
	if(files==null)files = new File[0];
	//for(File f:files)
	System.out.println("==========path:"+pf.getPath());	
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>
<style>
 
</style>
  </head>
  
  <body style="padding:0;margin:0">
  <div id="imgshow" style="position: fixed;top: 50px;right: 20px;display: none;border:#c3daf0 1px solid;padding: 5px;background-color: white;width: 500px;overflow: auto;height: 500px;">
  <div><input type="button" value="关闭" onclick="$('#imgshow').hide();"/></div>  
  <img src="" id="fimstr">
 
  </div>
  <div id="passwdDiv" style="border:#c3daf0 1px solid;display: none;position: fixed;top:100;left:100;background-color: white;width: 500px;height: 300px; padding-left: 200px;">
 <form onsubmit="delFile();return false;" style="padding-top: 100px;;">
  <label>密码：</label><input type="password" id="passwd"/>
  <input type="hidden" id="delFilePath"/>
  <input type="submit" value="确定" />
  <input type="button" value="取消" onclick="$('#passwdDiv').hide()"/>
  </form>
  </div>
  
  
  <div style="color:red; padding-left: 400px;padding-top: 10px;"><%=msg %></div>
  <input type="hidden" value="<%=URLEncoder.encode(pf.getPath()) %>" id="ppath">
  <a href="<%=path+"/static/tools/file.jsp?path="+pf.getParentFile().getPath() %>" style='display:block;float:left;padding-left: 50px;padding-right: 50px;'>返回上一级</a><%=pf.getPath()
       
  %>   &nbsp;&nbsp;&nbsp;&nbsp;
 
   <a style="padding-left: 20px;display:none;" target="_blank" href="page/hzj/down.jsp?path=<%=URLEncoder.encode(pf.getPath()) %>&zip=true">打包下载当前文件夹</a>
   &nbsp;&nbsp;<a onclick="upFile(this);"  href="javascript:void(0);" fpath='<%=pf.getPath() %>'>上传</a>
 
 <iframe style="display: none;" src="" id="uploadFrame" width="800" height="200">
 
 </iframe>
 
  <br> <table cellpadding="0" cellspacing="0" style="margin-top: 20px;">
  	<tr><td>文件名(<%=files.length %>个对象)</td><td>操作</td><td>最后更新时间</td><td>大小(kb)</td><td>FreeSpace(MB)</td></tr>
  	<% for(File f:files){	//System.out.println("==========path:"+f.listFiles());
  	%>
  		
   <tr><td>
	   <%if(f.isFile()) out.println(f.getName());else {%>
	  <a href="static/tools/file.jsp?path=<%=URLEncoder.encode(f.getPath()) %>"><%=f.getName()+"("+(f.listFiles()==null?0:f.listFiles().length)+"个对象)" %></a>
	    <%}
	   
	   //System.out.println("==========path:"+f.getPath());
	   %>
   </td>
   <td>
	   <% //if(f.isFile()) out.println( "<a target='_blank' href=\"static-content?fullpath="+URLEncoder.encode(f.getAbsolutePath())+"&download=true\">下载</a>&nbsp;&nbsp; <a  href=\"javascript:del('"+URLEncoder.encode(f.getPath())+"')\">删除</a>&nbsp;&nbsp; <a imgsrc="+f.getAbsolutePath()+"  onclick='show(this)' href='javascript:void(0)'>预览</a>");else { %>
	    <%out.println("&nbsp;");// } 
	  // System.out.println("==========path:"+f.getPath());
	    %>
   </td>
   <td><%Date dd = new Date(f.lastModified());out.println(df.format(dd));%></td><td><%=f.length()/(1024) %></td>
   <td><%=f.getFreeSpace()/(1024*1024) %></td>
   </tr>		
  	<%
  	}
  	}catch(Exception e){e.printStackTrace();}
   %>
  </table>
  </body>
</html>
