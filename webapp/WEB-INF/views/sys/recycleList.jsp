<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
<%@ include file="/WEB-INF/common/lhgdialog.jsp"%>
<%@ include file="/WEB-INF/common/calendar.jsp" %>
<html>
	<head>
		<title>  </title>
     <script type="text/javascript" src="${ctx }/static/data/sys/recycle.js"></script>
     <script>
		jQuery(document).ready(function() {
		
		
		});
	</script>
	</head>

	<body>
	 
      <div class="mtoolBar">
		<ul>
		<li  >
			<span class="out1">
			<img src="${ctx}/static/img/toolbar/16x16/icon_add.png"></span>
			  <input onclick="update();"  type="button" class="buttonRight"   id="create" value="立即入库"  >
			 
			
		</li>
		 
		 </ul>
	</div>
	
			<div  style="margin-top: 5px;">
		<div class="row"  >
		<div class="offset4" style="margin-left: 30px;">
			<form class="form-search" action="#">
			 	<div  class="" >
			 	<table cellpadding="3">
			 	<tr>
			 	<td align="right">表名：</td><td><input type="text" name="filter_tablec"   class="input-medium"  value=""> </td>
			 	<td align="right">表中文名：</td><td><input type="text" name="filter_tableName"   class="input-medium"  value=""> </td>
			 	<td align="right">列名：</td><td><input type="text" name="filter_colName"   class="input-medium"  value=""> </td>
			 
			 	</tr>
			 	<tr>
			 	<td align="right">删除人：</td><td><input type="text" name="filter_createUser"   class="input-medium"  value=""> </td>
			 	<td align="right">列值：</td><td><input type="text" name="filter_col"   class="input-medium"  value=""> </td>
			 	
			 	 
			 	<td align="right">删除时间：</td><td colspan="3" >
			 	<input type="text" name="filter_createTime" onclick="new WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  class="input-medium"  value="">-<input type="text" name="filter_createTime1" onclick="new WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  class="input-medium"  value=""> 
			 	
			    <button type="submit" class="btn" id="search_btn">查询</button> 
			     <button type="reset" class="btn" id="search_btn">清空</button> </td>
			     </tr>
			 	</table>
			   </div>
			    
		    </form>
	    </div>
	</div>	 
 </div>
		
		 
		<table id="contentTable"></table>
		<div id="pjqgajax"></div>
		
	</body>
</html>
