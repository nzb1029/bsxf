<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  
  <body><strong> 
    尊敬的${userName}，您好：</strong><br>&nbsp;&nbsp;&nbsp; <br>&nbsp;&nbsp;&nbsp;&nbsp; 本月尚有如下灭火器没有巡检，请根据实际情况合理安排，谢谢。<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br><table width="519" border="1" height="76">
<tbody><tr>
<td>灭火器编号</td>
<td>区域</td>
<td>位置</td>
<td>巡检人</td>
<td>本月剩余巡检次数</td></tr>
<#list equipmentList as equipment >
<tr>
<td>${equipment.eno}</td>
<td>${equipment.area}</td>
<td>${equipment.location}</td>
<td><font color="#ff0000">${equipment.checkUser.name}</font></td>
<td><font color="#ff0000">${equipment.remainNum}</font></td>
</tr>
</#list>
</tbody></table>
<br><br>
-------------------------------------
<br>本邮件由系统自动发送，请勿回复
</body>
</html>
