<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<html>
<head>
	<title>帐号管理</title>
	
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#user-tab").addClass("active");
		});
		function doCmd(cmd,name,group){
		    if(cmd=='pause'){
		       var f=window.confirm("确定暂停吗？");
		       if(f)
		          window.location=ctx+"/quartz/pause?name="+name+"&group="+group;
		    }else if(cmd=='remove'){
		       var f=window.confirm("确定删除吗？");
		       if(f)
		          window.location=ctx+"/quartz/remove?name="+name+"&group="+group;
		    }else if(cmd=='resume'){
		       var f=window.confirm("确定恢复吗？");
		       if(f)
		          window.location=ctx+"/quartz/resume?name="+name+"&group="+group;
		    }
		    
		}
	</script>
</head>

<body>
  <div class="toolbar" style="margin-top: 10px;">
	      <a href="create"><input onclick="window.location=ctx+'/quartz/create';" id='adduserBtn' class="btn btn-primary" type="button" value="添加任务"/></a>
    </div>
    <div style="height: 10px;"></div>
<table    class="table table-striped table-bordered table-condensed">
            <tr>
                <th nowrap>
                      名称
                </th>
                <th nowrap>
                      分组
                </th>
                <th nowrap>
                    下次执行时间
                </th>
                <th nowrap>
                    上次执行时间
                </th>
                <th nowrap>
                    类
                </th>
                <th nowrap>
                  状态
                </th><th nowrap>
                  规则
                </th>
                <th nowrap>
                      类型
                </th>
                <th nowrap>
                    开始时间
                </th>
               
                <th nowrap>
                    动作命令
                </th>
            </tr>
            <c:forEach var="map" items="${quartzs}">
                <tr>
                    <td nowrap>
                    	${map.display_name}
                    </td>
                    <td nowrap>
                    	${map.trigger_group}
                    </td>
                    <td nowrap>
                    	${map.next_fire_time}
                    </td>
                    <td nowrap>
                    	${map.prev_fire_time}
                    </td>
                    <td nowrap>
                    	${map.job_class_name}
                    </td>
                    <td nowrap>
                    	${map.status}
                    </td>
                     <td nowrap>
                    	${map.cron_expression}
                    </td>
                    <td nowrap>
                    	${map.trigger_type}
                    </td>
                    <td nowrap>
                    	${map.start_time}
                    </td>
                    
                    <td nowrap>
                     <a href="#" onclick="doCmd('pause','${map.trigger_name}','${map.trigger_group}','${map.trigger_state}')">暂停</a>
                     <a href="#" onclick="doCmd('resume','${map.trigger_name}','${map.trigger_group}','${map.trigger_state}')">恢复</a>
                     <a href="#" onclick="doCmd('remove','${map.trigger_name}','${map.trigger_group}','${map.trigger_state}')">删除</a>
                    	<!--<input type="button" id="pause" value="暂停" onclick="doCmd('pause','${map.trigger_name}','${map.trigger_group}','${map.trigger_state}')">
						<input type="button" id="resume" value="恢复" onclick="doCmd('resume','${map.trigger_name}','${map.trigger_group}','${map.trigger_state}')">
						<input type="button" id="remove" value="删除" onclick="doCmd('remove','${map.trigger_name}','${map.trigger_group}','${map.trigger_state}')">						
                    --></td>
                </tr>
            </c:forEach>
        </table>
</body>
</html>
