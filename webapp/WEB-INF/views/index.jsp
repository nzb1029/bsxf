<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="org.bsxf.utils.EhcacheManager"%>
<%@page import="org.apache.shiro.session.mgt.eis.SessionDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.bsxf.utils.DateUtil"%>
<%@page import="org.bsxf.common.service.AccountManager"%>
<%@page import="java.util.List"%>
<%@page import="org.bsxf.common.entity.account.Menu"%>
<%@page import="org.bsxf.common.entity.akl.Block"%>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
<%@page import="org.bsxf.utils.EhcacheManager;"%>
<%@page import="org.bsxf.web.LtSecurityUtils"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.shiro.session.mgt.eis.SessionDAO"%>
<%@page import="org.springside.web.SpringContextHolder"%>
<html>
<head>
<title><%=EhcacheManager.getStationConfig().getName() %></title>
</head>
<body>
<div id="adminheader">
    <div id="logo">
        <div style="width:60px;height:30px;margin-left:14px;float:left;"><img
               src="${ctx }/static-content?contentPath=logo.png&tt=<%=new Date().getTime() %>"> </div>
    </div>

<div id="logout">
  <a title="退出"  href="${ctx}/logout">  退出</a>
</div>
    <div id="header_delimiter">|</div>
    <div id="user_name">
       <%=LtSecurityUtils.getShiroUser().getName() %> 
    </div>
</div>
   <%
	AccountManager aManager = SpringContextHolder.getBean("accountManager");
			 List<Menu> menuList  =   aManager.getUserMenu();
			 request.setAttribute("menuList",menuList);
%>
 <!-- 树形菜单 -->
<div id="table_view" class="easyui-layout" style="overflow: visible;">
	<div id="table_view_left" data-options="region:'west',title:'导航',split:true">
		<div class="easyui-accordion">
			<c:forEach var="item" items="${menuList}">
			<c:choose>
				 <c:when test="${item.menuName =='设备管理'}">
				  <c:set var="will" scope="page" value="icon-reload"/>
				 </c:when>
				 <c:when test="${item.menuName=='用户权限管理'}">
				 <c:set var="will" scope="page" value="icon-sum"/>
				 </c:when>
				 <c:when test="${item.menuName=='系统管理'}">
				 <c:set var="will" scope="page" value="icon-search"/>
				 </c:when>
				 <c:otherwise>
				  <c:set var="will" scope="page" value="icon-reload"/>
			   </c:otherwise>
			  </c:choose>
			   <div title="${item.menuName}" data-options="iconCls:'${will}',selected:true">
					<c:forEach var="node" items="${item.menuList}">
				     <li value="${node.menuName}"><a  href="#" onclick="addMenuPanel('${node.link}','${node.menuName}')">${node.menuName}</a><li>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- 中间内容页面 -->
	<div style="width: 100%" id="table_main_2" data-options="region:'center'">
			<iframe id="mainIframe" style="width:100%; height: 780px;" frameborder="0" name="mainIframe" ></iframe>
	</div>
</div>
  </body>
	<script type="text/javascript">
	    ////////////定时取用户消息，站内信
    	// function addMenuPanel(url,name){
        //     var currTab = $('#tab-box').tabs('getSelected');
   		//	 $('#tab-box').tabs('update',{
   		//		tab:currTab,
   		//		options:{
   		//			content:createFrame(url)
   		//		}
   		//	})
 	       
 		// }
	    //function createFrame(url) {
	    //	var s = '<iframe style=" width: 100%;height:2000px; padding: 0;margin: 0; margin-left: 0px;float: left;overflow-x: hidden;" src="${ctx}'+url+'" ></iframe>' ;
		//    	return s;
	   // }
		$(document).ready(function() {
			var userType = '<%=LtSecurityUtils.getShiroUser().getUserType()%>';
			if(userType!= null && userType == '1'){
				$('#mainIframe').attr('src','${ctx}/equipment/userList');
			}else{
				$('#mainIframe').attr('src','${ctx}/equipment/list');
			}
		});
		
		function addMenuPanel(url,name){
			$('#mainIframe').attr('src','${ctx}'+url);
		}
	 /*   function changeBlock(){
	    	var blockId = $("#block").val();
	    	 $.ajax({
			        url:"${ctx}/account/user/changeBlock/"+blockId,
			        dataType:"JSON",
			        method:"get",
			        cache:false,
			        success:function(d){
			        	window.location.reload();
			        }
			     });
	    }*/
	    /*
		 window.setInterval(function(){
		     $.ajax({
		        url:"${ctx}/account/user/getMsg",
		        dataType:"JSON",
		        method:"get",
		        cache:false,
		        success:function(d){
		        if(d.length>0)
		        $("#znxcount").html("("+d.length+")");
		        else  $("#znxcount").html("");
		        for(var i=0;i<d.length;i++)
		       {    var title="内部消息";
		        	var content="<a  onclick=\"closeDia('"+i+"');addMenuPanel('/sys/letter/mylist','我的信息')\" href='#'>"+d[i].title+"</a>";
			        showMsg(i,title,content);
				}
		        }
		     });
		 
		 } , 10000);

		 function openWindow(id){
			var url = ctx+"/sys/letter/readf?id="+id;
			 $.dialog({
		          id: 'LHG1976D1',
		          content: "url:"+url,
		          lock:true,
		          title: cn+'',
		          height:300,
		          width:400,
		          init:function(){ 
		          },
			       cancel: true
		      });

		 }*/
	
	 function showMsg(i,title,content){
	      $.dialog.notice({
				    id: 'msg_'+i,
				    title: title,
				    content: content,
				    width: 200,
				    height: 100
				});
	 }
		function closeDia(id){
		var list = $.dialog.list;
		for( var i in list ){ 
		   if(list[i].config.id==('msg_'+id))
		     list[i].close();
		}
	} 
  </script></html>