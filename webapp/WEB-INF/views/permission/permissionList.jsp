<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
<%@ include file="/WEB-INF/common/dztree.jsp" %>
	<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
<html>
	<head>
		<title>  </title>
     <script type="text/javascript" src="${ctx }/static/data/account/permission.js"></script>
     <script>
		jQuery(document).ready(function() {
		
		
		});
		function afterSave(){
			jQGridSupport.reloadGrid(ggridId,{});
		}
		
	</script>
	</head>

	<body>
	<div id="table_center_header">
                  权限管理
       </div>
       <div id="table_center_info">
           <div id="table_center_info_header">本管理列表帮助你</div>
           <div id="table_center_info_text"> 增加、删除、修改、查询权限
           </div>
       </div>
	<div style="float: left;"> <ul id="permissionTree" class="ztree"></ul></div>		
	<div style="margin-left: 250px;">
	<table style="width: 100%;">
	<tr><td>
	<div class="row"  >
		 <div id="table_center_search">
           <form class="form-search" action="#">
            <span class="margin_right_10">权限名：<input type="text" name="filter_name"   class="input-medium"  value=""> </span>
            <span class="margin_right_10">权限值：<input type="text" name="filter_val"   class="input-medium"  value=""> </span>
            <span class="margin_right_30"><button type="reset" id="search_btn">清空</button></span>
            <span class="margin_right_30"><button type="submit" id="search_btn">搜索</button></span>
           </form>
        </div>
        <div id="table_center_search_header">
            <span id="table_center_search_header_name">
               &nbsp;&nbsp; 权限列表
            </span>
            <button class="button_right" type="button" onclick="javascript:batchDel()" id="remove">批量删除</button>
            <button class="button_right" type="button"  id="createBtn">添加权限</button>
           </ul>
        </div>
	</div>	 
	</td></tr>
	<tr><td>
        <div id="table_center_table_wrapper">
            <table id="table_center_table"></table>
			<div id="pjqgajax"></div>
        </div>
	</td></tr></table>
 
</div>
	
	 	
	</body>
</html>
