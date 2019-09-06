<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=urf-8">
     <%@include file="/WEB-INF/common/calendar.jsp" %>  
     <script type="text/javascript">
       $(function(){
          $("#help").click(function(){
             $("#helpID").toggle();
          });
       });
     </script>
    </head>
    <body>
    	
    	 
    	<p><a href="${pageContext.request.contextPath}/quartz/list">调度任务监控管理</a></p>
		
        <form id="myForm1" action="${pageContext.request.contextPath}/quartz/save?jobtype=0" method="post">
            <table style="width: 100%">
                <tr>
                    <th colspan="3" bgcolor="00ff00">
                        <b>Simple Trigger</b>
                    </th>
                </tr>
                <tr>
                    <td nowrap>
                        Trigger名称：
                    </td>
                    <td >
                        <input type="text" name ="p_triggerName" size="20">
                    </td>
                    <td>
                        （必填）
                    </td>
                </tr>
                <tr>
                    <td nowrap>
                        执行类名称：
                    </td>
                    <td >
                        <input type="text" name ="p_className" size="20">
                    </td>
                    <td>
                        （必填）
                    </td>
                </tr>
                <tr>
                    <td nowrap>
                        Trigger分组：
                    </td>
                    <td>
                        <select name="p_triggerGroup">
                            <option value="DEFAULF">defaulf</option>
                            <option value="行政组">行政组</option>
                            <option value="财务组">财务组</option>
                            <option value="开发组">开发组</option>
                        </select>
                    </td>
                    <td>
                        （Trigger分组，Quartz默认组为DEFAULF）
                    </td>
                </tr>
                <tr>
                    <td nowrap>
                        开始时间：
                    </td>
                    <td>
                        <input " type="text" name="p_startTime" size="20"  onclick="new WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'}) ">
                    </td>
                    <td>
                       （Trigger执行开始时间，必填） 
                    </td>
                </tr><!--
                <tr>
                    <td nowrap>
                        结束时间：
                    </td>
                    <td>
                        <input " type="text" name="p_endTime" size="20"  onclick="new WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'}) ">
                    </td>
                    <td>
                        <img id="calEnd" src="components/calendar/skins/aqua/cal.gif" border="0" alt="结束时间" style="cursor:pointer">（Trigger执行结束时间，可以不填写） 
                    </td>
                </tr>
                --><tr>
                    <td nowrap>
                        执行次数：
                    </td>
                    <td>
                        <input " type="text" name="p_repeatCount" size="20">
                    </td>
                    <td>
                        次（表示Trigger启动后执行多少次结束，不填写执行一次）
                    </td>
                    <tr>
                        <td nowrap>
                            执行间隔：
                        </td>
                        <td>
                            <input " type="text" name="p_repeatInterval" size="20">
                        </td>
                        <td>
                            秒（表示Trigger间隔多长时间执行一次，不填写前后两次执行没有时间间隔，直到任务结束）
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input type="submit" value="添加Trigger">
                        </td>
                    </tr>
                    </table>
                </form>
                <script type="text/javascript">
                   
                </script>
				
				<br>
				
                <form id="myForm2" action="${pageContext.request.contextPath}/quartz/save?jobtype=1" method="post">
                    <table>
                        <tr>
                            <th colspan="3" bgcolor="00ff00">
                                <b>Cron Trigger 1</b>
                            </th>
                        </tr>
                        <tr>
                            <td nowrap>
                                Trigger 名称：
                            </td>
                            <td>
                                <input type="text" name ="triggerName" size="20">
                            </td>
                            <td>
                                （必填）
                            </td>
                        </tr>
                          <tr>
                    <td nowrap>
                        执行类名称：
                    </td>
                    <td >
                        <input type="text" name ="triggerClassName" size="20">
                    </td>
                    <td>
                        （必填）
                    </td>
                </tr><!--
                   <tr>
                    <td nowrap>
                        执行方法名称：
                    </td>
                    <td >
                        <input type="text" name ="triggerMethod" size="20">
                    </td>
                    <td>
                        （必填）
                    </td>
                </tr>
                        --><tr>
                            <td nowrap>
                                Cron表达式：
                            </td>
                            <td>
                                <input type="text" name ="cronExpression" size="20">
                            </td>
                            <td>
                                （必填，Cron表达式(如"0/10 * * ? * * *"，每10秒中执行调试一次)，对使用者要求比较，要会写Cron表达式，实际项目中不适用）
                           <a href=' javascript:return void(0)' id="help">帮助</a> </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <input type="submit" value="添加Trigger">
                            </td>
                        </tr>
                    </table>
                </form>
				<pre style="display: none;" id="helpID">
字段 允许值 允许的特殊字符  
秒 0-59 , - * /  
分 0-59 , - * /  
小时 0-23 , - * /  
日期 1-31 , - * ? / L W C  
月份 1-12 或者 JAN-DEC , - * /  
星期 1-7 或者 SUN-SAT , - * ? / L C #  
年（可选） 留空, 1970-2099 , - * /  
表达式意义  
"0 0 12 * * ?" 每天中午12点触发  
"0 15 10 ? * *" 每天上午10:15触发  
"0 15 10 * * ?" 每天上午10:15触发  
"0 15 10 * * ? *" 每天上午10:15触发  
"0 15 10 * * ? 2005" 2005年的每天上午10:15触发  
"0 * 14 * * ?" 在每天下午2点到下午2:59期间的每1分钟触发  
"0 0/5 14 * * ?" 在每天下午2点到下午2:55期间的每5分钟触发  
"0 0/5 14,18 * * ?" 在每天下午2点到2:55期间和下午6点到6:55期间的每5分钟触发  
"0 0-5 14 * * ?" 在每天下午2点到下午2:05期间的每1分钟触发  
"0 10,44 14 ? 3 WED" 每年三月的星期三的下午2:10和2:44触发  
"0 15 10 ? * MON-FRI" 周一至周五的上午10:15触发  
"0 15 10 15 * ?" 每月15日上午10:15触发  
"0 15 10 L * ?" 每月最后一日的上午10:15触发  
"0 15 10 ? * 6L" 每月的最后一个星期五上午10:15触发  
"0 15 10 ? * 6L 2002-2005" 2002年至2005年的每月的最后一个星期五上午10:15触发  
"0 15 10 ? * 6#3" 每月的第三个星期五上午10:15触发  
每天早上6点  
0 6 * * *  
每两个小时  
0 */2 * * *  
晚上11点到早上8点之间每两个小时，早上八点  
0 23-7/2，8 * * *  
每个月的4号和每个礼拜的礼拜一到礼拜三的早上11点  
0 11 4 * 1-3  
1月1日早上4点  
0 4 1 1 *  
				</pre>
				 <!--
				
				  <form id="myForm3" action="${pageContext.request.contextPath}/JobProcessServlet?jobtype=2&action=add" method="post">
                    <table>
                        <tr>
                            <th colspan="4" bgcolor="00ff00" widthd="100%">
                                <b>Cron Trigger 2</b>
                            </th>
                        </tr>
                        <tr>
                            <td nowrap>
                                Trigger 名称：
                            </td>
                            <td colspan="3">
                                <input type="text" name ="triggerName" size="20">（必填）
                            </td>                         
                        </tr>
                        <tr>
                            <td nowrap>
                                每
                            </td>
                            <td nowrap>
                                <input type="text" name ="val" size="5">
                            </td>
                            <td nowrap>
                                <select name="selType">
                                	<option value="second">秒</option>
									<option value="minute">分</option>									
                                </select>
                            </td>
							<td>执行一次（必填，范围 0-59）<td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <input type="submit" value="添加Trigger">
                            </td>
                        </tr>
                    </table>
                </form>
				
				--> <!--
				
	                  <table>
                        <tr>
                            <th  bgcolor="00ff00">
                                <b>Cron Trigger ...</b>
                            </th>
                        </tr>
                        <tr>
                            <td>
                               Cron Trigger功能比较强大，Cron表达式写法多种多样，我没有找到一个比较通用的方式去转换所有Cron表达式，
							   在此只列起一几种比较简单的情况，希望能起到一个抛砖引玉作用，更多具体情况请参加相关文档。如果你有什么
							   好的方式也请告知，互相学习。
                            </td>                          
                        </tr>  
                    </table>			
				
                --></body>
            </html>