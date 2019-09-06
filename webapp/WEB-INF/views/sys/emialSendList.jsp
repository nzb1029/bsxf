<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
<%@ include file="/WEB-INF/common/lhgdialog.jsp"%>
<html>
	<head>
		<title>  </title>
     <script type="text/javascript" src="${ctx }/static/data/sys/emialSend.js"></script>
     <script>
		jQuery(document).ready(function() {
		
		
		});
	</script>
	</head>

	<body>
	<div class="mtoolBar">
		<ul>
		 
		<li >
			<span class="out1">
			<img src="${ctx}/static/img/toolbar/16x16/icon_removes.png"></span>
			<input type="button"    onclick="batchDel();" class="buttonRight"   id="remove" value="批量删除">
			
		</li>
		<li >
			<span class="out1">
			<img src="${ctx}/static/img/toolbar/16x16/icon_export.png"></span>
			<input type="button"    onclick="exp();" class="buttonRight"   id="exportbtn" value="导出">
			
		</li>
	 
		 </ul>
	</div>
       <c:if test="${not empty message}">
			<div id="message" class="alert alert-success">
				<button data-dismiss="alert" class="close">
					×
				</button>
				<span id="message_div">${message}</span>
			</div>
		</c:if>
	
			<div  style="margin-top: 5px;">
		<div class="row"  >
		<div class="offset4" style="margin-left: 30px;">
			<form class="form-search" action="#">
			 	<div  class="" >
			 	<table cellpadding="3">
			 	<tr>
			 	<td align="right">接收者：</td><td><input type="text" name="filter_toemail"   class="input-medium"  value=""> </td>
			 	<td align="right">发送者：</td><td><input type="text" name="filter_username"   class="input-medium"  value=""> </td>
			 
			 	<td align="left" colspan="2">  <button type="submit" class="btn" id="search_btn">查询</button> 
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
