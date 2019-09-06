<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%@ include file="/common/taglibs.jsp" %>
	<%@ include file="/common/meta.jsp" %>
	<%@ include file="/WEB-INF/common/jqgrid.jsp" %>
	<style>
html, body {
	margin: 0;			/* Remove body margin/padding */
	padding: 0;
	overflow: hidden;	/* Remove scroll bars on browser window */	
    font-size: 75%;
}
/*Splitter style */


#LeftPane {
	/* optional, initial splitbar position */
	overflow: auto;
}
/*
 * Right-side element of the splitter.
*/

#RightPane {
	padding: 2px;
	overflow: auto;
}
.ui-tabs-nav li {position: relative;}
.ui-tabs-selected a span {padding-right: 10px;}
.ui-tabs-close {display: none;position: absolute;top: 3px;right: 0px;z-index: 800;width: 16px;height: 14px;font-size: 10px; font-style: normal;cursor: pointer;}
.ui-tabs-selected .ui-tabs-close {display: block;}
.ui-layout-west .ui-jqgrid tr.jqgrow td { border-bottom: 0px none;}
.ui-datepicker {z-index:1200;}
.rotate
    {
        /* for Safari */
        -webkit-transform: rotate(-90deg);

        /* for Firefox */
        -moz-transform: rotate(-90deg);

        /* for Internet Explorer */
        filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
    }

</style>
	 <script type="text/javascript">
$(document).ready(function() {
	 // alert( jQuery("#list2"));
	      jQuery("#list2").jqGrid({ 
	      						url:ctx+'/account/user!jqgridjson.action', 
	      						datatype: "json", 
	      						colNames:['ID', 'loginName', 'name'],
	      						colModel:[ 
	      						  {name:'id',index:'id', width:55},
	      						  {name:'loginName',index:'loginName', width:90,editable:true}, 
	      						  {name:'name',index:'name asc, invdate', width:100,editable:true},
	      						  ], 
	      						    rowNum:10,
	      						    rowList:[10,20,30], 
	      						    pager: '#pjqgajax',
	      						  //  sortname: 'id', 
	      						    viewrecords: true, 
	      						  //  sortorder: "desc", 
	      						    caption:"JSON Example" ,
	      						    jsonReader:{
					                   repeatitems : false
					                },
					                width:500,
					                cellEdit: true,
					                multiselect: true,
					                postData:{aaa:"ssss"},
	      						    });
	  jQuery("#list2").jqGrid('navGrid','#pjqgajax',{edit:false,add:false,del:false,search:false,refresh:true});
	  jQuery("#list2").jqGrid('inlineNav',"#pjqgajax");
	  
	 });
	 
	 function ss(){
	   var  s = jQuery("#list2").jqGrid('getGridParam','selarrrow');
	   alert(s);//id
	   var  ret = jQuery("#list2").jqGrid('getRowData',"1");
	    alert(ret.id);
	   jQuery("#list2").jqGrid('setRowData',ret.id,{name:"<font color='red'>我的名字被改了!</font>"})
	   //影藏列
	   jQuery("#list2").jqGrid('navGrid','hideCol',"tax");
	   jQuery("#list2").jqGrid('navGrid','showCol',"tax");
	   //得到所有ID
	   var ids = jQuery("#list2").jqGrid('getDataIDs');
	   //添加列
	   jQuery("#list2").jqGrid('addRowData',"111",{id:"111","loginName":"新加的列",name:"asdad"});
	   jQuery("#list2").trigger("reloadGrid")
	   var su=jQuery("#list5").jqGrid('delRowData',12);
	   jQuery("#list2").jqGrid('setPostData',{q:1,param1:"p1"});
	   jQuery("#bigset").jqGrid('setGridParam',{url:"bigset.php?nm_mask="+nm_mask+"&cd_mask="+cd_mask,page:1}).trigger("reloadGrid");
	 }
	 </script>
  </head>
  
  <body>
  <table id="list2"></table> <div id="pjqgajax"></div>
  <input type="button" value="选中的" onclick="ss()">
  </body>
</html>
