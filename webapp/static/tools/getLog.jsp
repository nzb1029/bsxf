<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.bsxf.common.entity.sys.StationConfig"%>
<%@page import="org.bsxf.utils.EhcacheManager"%>
<%@page import="org.apache.log4j.Logger"%>
<%@page import="org.apache.log4j.Appender"%>
<%@page import="org.apache.log4j.RollingFileAppender"%>
<%@page import="org.apache.log4j.DailyRollingFileAppender"%>
<%@page import="java.io.File"%>
<%@page import="java.io.RandomAccessFile"%>
 
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=EhcacheManager.getStationConfig().getName() %>的日志</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%! 

public String redFile(File f,long gl){
	StringBuffer sb = new StringBuffer();
	long len =0;
       try
		{
			// 使用RandomAccessFile , 从后找最后一行数据
			RandomAccessFile raf = new RandomAccessFile(f, "r");
			len = raf.length();
			List<String> errList = new ArrayList<String>();
			if (len != 0L)
			{
				long pos = len - 1;
				int i = 0;
				if(gl>0)
				gl=len-gl;
				else gl=10;
				while (pos > 0)
				{
					if (i >1000)
						break;
					pos--;
					raf.seek(pos);
					if (raf.readByte() == '\n')
					{
						String rl=(raf.readLine());
						
						String lastLine = new String(rl.getBytes("iso-8859-1"),System.getProperty("sun.jnu.encoding"));
						//System.out.println(lastLine);
						i++;
						if (lastLine.indexOf("ERROR") != -1 ||lastLine.indexOf("Exception") != -1 || lastLine.startsWith("	at"))
				         {
                                if(lastLine.startsWith("	at"))
                                     lastLine="&nbsp;&nbsp;&nbsp;"+lastLine;
                               errList.add("<span style='color:red'>"+lastLine+"</span>");
                              }
                     else if(lastLine.indexOf("sql")!=-1)
                                     errList.add("<span style='color:red'>"+lastLine+"</span>");

				else 	errList.add(lastLine);
					}
				}
			}

			for (int i = errList.size(); i > 0; i--)
			{
				sb.append(errList.get(i - 1) + "\n");

			}
		//	System.out.println(sb.toString());
			raf.close();

		}
		catch (Exception e)
		{  //   return "出现异常了";
		    e.printStackTrace();
		}
		return sb.toString()        ;
}

 %> 
  </head>
  
  <body>
    <%
     //RollingFileAppender
        Logger logger = Logger.getRootLogger();
        DailyRollingFileAppender appender = (DailyRollingFileAppender)logger.getAppender("RollingFile");
        String logpath=appender.getFile();//日志文件存放位置
        File f=new  File(logpath);
        String  logStr = redFile(f,  0);
     %>
     <a style="position: fixed;top:0px;left:0px;background-color: white;padding:10px;width:200px;border:1px solid red;" href="<%=path%>/static-content?download=true&fullpath=<%=logpath %>">log.out</a>
  
  <pre>
   <%=logStr %>
 </pre>
  <script type="text/javascript">
  window.scroll(0,1000000);
 </script>
  </body>
</html>
