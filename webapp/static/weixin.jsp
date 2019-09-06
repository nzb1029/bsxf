<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.io.PrintWriter"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String signature =request.getParameter("signature");//微信加密签名
String timestamp =request.getParameter("timestamp");//时间戳
String nonce =request.getParameter("nonce");//随机数
String echostr =request.getParameter("echostr");//随机字符串 
//PrintWriter out = response.getWriter(); 
 // 通过检验signature对请求进行校验若校验成功则原样返回echostr表示接入成功否则接入失败  
 System.out.println("signature="+signature);
 System.out.println("timestamp="+timestamp);
 System.out.println("nonce="+nonce);
 System.out.println("echostr="+echostr);
if (checkSignature(signature, timestamp, nonce)) { 
	out.print(echostr.trim());  
} 
 //out.close();
//out = null; 	
   	
 
%>
<%!
String token="weixin";
public boolean checkSignature(String signature,String timestamp,String nonce){
	String[] arr=new String[]{token,timestamp,nonce};
	Arrays.sort(arr);
	StringBuilder content=new StringBuilder();
	for(int i=0;i<arr.length;i++){
		content.append(arr[i]);
		
		
	}
	MessageDigest md=null;
	String tmpStr=null;
	try{
		md = MessageDigest.getInstance("SHA-1");
		byte[] digest=md.digest(content.toString().getBytes());
		tmpStr=byteToStr(digest);
	}catch(Exception e){e.printStackTrace();}
	 
	content = null;  
     // 将sha1加密后的字符串可与signature对比标识该请求来源于微信 
  return tmpStr != null ? tmpStr.equals(signature.toUpperCase()) : false;
}
private   String byteToStr(byte[] byteArray) {  
   String strDigest = "";  
	for (int i = 0; i < byteArray.length; i++) { 
	 strDigest += byteToHexStr(byteArray[i]); 
	 } 
   return strDigest; 
 } 
private   String byteToHexStr(byte mByte) { 
  char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
  char[] tempArr = new char[2]; 
  tempArr[0] = Digit[(mByte >>> 4) & 0X0F];
  tempArr[1] = Digit[mByte & 0X0F];  
  String s = new String(tempArr);
 return s;
 }
%>
