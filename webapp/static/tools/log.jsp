<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="java.io.RandomAccessFile"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String defaultPath = request.getSession().getServletContext().getRealPath("/");//"/opt/tomcat";
	defaultPath=new File(defaultPath).getParentFile().getParentFile().getPath();
	System.out.println("...."+defaultPath);
	String filePath = new File(defaultPath, "logs").getAbsolutePath();
	File[] files = new File(filePath).listFiles();
	StringBuffer sb = new StringBuffer();
	String logStr = "";
	String getLength = request.getParameter("getLength");
	int gl=0;
	if("".equals(getLength)){
		gl=Integer.valueOf(getLength);
		
	}
	for (int i = 0; i < files.length; i++) {
		String name = files[i].getName().toLowerCase();
		if (name.equals("akl.log")) {
			try {
				logStr = redFile(files[i],  gl);
			//	response.getWriter().write(logStr);
				//out.println(logStr);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}
%>
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
						String lastLine = new String(raf.readLine().getBytes("iso-8859-1"), "GB2312");
						i++; 
						errList.add(lastLine);
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
		{     return "出现异常了";
		//	e.printStackTrace();
		}
		return sb.toString()        ;
}

 %>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>log</title>
    
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
  <a style="position: fixed;top:0px;left:0px;background-color: white;padding:10px;width:200px;border:1px solid red;" href="<%=path%>/static-content?fullpath=<%=filePath+"/akl.log" %>&download=true">catalina.out</a>
   <textarea id="log" rows="30" cols="150">
   <%=logStr %>
 </textarea>
 <script type="text/javascript">
 var d = document.getElementById("log").scrollHeight;
document.getElementById("log").scrollTop = d;
 </script>
  </body>
</html>

