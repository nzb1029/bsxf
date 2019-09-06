<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.awt.print.PrinterJob"%>
<%@page import="java.awt.print.PageFormat"%>
<%@page import="java.awt.print.Paper"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="java.awt.Graphics"%>
<%@page import="java.awt.print.PrinterException"%>
<%@page import="java.awt.Color"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.Font"%>
<%@page import="javax.print.DocFlavor"%>
<%@page import="javax.print.PrintService"%>
<%@page import="javax.print.PrintServiceLookup"%>
<%@page import="javax.print.DocPrintJob"%>
<%@page import="javax.print.attribute.PrintRequestAttributeSet"%>
<%@page import="javax.print.attribute.standard.MediaSizeName"%>
<%@page import="javax.print.attribute.DocAttributeSet"%>
<%@page import="javax.print.attribute.HashDocAttributeSet"%>
<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@page import="javax.print.Doc"%>
<%@page import="javax.print.SimpleDoc"%>
<%@page import="javax.print.PrintException"%>
<%@page import="javax.swing.JOptionPane"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>打印</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%!
/**
* java定位打印，把打印内容打到指定的地方。
*
* @author lyb
*
*/
public class LocatePrint implements Printable {
	private int PAGES = 0;

	private String printStr;

	/*
	 * Graphic指明打印的图形环境；PageFormat指明打印页格式（页面大小以点为计量单位，
	 * 1点为1英寸的1/72，1英寸为25.4毫米。A4纸大致为595×842点）；page指明页号
	 */
	public int print(Graphics gp, PageFormat pf, int page) throws PrinterException {
		Graphics2D g2 = (Graphics2D) gp;
		g2.setPaint(Color.black); // 设置打印颜色为黑色
		if (page >= PAGES) // 当打印页号大于需要打印的总页数时，打印工作结束
			return Printable.NO_SUCH_PAGE;
		g2.translate(pf.getImageableX(), pf.getImageableY());// 转换坐标，确定打印边界
		Font font = new Font("宋体", Font.PLAIN, 24);// 创建字体
		g2.setFont(font);
		// 打印当前页文本
		int printFontCount = printStr.length();// 打印字数
		int printFontSize = font.getSize();// Font 的磅值大小
		float printX = 595 / 2; // 给定字符点阵，X页面正中
		float printY = 842 / 2; // 给定字符点阵，Y页面正中
		float printMX = printX - (printFontCount * printFontSize / 2);// 打印到正中间
		float printMY = printY - printFontSize / 2;// 打印到正中间
		g2.drawString(printStr, printMX, printMY); // 具体打印每一行文本，同时走纸移位
		g2.drawString(printStr, printMX - printFontSize * printFontCount, printMY + printFontSize); // 具体打印每一行文本，同时走纸移位
		g2.drawString(printStr, printMX + printFontSize * printFontCount, printMY + printFontSize); // 具体打印每一行文本，同时走纸移位
		g2.drawString(printStr, printMX, printMY + printFontSize * 2); // 具体打印每一行文本，同时走纸移位
		return Printable.PAGE_EXISTS; // 存在打印页时，继续打印工作
	}

	// 打印内容到指定位置
	public void printContent() {
		printStr = "打印测试内容";// 获取需要打印的目标文本
		if (printStr != null && printStr.length() > 0) // 当打印内容不为空时
		{
			PAGES = 1; // 获取打印总页数
			// 指定打印输出格式
			DocFlavor flavor = DocFlavor.SERVICE_FORMATTED.PRINTABLE;
			// 定位默认的打印服务
			PrintService printService = PrintServiceLookup.lookupDefaultPrintService();
			// 创建打印作业
			DocPrintJob job = printService.createPrintJob();
			// 设置打印属性
			PrintRequestAttributeSet pras = new HashPrintRequestAttributeSet();
			// 设置纸张大小,也可以新建MediaSize类来自定义大小
			pras.add(MediaSizeName.ISO_A4);
			DocAttributeSet das = new HashDocAttributeSet();
			// 指定打印内容
			Doc doc = new SimpleDoc(this, flavor, das);
			// 不显示打印对话框，直接进行打印工作
			try {
				job.print(doc, pras); // 进行每一页的具体打印操作
			} catch (PrintException pe) {
				pe.printStackTrace();
			}
		} else {
			// 如果打印内容为空时，提示用户打印将取消
			JOptionPane.showConfirmDialog(null, "Sorry, Printer Job is Empty, Print Cancelled!",

			"Empty", JOptionPane.DEFAULT_OPTION, JOptionPane.WARNING_MESSAGE);
		}
	}

 
}
%>
<%
	LocatePrint lp = new LocatePrint();
	lp.printContent();
	System.out.println("===========打印完成===============");
%>
  </head>
  
  <body>
   <%="===========打印完成===============" %> 
  </body>
</html>
