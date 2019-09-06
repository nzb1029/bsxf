<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
<html>
	<head>
		<script type="text/javascript" src="${ctx }/static/data/akl/income.js"></script>
	</script>
	</head>
	<body>
		
	<div id="table_center_header">
	                  收益数据管理
	       </div>
	       <div id="table_center_info">
	           <div id="table_center_info_header">本管理列表帮助你配置</div>
	           <div id="table_center_info_text">每个地块的种植产量数据和收益数据，包括传统方案和爱科农方案两组数据</div>
	       </div>
	        <div id="table_center_search">
	           <form class="form-search" action="#"  ">
	            <span class="margin_right_10">地块名称：<input type="text" name="filter_blockName"   class="input-medium"  value=""> </span>
	            <span class="margin_right_30"><button type="reset" id="search_btn">清空</button></span>
	            <span class="margin_right_30"><button type="submit" id="search_btn">搜索</button></span>
	           </form>
	        </div>
	        <div id="table_center_search_header">
	            <span id="table_center_search_header_name">
	               	 收益数据管理列表
	            </span>
	            <button class="button_right" type="button" onclick="javascript:batchDel()" id="remove">批量删除</button>
	            <button class="button_right" type="button" onclick="javascript:update()" id="add" >添加收益数据</button>
	        </div>
	        <div id="table_center_table_wrapper">
	            <table id="table_center_table"></table>
				<div id="pjqgajax"></div>
	        </div>
	
	</body>
</html>
