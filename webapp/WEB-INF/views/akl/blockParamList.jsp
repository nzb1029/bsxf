<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>帐号管理</title>
		<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
		<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
		<script type="text/javascript" src="${ctx }/static/data/akl/blockParam.js"></script>
	</script>
	</head>
	<body>
	  <div id="table_center_header">
                  种植方案管理
       </div>
       <div id="table_center_info">
           <div id="table_center_info_header">本管理列表帮助你配置</div>
           <div id="table_center_info_text">每个地块的具体种植方案，包括气象数据配置、土壤数据配置、种子数据配置</div>
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
               	 种植方案管理列表
            </span>
            <button class="button_right" type="button" onclick="javascript:batchDel()" id="remove">批量删除</button>
            <button class="button_right" type="button" onclick="javascript:update()" id="add" >添加种植方案</button>
        </div>
        <div id="table_center_table_wrapper">
            <table id="table_center_table"></table>
			<div id="pjqgajax"></div>
        </div>
	</body>
</html>
