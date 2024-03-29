<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>帐号管理</title>
		<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
		<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
		<script type="text/javascript" src="${ctx }/static/data/bsxf/equipment.js"></script>
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
           灭火器管理
       </div>
       <div id="table_center_info">
           <div id="table_center_info_header">本管理列表帮助你配置</div>
           <div id="table_center_info_text">
                                新增、修改、删除、查询灭火器，批量导入、删除灭火器<br/>
                               批量导入灭火器，请先 <a href="./importExcelTemp.xlsx" style="color: red;" download target="_blank">点这儿下载模板</a>，按照格式填写完毕后，点击批量导入按钮 <br/>
         </div>
       </div>
        <div id="table_center_search">
           <form class="form-search" action="#"  ">
            <span class="margin_right_10">编号：<input type="text" name="filter_eno"   class="input-medium"  value=""> </span>
            <span class="margin_right_10">区域：<input type="text" name="filter_area"   class="input-medium"  value=""> </span> <br><br>
            <span class="margin_right_30">巡检负责人：<input type="text" name="filter_userName"  class="input-medium"  value=""></span>
            <span class="margin_right_30">是否巡检：
                <select name="filter_haveCheck" class="input-medium">
                    <option value="">请选择</option>
                    <option value="0">已巡检</option>
                    <option value="1">未巡检</option>
                </select>
            </span>
            <span class="margin_right_30"><button type="submit" id="search_btn">搜索</button></span>
            <span class="margin_right_30"><button type="reset" id="search_btn">清空</button></span>
           </form>
        </div>
        <div id="table_center_search_header">
            <span id="table_center_search_header_name">
                                   灭火器管理列表
            </span>
            <button class="button_right" type="button" onclick="javascript:exp()" id="exportbtn" >导出</button>
            <button class="button_right" type="button" onclick="javascript:batchImp()" id="imp" >批量导入</button>
            <input type="file" onchange="javascript:importEquipmentList(this)" id="importEquipmentList" style="display: none;"/>
            <button class="button_right" type="button" onclick="javascript:batchDel()" id="remove">批量删除</button>
            <button class="button_right" type="button" onclick="javascript:update()" id="add" >添加灭火器</button>
        </div>
        <div id="table_center_table_wrapper">
            <table id="table_center_table"></table>
			<div id="pjqgajax"></div>
        </div>
	</body>
</html>
