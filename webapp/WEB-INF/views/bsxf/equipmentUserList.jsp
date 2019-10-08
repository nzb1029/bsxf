<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>帐号管理</title>
		<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
		<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
		<script type="text/javascript" src="${ctx }/static/data/bsxf/equipmentUser.js"></script>
		<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#user-tab").addClass("active");
		});
		function afterImport(){
		   alert("导入成功");
		   jQGridSupport.reloadGrid(ggridId);
		}
		function afterSave(){
			 jQGridSupport.reloadGrid(ggridId);
		}
	</script>
	</head>
	<body>
       <div id="table_center_header">
                     灭火器查询
       </div>
       <div id="table_center_info">
           <div id="table_center_info_header">本菜单帮助你</div>
           <div id="table_center_info_text">
                                   查询归属自己负责的灭火器列表
         </div>
       </div>
        <div id="table_center_search">
           <form class="form-search" action="#"  ">
            <span class="margin_right_10">编号：<input type="text" name="filter_eno"   class="input-medium"  value=""> </span>
            <span class="margin_right_10">区域：<input type="text" name="filter_area"   class="input-medium"  value=""> </span> 
            <span class="margin_right_30"><button type="reset" id="search_btn">清空</button></span>
            <span class="margin_right_30"><button type="submit" id="search_btn">搜索</button></span>
           </form>
        </div>
        <div id="table_center_table_wrapper">
            <table id="table_center_table"></table>
			<div id="pjqgajax"></div>
        </div>
	</body>
</html>
