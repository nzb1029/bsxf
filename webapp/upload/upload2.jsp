<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<html>
  <head>
  <title>文件上传</title>
  <script src="${ctx}/static/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="${ctx }/static/fileupload/uploadify.css" />
  <script type="text/javascript" src="${ctx }/static/fileupload/jquery.uploadify.js"></script>
  <script type="text/javascript" src="${ctx }/static/contextmenu/jquery.contextmenu.js"></script>
   <%@include file="/WEB-INF/common/lhgdialog.jsp" %>
  <script type="text/javascript">
	var ctx='${ctx}';
  </script>
  <script src="upload2.js" type="text/javascript"></script>
  <style type="text/css">
   .img{height:100px;}
  </style>
  </head>
  
  <body style="padding: 0;margin: 0;">
  <div id='wrapper_${param.iframeId}' style="margin: 0;">

 <div  style="float: left;margin-left: 5px;"> <div id="uploadify">  </div></div>
 <div id="files_div" style="overflow: none;width: 80%">
   <div id="queue"  style="width: 120px;overflow: hidden"></div>
 
</div>

 <!--右键菜单的源-->
 
     <div class="contextMenu" id="myMenu1">
      <ul>
          <li id="view"><div style="width: 20px;float: left;"><img src="${ctx }/static/fileupload/images/toolbar/view.gif" /></div>查看</li>
        <li id="down"><div style="width: 20px;float: left;"><img src="${ctx }/static/fileupload/images/toolbar/download.gif" /></div> 下载</li>
        <li id="delete"><div style="width: 20px;float: left;"><img src="${ctx }/static/fileupload/images/toolbar/delete.gif" /></div> 删除</li>
         </ul>
    </div>
   <img id="viewImg" src="" style="display: none;"/>
<div style="clear: both;"></div>  
</div>

  </body>
</html>
