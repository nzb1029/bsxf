<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.LockedAccountException "%>
<%@page import="org.bsxf.utils.EhcacheManager"%>
<%@page import="java.util.Date"%>
<%@page import="org.bsxf.common.web.SessionKey"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<link rel="shortcut icon" href="${ctx }/static/ico/favicon.ico" type="image/x-icon" />
	<title><%=EhcacheManager.getStationConfig().getName()%></title>
	<link href="${ctx}/static/login.css" type="text/css" rel="stylesheet" />
	<style type="text/css">
	label.error,span.error{
		 
		}
	</style>
	<script>
		$(document).ready(function() {
			$("#loginForm").validate();
			
			 
			$("#username").focus();
		});
		function reImg(){
		 $("#validImg").attr("src","${ctx}/jcaptcha.jpg?t="+new Date().getTime());
		}
	</script>
<style type="text/css">

.header1 {

    background:none repeat scroll 0 0 #113F70;
    color: #FFFFFF;
    height: 65px;
    position: relative;
    width: 100%;
    z-index: 2;
}
.bg{
   filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
   -moz-background-size:100% 100%;
   background-size:100% 100%;
}
</style>

	<script src="${ctx}/static/bootstrap/2.1.0/js/bootstrap.min.js" type="text/javascript"></script> 
</head>

<body>
	<div class="values" id="header">
    <div class="container">
      <div class="row">
        <div id="logo_row" class="lLogo"/>
      </div>
      <div class="row top_20">
        <div class="one-half_1 column category">
          <div id="des_1" class="top_122">中国农业智能测试系统</div>
          <div id="des_2" class="top_40">智慧农业 创新未来</div>
          <div id="des_3" class="top_66">爱科农公司自主研发的大数据驱动型智能农业技术系统(FIS)可以为农业种植者提供及时、高效、精准的管理决策，以解决中国农业当前存在的问题。</div>
        </div>
		<form:form id="loginForm"  cssStyle="text-align: center;"  action="${ctx}/login" method="post">
        <div class="one-half_2 column category">
            <div id="login">
              <div id="login_title">
                账户登录
              </div>
              <input id="username" name="username" type="text" placeholder="用户名"/><br/>
              <input id="password" name="password" type="password" placeholder="密码"/><br/>
              <input id="valid" name="j_captcha" width="50px" type="text" placeholder="输入右图字符"/>
              <a href="javascript:void(0);"><img src="${ctx }/jcaptcha.jpg" id="validImg" onclick="reImg();" title="看不清请点击更换"></a><br/>
              <button type="submit">登录</button>
              
              <div class="top_20">
	<%
	String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	if(error != null){ 
		if(error.contains("DisabledAccountException")){
			request.getSession().removeAttribute(SessionKey.LOGIN_FAILED_COUNT);
	%>		
		<span class="error">用户已被屏蔽,请登录其他用户.</span>
	<% 
		}else if(error.contains("UnknownAccountException")){
					//System.out.println(error);
	%>
		<span class="error">用户不存在</span>
	<%
		}else if(error.contains("IncorrectCredentialsException")){
			//System.out.println(error);
	%>
		<span class="error">密码错误</span>
	<%
		}else if(error.contains("NoActivationException")){
			//System.out.println(error);
	%>
		<span class="error">当前用户尚未激活</span>
	<%
	 	}else { 
	%>
		<span class="error">登录失败，请重试。</span>
	<%
		}
	}else {
		// String ems=request.getParameter("error"); 
		String errorII=(String)request.getSession().getAttribute("error"); 
		if(errorII!=null && errorII.equals("2")){
	%>
			<span class="error">验证码出错。</span>
	<% 
		} 
		request.getSession().removeAttribute("error");
	}
	%>
	</div>
            </div>
        </div>
        </form:form>
      </div>
    </div>
  </div>

    <div class="container">
      <div class="row top_100" id="part2_des1">
        全球顶级农业企业
      </div>
      <div class="row" id="part2_des21"></div>
      <div class="row" class="top_70">
        <div class="one-third column">
            <div class="part2_des21_title">
              农业大数据
            </div>
            <div class="part2_des21_text top_20">
              该地块过去10年卫星图像，过去20年气候情况、地形变化、耕作制度等情况分析，并根据拟播种品种特性，计算出该地潜在产量和产量制约因素
            </div>
        </div>
        <div class="one-third column">
          <div class="part2_des21_title">
            智能农业决策
          </div>
          <div class="part2_des21_text top_20">
            该地块过去10年卫星图像，过去20年气候情况、地形变化、耕作制度等情况分析，并根据拟播种品种特性，计算出该地潜在产量和产量制约因素
          </div>
        </div>
        <div class="one-third column">
          <div class="part2_des21_title">
            实时科学管理
          </div>
          <div class="part2_des21_text top_20">
            该地块过去10年卫星图像，过去20年气候情况、地形变化、耕作制度等情况分析，并根据拟播种品种特性，计算出该地潜在产量和产量制约因素
          </div>
        </div>
        </div>
    </div>
  <div id="map">

  </div>
  <div id="contact_us">
    <div class="row top_40" id="contact_us_text">
      联系我们
    </div>
    <div class="row top_40">
      <div class="one-half column">
        <div id="wechat">
        </div>
      </div>
      <div class="one-half column" id="wechat_text">
        <div id="wechat_text_1">
          微信扫一扫
        </div>
        <div id="wechat_text_2">
          +86 188 1106 8098
        </div>
        <div id="wechat_text_3">
          icanculture@sina.com
        </div>
      </div>
    </div>
    <div class="container" id="footer">
      北京爱农科技有限公司
    </div>
  </div>
</div>

</body>
</html>
