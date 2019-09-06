<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="java.net.URLEncoder"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<title>帐号管理</title>
	<%@ include file="/WEB-INF/common/ckfinder.jsp" %>
	
	<script>
		var api = frameElement.api, W = api.opener;
		function seledImg(fileUrl, data){
		    
		    fileUrl = fileUrl.substring( fileUrl.indexOf("contentPath")+"contentPath".length+1);
		  //  alert(fileUrl);
		    W.seledImg(fileUrl, data);
		    api.close();
		} 
			/* var finder = new CKFinder();
			// The path for the installation of CKFinder (default = "/ckfinder/").
			finder.basePath = '${ctx}';
			// The default height is 400.
			finder.height = 600;
			// This is a sample function which is called when a file is selected in CKFinder.
			//finder.selectActionFunction = seledImg;
			//finder.resourceType="<%=URLEncoder.encode(request.getParameter("type"))%>";
			finder.create(); 
			*/
	</script>
</head>

<body> 
	  <ckfinder:ckfinder resourceType=""  basePath="/ckfinder/" width="700" height="700" selectFunction="seledImg"/>   	
 </body>
</html>
