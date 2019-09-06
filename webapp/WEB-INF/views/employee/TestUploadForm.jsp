<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/calendar.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"> 
<html>
<head>
	<title></title>
	 <link href="${ctx }/upload/css/common.css" type="text/css" rel="stylesheet"/>
  	 <link href="${ctx }/upload/css/index.css" type="text/css" rel="stylesheet"/>
	 <script src="${ctx }/upload/js/jquery.js"></script>
	 <script src="${ctx }/upload/js/imgPlugin.js"></script>
</head>

<body>

<div class="img-box full">
	<section class=" img-section">
		<p class="up-p">作品图片：<span class="up-span">最多可以上传5张图片，马上上传</span></p>
		<div class="z_photo upimg-div clear" >
				 <section class="z_file fl">
					<img src="${ctx}/upload/img/a11.png" class="add-img">
					<input type="file" name="file" id="file" class="file" value="" accept="image/jpg,image/jpeg,image/png,image/bmp" multiple />
				 </section>
		 </div>
	 </section>
</div>
<aside class="mask works-mask">
	<div class="mask-content">
		<p class="del-p ">您确定要删除作品图片吗？</p>
		<p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
	</div>
</aside>
</body>
</html>
