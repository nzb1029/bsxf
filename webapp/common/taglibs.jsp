<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"> 
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="org.bsxf.web.LtSecurityUtils"%>

<%@page import="org.springside.mapper.JsonMapper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springside.org.cn/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static-content?contentPath="/>

<link href="${ctx}/static/jquery-validation/1.9.0/validate.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/bootstrap/2.1.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />

<script src="${ctx}/static/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="${ctx}/static/bootstrap/2.1.0/js/bootstrap.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery.json-2.2.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery.form.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-validation/1.9.0/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-validation/1.9.0/messages_cn.js" type="text/javascript"></script>
 <script src="${ctx}/static/placeMe.js" type="text/javascript"></script>
 <script src="${ctx}/static/util.js" type="text/javascript"></script>
 <link href="${ctx}/static/user.css" type="text/css" rel="stylesheet" />
 <link rel="stylesheet" href="${ctx}/static/normalize.css">
 <link rel="stylesheet" href="${ctx}/static/skeleton.css">
 <link rel="stylesheet" href="${ctx}/static/custom.css">
 <link rel="stylesheet" href="${ctx}/static/admin.css">
 <link rel="stylesheet" href="${ctx}/static/index.css">
 <link rel="stylesheet" type="text/css" href="${ctx }/static/easyui/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx }/static/easyui/icon.css">
<script type="text/javascript" src="${ctx }/static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx }/static/easyui/jquery.portal.js"></script>

<link rel="icon" type="image/png" href="../../dist/images/favicon.png">

<script type='text/javascript'>
jQuery.ajaxSettings.cache = false; 
    var Permission=<% 
    if(LtSecurityUtils.getShiroUser()==null)
        out.write("{}");
    else 
    	out.write(JsonMapper.nonDefaultMapper().toJson(LtSecurityUtils.getShiroUser().getPermission())); 
     %>;
	var ctx="${ctx}";
	var staticPath="${ctx}/static-content?contentPath=";
	$(function(){
		$(".close").click(function(){
			$(this).parent().hide();
			
		});
		
	});
	//弹出框的指向父创窗口对象
	if(frameElement)
	  { 
	  api = frameElement.api;
	  if(api)
	     W = api.opener;	
	  }
$(function(){ 
     //var winMainTitle= document.getElementById("winMainTitle");
    // if(!winMainTitle){winMainTitle=window.parent.document.getElementById("winMainTitle");}
      if(true){
      	 //winMainTitle.setAttribute("class","");
      	 var mtoolBar=$(".mtoolBar");
      	 if(mtoolBar.size()>0)
           {
          //  var bwidth=$(document.body).width() ;
          // $(document.body).append("<div class='mainTitle' style='position: absolute;top:0;left:0;width:"+bwidth+"px;'>&nbsp;</div>");
           
          // winMainTitle.setAttribute("class","mainTitle");
           mtoolBar.find("li").hover(function(){
               $(this).attr("class","ontb");
              },function(){ $(this).attr("class","out1")});//each(function(a,b){alert(a+b);});
           }
      }    
});	  
</script>