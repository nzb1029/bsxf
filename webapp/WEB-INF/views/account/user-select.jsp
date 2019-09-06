<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/common/jqgrid.jsp"%>
<%@ include file="/WEB-INF/common/lhgdialog.jsp"%>
<html>
	<head>
		<title>  </title>
     <script type="text/javascript" src="${ctx }/static/data/account/user-select.js"></script>
     <script>
		jQuery(document).ready(function() {
		
		
		});
		
		function okFunc(){
		  var valc= $("input[name='singselect']:checked");
		  var val=valc.val(); 
		  var name=valc.attr("qname");
		  //  var eno=valc.attr("eno");
		  if(!val){
		    alert("请至少选择一个用户 ");
		  }else {
		      W.afterSel(val,name);
		      api.close();
		  }
		return false;
		}
	</script>
	</head>

	<body>
	 
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
			 	<label>登录名：</label> <input type="text" name="filter_loginName"   class="input-medium"  value=""> 
			 	<label>用户名：</label> <input type="text" name="filter_name"   class="input-medium"  value=""> 
			 	<input type="hidden" name="filter_userType"   class="input-medium"  value="1"> 
			 	 <button type="submit" class="btn" id="search_btn">查询</button> 
			     <button type="reset" class="btn" id="search_btn">清空</button> 
			   </div>
			    
		    </form>
	    </div>
	</div>	 
 </div>
		
		 
		<table id="contentTable"></table>
		<div id="pjqgajax"></div>
		
	</body>
</html>