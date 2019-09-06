<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>帐号管理</title>
		<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
		<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
		<script type="text/javascript" src="${ctx }/static/data/akl/blockTrack.js"></script>
	</script>
	</head>
<body>
		
  <div id="table_center_header">
           实时数据监控配置
       </div>
       <div id="table_center_info">
           <div id="table_center_info_header">本管理列表帮助你配置地块监控数据</div>
           <div id="table_center_info_text">包括病虫害及其防止、收获时间以及周工作建议</div>
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
               地块实时监控数据列表
            </span>
            <button class="button_right" type="button" onclick="javascript:batchDel()" id="remove">批量删除</button>
            <button class="button_right" type="button" onclick="javascript:update()" id="add" >添加实时监控数据</button>
        </div>
        <div id="table_center_table_wrapper">
            <table id="table_center_table"></table>
			<div id="pjqgajax"></div>
        </div>
	
	</body>
</html>
