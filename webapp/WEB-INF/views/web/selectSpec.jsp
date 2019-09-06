<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/common/taglibs.jsp" %>
<html>
  <head>
  <title>选择文件</title>
  <style type="text/css">
  .spec_box {
    background: none repeat scroll 0 0 #FFFFFF;
    overflow: hidden;
}
 
ul {
    list-style: none outside none;
}
.spec_box li {
    border: 2px solid #FFFFFF;
    cursor: pointer;
    float: left;
    margin: 3px;
}
.spec_box span {
    background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #3366CC;
    color: #333333;
    display: block;
    padding: 3px;
}
.spec_box img {
    background: none repeat scroll 0 0 #FFFFFF;
    border: 1px solid #3366CC;
    color: #333333;
    display: block;
    padding: 1px;
}
  </style>
	<%@ include file="/WEB-INF/common/dztree.jsp" %>
	<script type="text/javascript">
	 $(document).ready(function() {
	  var setting = {
	        check: {
				enable: true,
				chkStyle: "radio",
				radioType: "level"
			},
			async: {
				enable: true,
				url: ctx+"/product/specification/treeJson"
			},
			
			data: {
				simpleData: {
					enable: true
				}
			},
			view: {
				expandSpeed: ""
			},
			callback: {
				  onCheck: function(event, treeId, treeNode){
				      var id=treeNode.id;
				      var  specName=treeNode.name;
				      $("#specName").html(specName);
				      $("#specRemark").html(treeNode.remark);
				      var viewType= treeNode.viewType;
				      $.ajax({
				         url:ctx+"/product/specification/loadSpecValue?specId="+id,
				         dataType: "json", 
				         success: function (data) {
				                 $(".spec_box").html("");
				         	    if(viewType=='0')//文字
				         	      { 
					         	       for(var i=0;i<data.length;i++){
					         	         $("<li>").html("<span>"+data[i].name+"</span>").appendTo($(".spec_box"));
					         	       }
				         	       }
				         	       else {
				         	        for(var i=0;i<data.length;i++){
				         	           $("<li>").html("<img style='height:30;width:30' src='"+staticPath+data[i].imgUrl+"'>").appendTo($(".spec_box"));
				         	       }
				         	       }
                                 //alert(data[0].name);
                                  }
				      });
				       
				  }
				//beforeExpand: beforeExpand,
				//onAsyncSuccess: onAsyncSuccess,
				//onAsyncError: onAsyncError
			}
		};
		
	  $.fn.zTree.init($("#menuTree"), setting);	
	});
		
		
	function getSelectSpec(){
		var zTree = $.fn.zTree.getZTreeObj("menuTree");
		nodes = zTree.getCheckedNodes();
		if(nodes.length==0){
		  alert("请至少选择一个规格");
		  return false;
		}
		return nodes;
		
    }
	</script>
  </head>
  
  <body>
  <table>
    <tr>
    <td  style="width:200px;vertical-align: top;border: 1px solid #C5DAEE;height: 400px;">
       请选中规格
       <ul id="menuTree" class="ztree"></ul>
   </td>
<td style="border: 1px solid #C5DAEE;vertical-align: top;width:300px">
  <div id="toobar">
     规格预览区
  </div>
  <div id="grid1_container"   >
   <p style="font-weight:bold; " id="specName"> </p>
   <p id="specRemark"> </p>
   <ul class="spec_box">
  
   <!--
   <li><img width="30" height="30" src="/akl/servUtils?cmd=resource&amp;fileName=1321952755057.png&amp;moduleName=spec/"></li>
   <li><img width="30" height="30" src="/akl/servUtils?cmd=resource&amp;fileName=spec_defalt.png&amp;moduleName=spec/default/"></li>
   <li><img width="30" height="30" src="/akl/servUtils?cmd=resource&amp;fileName=1322468248592.png&amp;moduleName=spec/"></li>
   --></ul>
  </div>

</td></tr>
</table>
  </body>
</html>
