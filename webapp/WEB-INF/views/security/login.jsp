<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.LockedAccountException "%>
<%@page import="org.bsxf.utils.EhcacheManager"%>
<%@page import="java.util.Date"%>
<%@page import="org.bsxf.common.web.SessionKey"%>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<link href="${ctx}/static/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/static/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
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
.form{background: rgba(255,255,255,0.2);width:400px;margin:120px auto;}
</style>

	<script src="${ctx}/static/bootstrap/2.1.0/js/bootstrap.min.js" type="text/javascript"></script> 
</head>

<body>
<div class="values" id="header">
    <div class="container">
        <div class="form row">
            <form:form id="loginForm"  cssStyle="text-align: center;"  action="${ctx}/login" method="post">
                <div class="form-horizontal col-md-offset-3" id="login_form">
                    <h3 class="form-title">账户登录</h3>
                    <div class="col-md-9">
                        <div class="form-group">
                            <i class="fa fa-user fa-lg"></i>
                            <input class="form-control required" type="text" placeholder="用户名" id="username" name="username" autofocus="autofocus"/>
                        </div>
                        <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <input class="form-control required" type="password" placeholder="密码" id="password" name="password"/>
                        </div>
                        <div class="form-group">
                            <input class="form-control" type="text" placeholder="输入右图字符" id="valid" name="j_captcha" style="width:60%"/>
                            <a href="javascript:void(0);"><img src="${ctx }/jcaptcha.jpg" id="validImg" onclick="reImg();" title="看不清请点击更换" style="width:30%"></a>
                            <%--
                            <input class="form-control" type="text" placeholder="输入右图字符" id="valid" name="j_captcha"/>
                            <a href="javascript:void(0);"><img src="${ctx }/jcaptcha.jpg" id="validImg" onclick="reImg();" title="看不清请点击更换"></a>
                         --%>
                        </div>
                        <div class="form-group">
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
                        <div class="form-group col-md-offset-9">
                            <button type="submit form-control" class="btn btn-success center-block" name="submit">登录</button>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>

</body>
</html>
