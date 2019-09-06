<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
  <head>
  <title>数据导入</title>
  <script src="${ctx}/static/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="${ctx }/static/fileupload/uploadify.css" />
  <script type="text/javascript" src="${ctx }/static/fileupload/jquery.uploadify.js"></script>
  <script type="text/javascript">
  var ctx='${ctx}';
  var uploadLimit=0;
  $(function(){
     api = frameElement.api;
	 W = api.opener;	
    $("#uploadify").uploadify({
		   
	        multi		  :false,
	        fileSizeLimit :"100MB",
	        fileTypeExts  :"*.xls", 
	       
            height        : 30,
	        swf           : ctx+'/static/fileupload/uploadify.swf',
	        uploader      : ctx+'/upload.file',
	        width         : 120,
	        'method' : 'get', 
	        buttonImg:"../static/img/logo.jpg",
	        buttonText    :"选择文件",
	        'formData'    :{'module': "temp"},//检测FLASH失败调用
			onFallback :function(){
				alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
			},
			//上传到服务器，服务器返回相应信息到data里
			onUploadSuccess:function(file, data, response){
			  // alert(data);
			     $.ajax({
			         url:ctx+"/${url}",
			         cache:false,
			         type:"POST",
	                 dataType:"json", 
	                 data:{import_module:"temp",import_fname:data},
			         success:function(d){
			              if(d.msg){alert(d.msg);return ;}
			              
						  if(W.afterImport)
						     W.afterImport();
						  api.close();
			         }
			          
			       });
			    //loadFiles();
            	//bindSelected();
			},
			//overrideEvents : ['onSelect'],
			onSelectError:function(){ 
			   return true;
			}
		
      
	    });
   });
  </script>
  </head>
  
  <body>
  <div>提示：要导入的文件请基于模板格式填写，<a href="${ctx }/static-content?download=true&contentPath=templete/${tempFileName}" style="color: red;">  点这儿下载模板</a> 文件 </div>
 <div style=" margin-right: 30px;margin-top: 10px;">  <div id="uploadify"  >  </div></div>
  </body>
</html>
