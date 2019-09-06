<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@ include file="/WEB-INF/common/jqgrid.jsp" %>
<html>
<head>
	<title>帐号管理</title>
 	<%@ include file="/WEB-INF/common/dztree.jsp" %>
	<script>
var ggridId="contentTable";
var api = frameElement.api, W = api.opener;
$(function(){
	  
	  
	 reloadTree();
	  
});
function reloadTree(s){
  //  alert($(s).val());
    if(s){
      $("#roleId").val($(s).val());
    }
      var roleId=$("#roleId").val();
      if(roleId=='')return ;
	  var setting = {
				async: {
					enable: true,
					url: ctx+"/account/role/menuTree/"+roleId,
					otherParam: {"disabledTree":"1"}
				},
				check: {
					enable: true
				},
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "parentId"
					}
				},
				view: {
					expandSpeed: ""
				},
				callback: {
					 
				}
			};
			
		  $.fn.zTree.init($("#menuTree"), setting);	
		
}
	</script>
</head>

<body style="padding-left: 20px;">

	<fieldset>
      <legend><small>当前用户：${user.name }</small></legend>
      </fieldset>
      <input type="hidden" name="roleId" id="roleId" value="${roleIds}"/>
      <table cellpadding="5"><tr><td valign="top">
       <fieldset class="rand" style="width: 220px;height: 400px;" >  <legend   > 角色列表 </legend>
           <select multiple="multiple" onchange="reloadTree(this);">
           <c:forEach items="${roles}" var="item">
           <option value="${item.id }">${item.roleName }</option>
           </c:forEach>
           </select>
       </fieldset>
       </td>
       <td >
       <fieldset class="rand" style="width: 240px;height: 400px;" >  <legend> 菜单权限 </legend>  
       <ul id="menuTree" class="ztree" style="border: 0px;"></ul>
       </td>
       </tr></table>
       

</body>
</html>
