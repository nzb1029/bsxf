<%@ page contentType="text/html;charset=UTF-8" %>
 
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/lhgdialog.jsp" %>
<%@ include file="/WEB-INF/common/calendar.jsp" %>
<%@ include file="/WEB-INF/common/jqgrid.jsp" %>
<html>

<head>
<style type="text/css">
	        .title{
	            font-size:16px;
	            font-weight:bold;
	            padding:20px 10px;
	            background:#eee;
	            overflow:hidden;
	            border-bottom:1px solid #ccc;
	        }
	        .t-list{
	            padding:5px;
	        }
	        .panel-header {
	          margin-top: 5px;
	        }
	        .portal-column-td{
	         vertical-align: top;
	         padding-right: 10px;
	         padding-left: 10px;
	        }
	        .panel-header{
	            background:white;
	            color:white;
	            background-color: #336699;
	        }
	        .panel-title{
	        color:white;
	        }
	        .panel-tool a{
	        opacity:1;
	        }
	    </style>
<script>
var widgets=${widgets};
	$(function(){
			$('#pp').portal('resize');
			//初始化大框架后，添加portal元素
			//add();
			//addII();
			
			     $("#addWidget").click(function(){
			          $.dialog({
				          id: 'LHG1976D1',
				          content: 'url:'+ctx+"/widget/addWidget",
				          lock:true,
				          title: '添加部件',
				          height:300,
				          width:600,
				          ok: function(){return this.content.okFunc();},
				          init:function(){//this.max();alert(123);
				            //this.max();
				          },
					      cancel: true//,
					    //  button:[{name:"打印",callback:function(){ this.iframe.contentWindow.printpreview();return false;}}]
				      }); 
			     
			     });
			if("${hasdel}"=="1")
			  {
			     $("#addWidget").show();
			   }
			
	 });
	 function closeWidget(id){
	  jQuery.ajax({
					url:ctx+"/widget/deleteUserWidget/1",
					dataType: 'json',
					type:"POST",
					data:{id:id},
					success:function(d){  
						  $("#addWidget").show();
					}
					
					
				}).fail(function() { alert("error " ); }); 
	 
	 
	 }
  var wnum=0;
  var Widget = function(obj,n){
 // alert($.toJSON(obj));
          if(!obj.col){
            obj.col=wnum;
            wnum=wnum+1;
            if(wnum>1)wnum=0;
          }
	      var id=obj.id;
	      var p = $("<div id='"+obj.id+"' style='padding:3px;'/>").appendTo('body');
	      var option={'title':obj.name,'iconCls':null,'width':'auto','height':'auto','left':null,'top':null,'cls':null,'headerCls':null,'bodyCls':null,'style':{},'href':null,'cache':true,'fit':false,'border':true,'doSize':true,'noheader':false
			,'content':"<img src=\"${ctx}/static/img/loading/006.gif\"/>",'collapsible':true,'minimizable':false,'maximizable':true,'closable':true,'collapsed':false,'minimized':false,'maximized':false,'closed':false,'tools':{'remove':function (o) {
					    var _37f = this.indexOf(o);
					    if (_37f != -1) {
					        this.splice(_37f, 1);
					    }
					    return this;
					}},'loadingMessage':'Loading...','onLoad':function () {

					},'onBeforeOpen':function () {
					},'onOpen':function () {
					},'onBeforeClose':function () {
					},'onClose':function (a) {
					        
					     closeWidget(id);
							 
					},'onBeforeDestroy':function () {
					},'onDestroy':function () {
					},'onResize':function (_1a4, _1a5) {
					},'onMove':function (left, top) { 
					  
					},'onMaximize':function () {
					},'onRestore':function () {   
					},'onMinimize':function () {
					},'onBeforeCollapse':function () {
					},'onBeforeExpand':function () {
					},'onCollapse':function () {
					},'onExpand':function () {
					}  };
			p.panel(option);
			$('#pp').portal('add', {
								panel:p,
								columnIndex:obj.col
							});
			$('#pp').portal('resize');
			 
			p.load("${ctx}/"+obj.url+"?&t="+new Date().getTime());
  
  }	 
  function afterSave(){
     window.location.reload();
  }
	function addWidget(){
	  for(var i=0;i<widgets.length;i++){
	     new Widget(widgets[i],i);
	  }
	
	
	}	
		function add(){
			//读取布局字符串，循环添加portal对象
			// $("#"+notice).find(".content").load("${ctx}/widget/"+notice);
			var p=$("#fffffffff");
			var option={'title':'通知','iconCls':null,'width':'auto','height':'auto','left':null,'top':null,'cls':null,'headerCls':null,'bodyCls':null,'style':{},'href':null,'cache':true,'fit':false,'border':true,'doSize':true,'noheader':false
			,'content':"<img src='${ctx}/static/img/loading/006.gif'/>",'collapsible':true,'minimizable':false,'maximizable':false,'closable':true,'collapsed':false,'minimized':false,'maximized':false,'closed':false,'tools':{'remove':function (o) {
					    var _37f = this.indexOf(o);
					    if (_37f != -1) {
					        this.splice(_37f, 1);
					    }
					    return this;
					}},'loadingMessage':'Loading...','onLoad':function () {
				 
					    $("#fffffffff").load("${ctx}/widget/"+notice);
					},'onBeforeOpen':function () {
					},'onOpen':function () {
					},'onBeforeClose':function () {
					},'onClose':function () {
					},'onBeforeDestroy':function () {
					},'onDestroy':function () {
					},'onResize':function (_1a4, _1a5) {
					},'onMove':function (left, top) {
					},'onMaximize':function () {
					},'onRestore':function () {
					},'onMinimize':function () {
					},'onBeforeCollapse':function () {
					},'onBeforeExpand':function () {
					},'onCollapse':function () {
					},'onExpand':function () {
					}};
			option["onClose"] = getLayout;
			p.panel(option);
			$('#pp').portal('add', {
								panel:p,
								columnIndex:0
							});
			$('#pp').portal('resize');
			$("#fffffffff").load("${ctx}/widget/notice");
		}
		function addII(){
			//读取布局字符串，循环添加portal对象
			var p=$("#fffffffffd");
			var option={'title':'Title0','iconCls':null,'width':'auto','height':'auto','left':null,'top':null,'cls':null,'headerCls':null,'bodyCls':null,'style':{},'href':null,'cache':true,'fit':false,'border':true,'doSize':true,'noheader':false,
			'content':"<img src='${ctx}/static/img/loading/006.gif'/>",'collapsible':true,'minimizable':false,'maximizable':false,'closable':true,'collapsed':false,'minimized':false,'maximized':false,'closed':false,'tools':{'remove':function (o) {
					    var _37f = this.indexOf(o);
					    if (_37f != -1) {
					        this.splice(_37f, 1);
					    }
					    return this;
					}},'loadingMessage':'Loading...','onLoad':function () {
					},'onBeforeOpen':function () {
					},'onOpen':function () {
					},'onBeforeClose':function () {
					},'onClose':function () {
					},'onBeforeDestroy':function () {
					},'onDestroy':function () {
					},'onResize':function (_1a4, _1a5) {
					},'onMove':function (left, top) {
					},'onMaximize':function () {
					},'onRestore':function () {
					},'onMinimize':function () {
					},'onBeforeCollapse':function () {
					},'onBeforeExpand':function () {
					},'onCollapse':function () {
					},'onExpand':function () {
					}};
			option["onClose"] = getLayout;
			p.panel(option);
			$('#pp').portal('add', {
								panel:p,
								columnIndex:0
							});
		 $('#pp').portal('resize');
		 var iframe="<iframe src='http://www.thinkpage.cn/weather/weather.aspx?uid=&cid=101190101&l=zh-CHS&p=CMA&a=0&u=C&s=1&m=1&x=1&d=0&fc=&bgc=&bc=&ti=1&in=1&li=2&ct=iframe' frameborder='0' scrolling='no' width='250' height='260' allowTransparency='true'></iframe>";
         var nd= $("<div id=\"weather\" class=\"bs-docs-example weather\" > <div id=\"calendar_content\" class=\"content\">"
        		+iframe+" </div> </div>");
        $("#fffffffffd").empty();
        nd.appendTo($("#fffffffffd"));	
		}
		function remove(){
			$('#pp').portal('remove',$('#pgrid'));
			$('#pp').portal('resize');
		}
		//获取布局
		function getLayout(){
			//$(this).panel("destroy");
			//获取布局。返回的是一个json类型的字符串。可以通过eval转换成json对象.也可以把此字符串存入数据库
			var portalLayot =  $('#pp').portal("getLayout");
			//alert(portalLayot);
			//alert(eval("("+portalLayot+")"));
		}
		//根据title获取不同的portal
		function getPanelForTitle(){
			//alert($('#pp').portal("getPanelForTitle","Clock").panel("options").title);
			$('#pp').portal("getPanelForTitle","Title2").panel("open");
		}
	</script>
</head>
 
<body   style="width: 99%;" >
<div id="addWidget" style=" top: 10px; right: 30px;cursor: pointer;display: none;position: absolute;z-index:999;"><a>添加部件</a></div>
	<div region="north" class="title" border="false" style="height:60px;display: none;">
		jQuery EasyUI Portal<input type="button" value="getLayout" onclick="getLayout()">
		<input type="button" value="getPanelForTitle" onclick="getPanelForTitle()">
	</div>
	<div region="center" border="false">
		<div id="pp" style="position:relative;margin-top: 10px;">
			<div style="width:50%;">
				
			</div>
			<div style="width:50%;">
				
			</div>
			 
		</div>
	</div>
  

        
 <script type="text/javascript">
 $('#pp').portal({
				border:false,
				fit:true,
				onStopDrag:function(){
				  
				var tmap=[];
				$("#pp").find("td.portal-column-td").each(function(n,e){
				  $(e).find("div.panel-body").each(function(nn,ee){
				       var wid=$(ee).attr("id");
				       tmap.push({id:wid,col:n,row:nn});
				    
				   });
				});
		 
				//保存位置信息
				 
				 jQuery.ajax({
						url:ctx+"/widget/savePos",
						dataType: 'json',
						type:"POST",
						data:{dstr:$.toJSON(tmap)},
						success:function(d){  
							 // $("#addWidget").show();
						}
						
						
					}).fail(function() { alert("error " ); }); 	
				
				 
				}
			});
			addWidget();
 </script>       
        
        
</body>
</html>