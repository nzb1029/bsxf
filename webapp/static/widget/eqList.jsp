<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>区域设备总览</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 

  </head>
  
  <body>
  <div style="padding: 5px;">
        <table id="eqContentTable"></table>
		<div id="eqPjqgajax"></div>
 </div>
 <script type="text/javascript">
 var eqGgridId="eqContentTable";
 
	 jQuery("#"+eqGgridId).jqGrid({ 
			url:ctx+'/equipment/jqgrid', 
			datatype: "json", 
			colModel:[ 
			  {name:'name',index:'name',  editable:false,label:'设备',formatter:function(a,b,c){
			     return "<a href=javascript:detail('"+c.id+"')  >"+c.name+"</a>";
			  
			  } },
		      {name:'eno',index:'eno',  editable:false,label:'设备编号'},
		      {name:'category.name',index:'category.name',  editable:false,label:'设备分类' },
		      {name:'createTime',index:'createTime',  editable:false,label:'添加时间' ,formatter:function(a,b,rd){
		        return new Date(rd.createTime).format("yyyy-MM-dd hh:mm:ss");
		      } }
			  ], 
			    rowNum:10,
			   // multiselect: true,
			    rownumbers:false,
			    rowList:[10,20,30], 
			    pager: '#pjqgajax',
			    viewrecords: true, 
			    caption:"" ,
			    jsonReader:{
                   repeatitems : false
              },
             autowidth:true,
             // width:'98%',
              height:'100%',
              cellEdit: true,
              postData:{aaa:"ssss"}
	  });
	  jQuery("#"+eqGgridId).jqGrid('inlineNav',"#eqPjqgajax");
	  
	  function detail(id){
	   $.dialog({
	          id: 'LHG1976D122',
	          content: "url:"+ctx +"/ws/cat/detail?id="+id,
	          lock:true,
	          title: '设备详情',
	          height:500,
	          width:850,
	          ok:false,
	          init:function(){ 
	          },
		       cancel: true
	      });
	  }
 </script>
  </body>
</html>
