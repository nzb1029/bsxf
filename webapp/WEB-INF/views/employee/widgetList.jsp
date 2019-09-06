<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
<%@ include file="/WEB-INF/common/lhgdialog.jsp"%>
<html>
	<head>
		<title>  </title>
     <script type="text/javascript" src="${ctx }/static/data/employee/widget.js"></script>
     <script>
		jQuery(document).ready(function() {
		
		
		});
	</script>
	</head>

	<body>
	<div class="mtoolBar">
		<ul>
		<li  >
			<span class="out1">
			<img src="${ctx}/static/img/toolbar/16x16/icon_add.png"></span>
			  <input onclick="update();"  type="button" class="buttonRight"   id="create" value="添加"  >
			 
			
		</li>
		 
		 </ul>
	</div>
       <c:if test="${not empty message}">
			<div id="message" class="alert alert-success">
				<button data-dismiss="alert" class="close">
					×
				</button>
				<span id="message_div">${message}</span>
			</div>
		</c:if>
	
			 
		
		 
		<table id="contentTable"></table>
		<div id="pjqgajax"></div>
		
	</body>
</html>
