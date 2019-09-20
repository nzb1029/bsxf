<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>帐号管理</title>
		<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
		<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
		<%@include file="/WEB-INF/common/calendar.jsp" %>
		<script type="text/javascript" src="${ctx }/static/data/bsxf/checkHistory.js"></script>
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
                      巡检记录管理
       </div>
       <div id="table_center_info">
           <div id="table_center_info_header">本管理列表帮助你配置</div>
           <div id="table_center_info_text">查询巡检记录，管理员可以查询所有，巡检员只能查询自己的巡检记录</div>
       </div>
        <div id="table_center_search">
           <form class="form-search" action="#"  ">
             <span class="margin_right_10">灭火器编号：<input type="text" name="filter_eno"   class="input-medium"  value=""> </span>
             <span class="margin_right_10">设备状态：
                <select  name="filter_runStatus">
                    <option value="">请选择</option>
                    <c:forEach items="${dic['xf_status']}" var="item">
                        <option value="${item.val }">${item.name }</option>
                    </c:forEach>
                </select>
            </span>
            <br>
            <br>
             <span class="margin_right_30">巡检日期：
               <input type="text"  name="filter_startDate" onclick="new WdatePicker() "  dateFmt="yyyy-MM-dd"/>
				  至
			   <input type="text"  name="filter_endDate"   onclick="new WdatePicker() " dateFmt="yyyy-MM-dd"/>
			  </span>
             <span class="margin_right_30"><button type="reset" id="search_btn">清空</button></span>
             <span class="margin_right_30"><button type="submit" id="search_btn">搜索</button></span>
           </form>
        </div>
        <div id="table_center_search_header">
            <span id="table_center_search_header_name">
                                 巡检记录列表
            </span>
        </div>
        <div id="table_center_table_wrapper">
            <table id="table_center_table"></table>
			<div id="pjqgajax"></div>
        </div>
	</body>
</html>
