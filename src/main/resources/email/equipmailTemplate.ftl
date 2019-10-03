<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  
  <body><strong> 
    尊敬的${userName}，您好：</strong><br>&nbsp;&nbsp;&nbsp; <br>&nbsp;&nbsp;&nbsp;&nbsp; 有以下灭火器即将过期，请尽快处理！！！<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br><table width="600" border="1" height="76">
<tbody><tr>
<td>灭火器编号</td>
<td>区域</td>
<td>位置</td>
<td>001有效期</td>
<td>002有效期</td>
<td>003有效期</td>
<#list equipmentList as equipment >
<tr>
<td>${equipment.eno}</td>
<td>${equipment.area}</td>
<td>${equipment.location}</td>
<#if (equipment.effDate??)>
<td><font color="#ff0000">${equipment.effDate?string("yyyy-MM-dd")} &nbsp;&nbsp; 至   &nbsp;&nbsp;${equipment.expDate?string("yyyy-MM-dd")} </font></td>
<#else>
<td></td>
</#if>
<#if (equipment.effDate2??)>
<td><font color="#ff0000">${equipment.effDate2?string("yyyy-MM-dd")}  &nbsp;&nbsp; 至   &nbsp;&nbsp; ${equipment.expDate2?string("yyyy-MM-dd")}  </font></td>
<#else>
<td></td>
</#if>
<#if (equipment.effDate3??)>
<td><font color="#ff0000">${equipment.effDate3?string("yyyy-MM-dd")} &nbsp;&nbsp; 至   &nbsp;&nbsp; ${equipment.expDate3?string("yyyy-MM-dd")} </font></td>
<#else>
<td></td>
</#if>
</tr>
</#list>
</tbody></table>
<br><br>
-------------------------------------
<br>本邮件由系统自动发送，请勿回复
</body>
</html>
