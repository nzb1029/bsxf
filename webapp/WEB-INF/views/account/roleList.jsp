<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<title>帐号管理</title>
	<%@ include file="/WEB-INF/common/jqgrid.jsp" %>
	<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
	<script type="text/javascript" src="${ctx }/static/data/account/role.js"></script>
	
	<script>
	 
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#user-tab").addClass("active");
		});
	</script>
</head>

<body>
	<div id="table_center_header">
                  角色管理
       </div>
       <div id="table_center_info">
           <div id="table_center_info_header">本管理列表帮助你</div>
           <div id="table_center_info_text"> 
           <li>的新增，编辑，删除角色</li>
           <li>给角色分配用户</li>
           <li>分配菜单权限</li>
           </div>
       </div>
        <div id="table_center_search">
           <form class="form-search" action="#"  ">
            <span class="margin_right_10">角色名：<input type="text" name="filter_name"   class="input-medium"  value=""> </span>
            <span class="margin_right_30"><button type="submit" id="search_btn">搜索</button></span>
            <span class="margin_right_30"><button type="reset" id="search_btn">清空</button></span>
           </form>
        </div>
        <div id="table_center_search_header">
            <span id="table_center_search_header_name">
               	 角色管理列表
            </span>
            <button class="button_right" type="button"   onclick="distribMenu();"   id="remove" value="分配菜单权限">分配菜单权限</button>
            <button class="button_right"  type="button"   onclick="distribUser();"   id="remove" value="分配用户">分配用户</button>
            <button class="button_right" type="button"   onclick="batchDel();" id="remove">批量删除</button>
            <button class="button_right" type="button"   onclick="window.location=ctx+'/account/role/create/0';" id="add" >添加角色</button>
           </ul>
        </div>
        <div id="table_center_table_wrapper">
            <table id="table_center_table"></table>
			<div id="pjqgajax"></div>
        </div>
</body>
</html>
