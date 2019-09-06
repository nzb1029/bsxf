package org.bsxf.aop;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.bsxf.utils.DateUtil;
import org.bsxf.utils.PropertiesUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/** 
 * 基于注解的AOP日志示例 ，顺便封装导出功能
 * @author 
 */
@Component
@Aspect
public class AopLog {
	private static Logger logger = LoggerFactory.getLogger(AopLog.class);

	//方法执行的前后调用  
	@SuppressWarnings("unchecked")
	public Object runOnAround(ProceedingJoinPoint point) throws Throwable {

	//	long start = System.currentTimeMillis();
	//	Stopwatch stopwatch = new Stopwatch().start();
	//	String str = "";
		Object object = point.proceed();
		if (point.getArgs().length > 0) {
			Object[] args = point.getArgs();
			for (Object o : args)
				if (o instanceof HttpServletRequest)
				{
					//str = "导出";
					object = exportExcel(object,o,point);
				}
		}
		//每个方法日志先暂时去掉
		//long end = System.currentTimeMillis();
		//long nanos = stopwatch.elapsedMillis();
		//if (!point.getSignature().getName().equals("getMsg") && (nanos) > 0) {
		//	logger.info(EhcacheManager.getStationConfig().getName() + "("
		//			+ (LtSecurityUtils.getShiroUser() == null ? "anon" : LtSecurityUtils.getShiroUser()) + ")-" + str
		//			+ "" + " [" + point.getSignature() + "]耗时：" + ((end - start) + ":" + nanos) + "毫秒");
		//}

		return object;
	}

	
	public Object  exportExcel(Object object, Object o, ProceedingJoinPoint point) throws Exception {

		HttpServletRequest request = (HttpServletRequest) o;
		String export = request.getParameter("exportFlg");
		String expCols = request.getParameter("expCols");
		if (StringUtils.isNotBlank(export)) {//客户端掉的导出。。。。
			if (StringUtils.isBlank(expCols)) {

			} else if (object instanceof Map) {
				Map<String, Object> map = (Map<String, Object>) object;
				List list = (List) map.get("rows");
				List<List<Object>> rowList = new ArrayList<List<Object>>();
				//解析要导出的列
				String[] cols = StringUtils.split(expCols, ",");
				List<Object> row = new ArrayList<Object>();
				List<String> colid = new ArrayList<String>();
				for (int i = 0; i < cols.length; i++) {
					String[] colStrs = cols[i].split(":");
					String col = colStrs[0];
					String colName = colStrs[1];
					row.add(colName);
					colid.add(col);
				}
				rowList.add(row);
				for (int i = 0; i < list.size(); i++) {
					Object obj = list.get(i);
					List<Object> beanList = new ArrayList<Object>();
					for (int j = 0; j < colid.size(); j++) {
						Object colVal = "";
						try {
							colVal = PropertyUtils.getProperty(obj, colid.get(j));
						} catch (Exception e) {
							logger.info("导出出现错误：" + e.getMessage());
						}

						beanList.add(colVal);
					}
					rowList.add(beanList);
				}
				String fileUrl = createExcel(rowList);
				Map map2 = new HashMap();
				map2.put("url", fileUrl);
				List<String> tlist = (List<String>) ((Map) object).get("tlist");
				object = map2;
				if (point.getSignature().getName().equals("eqgrid")) {//特殊处理的设备导出
					File f = new File(PropertiesUtils.getFileDir() + "/" + fileUrl);
					POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(f));
					HSSFWorkbook wb = new HSSFWorkbook(fs);//建立新HSSFWorkbook对象  
					HSSFSheet sheet = wb.getSheetAt(0);

					//合并项
					for (String s : tlist) {
						CellRangeAddress cra = CellRangeAddress.valueOf(s);
						sheet.addMergedRegion(cra);
					}
					CellStyle topStyle = wb.createCellStyle();
					topStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);//重新设置垂直居中
					HSSFRow roww = sheet.getRow(0);
					int colNum = roww.getPhysicalNumberOfCells();
					int rowNum = sheet.getLastRowNum();
					for (int k = 0; k < rowNum; k++) {
						roww = sheet.getRow(k);
						for (int kk = 0; kk < colNum; kk++) {
							roww.getCell(kk).setCellStyle(topStyle);
						}
					}
					fileUrl = "/temp/" + "workbook" + System.currentTimeMillis() + ".xls";
					String p = PropertiesUtils.getFileDir() + fileUrl;
					FileOutputStream fileOut = new FileOutputStream(p);
					wb.write(fileOut);
					//wb.
					fileOut.flush();
					fileOut.close();
					fileOut = null;
					map2.put("url", fileUrl);
				}
			}
		}
	
		 return object;
		
	}

	/***
	 * 返回下载路径
	 * */
	private String createExcel(List<List<Object>> rows) throws Exception {
		HSSFWorkbook wb = new HSSFWorkbook();//建立新HSSFWorkbook对象  
		HSSFSheet sheet = wb.createSheet("export_sheet");//建立新的sheet对象  

		int nk = 1;
		for (int i = 0; i < rows.size(); i++) {
			if (i % 60000 == 0 && i > 0) {
				//sheet = wb.createSheet("export_sheet" + nk);//建立新的sheet对象
				//nk++;
				break;
			}
			HSSFRow row = sheet.createRow(i);//建立新行  
			List<Object> rowObj = rows.get(i);
			for (int j = 0; j < rowObj.size(); j++) {
				HSSFCell cell = row.createCell(j);//建立新cell  
				Object o = rowObj.get(j);
				//cell.esetEncoding(HSSFCell.ENCODING_UTF_16);
				if (o == null)
					cell.setCellValue("");
				else if (o instanceof Date)
					cell.setCellValue(DateUtil.formatDateToString((Date) rowObj.get(j)));//设置cell的整数类型的值  
				else
					cell.setCellValue(o.toString());

			}

		}
		String path = PropertiesUtils.getFileDir() + "/temp/";
		File f = new File(path);
		if (!f.exists())
			f.mkdir();
		String conpath = "workbook" + System.currentTimeMillis() + ".xls";
		//	String fileUrl = PropertiesUtils.getFileDir() + "/temp/workbook" + System.currentTimeMillis() + ".xls";
		FileOutputStream fileOut = new FileOutputStream(path + conpath);
		wb.write(fileOut);
		//wb.
		fileOut.flush();
		fileOut.close();
		fileOut = null;
		rows = null;
		//貌似垃圾回收很慢，算了，显示调用下，据说不好，但是没办法，不知道咋弄
		System.gc();
		//wb.c
		return "temp/" + conpath;
	}
}