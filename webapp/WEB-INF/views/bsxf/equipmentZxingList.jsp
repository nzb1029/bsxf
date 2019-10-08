<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>帐号管理</title>
		<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
		<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
		<script type="text/javascript" src="${ctx }/static/data/bsxf/equipmentZxing.js"></script>
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
                       二维码打印
       </div>
       <div id="table_center_info">
           <div id="table_center_info_header">本页面帮助你配置</div>
           <div id="table_center_info_text">
          	 打印灭火器二维码，可选的打印方式：单个灭火器打印，批量打印，打印所有二维码
          	 点击打印按钮会下载PDF文件到本地 
           </div>
       </div>
        <div id="table_center_search">
           <form class="form-search" action="#"  ">
            <span class="margin_right_10">编号：<input type="text" name="filter_eno"   class="input-medium"  value=""> </span>
            <span class="margin_right_10">区域：<input type="text" name="filter_area"   class="input-medium"  value=""> </span> <br><br>
            <span class="margin_right_30">巡检负责人：<input type="text" name="filter_userName"   class="input-medium"  value=""></span>
            <span class="margin_right_30"><button type="submit" id="search_btn">搜索</button></span>
            <span class="margin_right_30"><button type="reset" id="search_btn">清空</button></span>
           </form>
        </div>
        <div id="table_center_search_header">
            <span id="table_center_search_header_name">
                                   二维码打印列表
            </span>
            <button class="button_right" type="button" onclick="javascript:printAll()" id="printAll">打印全部</button>
            <button class="button_right" type="button" onclick="javascript:batchPrint()" id="batchPrint" >批量打印</button>
        </div>
        <div id="table_center_table_wrapper">
            <table id="table_center_table"></table>
			<div id="pjqgajax"></div>
        </div>
	</body>
</html>