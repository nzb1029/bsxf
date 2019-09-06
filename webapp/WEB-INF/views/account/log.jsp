<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>帐号管理</title>
		<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
		<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
		<script type="text/javascript" src="${ctx }/static/data/account/log.js"></script>
		<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#user-tab").addClass("active");
		});
		function afterImport(){
		   alert("导入成功");
		   jQGridSupport.reloadGrid(ggridId);
		}
	</script>
	</head>
	<body style="padding: 0;margin: 0;">
	 
	  
		 
		 
	<div style="margin-top: 5px;">
	<div class="row" style="" >
		<div class="offset3" style="margin-left: 30px; ">
			<form class="form-search" action="#"  ">
			 	<div  style="padding: 5px;">
			 	<label>操作人：</label> <input type="text" name="filter_loginName"   class="input-medium"  value=""> 
			    <label>内容：</label> <input type="text" name="filter_log_des" class="input-medium" value="">
			     <button type="submit" class="btn" id="search_btn">查询</button> 
			      <button type="reset" class="btn" id="search_btn">清空</button> 
			   </div>
			    
		    </form>
	    </div>
	</div>	 
	</div>
		 
		<table id="contentTable"></table>
		<div id="pjqgajax"></div>
		

	
	</body>
</html>
