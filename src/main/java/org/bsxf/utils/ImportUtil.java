package org.bsxf.utils;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.springside.utils.Identities;

import sun.misc.BASE64Encoder;

public class ImportUtil {
	/**
	 * 1:211421_绥中县,211224_图南县,120107_塘沽区,120108_汉沽区,120109_大港区
	 * 2:341822_广德县,350128_平潭县,237200_省森工总局红十字会,239900_省农垦总局红十字会,230833_抚远县,231081_绥芬河市,227100_长白山管理委员会 
	 * 3:410181_巩义市,410225_兰考县,410482_汝州市,410526_滑县,410728_长垣县,411381_邓州市,411481_永城市,411525_固始县,411628_鹿邑县,411729_新蔡县,370290_青岛市开发区,429004_仙桃市,429005_潜江市,429006_天门市,429021_神农架林区
	 * 4:500222_万盛经济开发区,520382_仁怀市,522427_威宁彝族回族苗族自治县,469001,469002,469003,469005,469006,469007,469021,469022,469023,469024,469025,469026,469027,469028,469029,469030
	 * 5:662008_新疆生产建设兵团二二二团红十字会
	 * 
	 *  
	 * */

	public static void initUser() {
		String st = "150700";
		String sts = "150790_扎赉诺尔区";
		int dstart = 16;
		int uid = 495;
		String pasd = "liTjFY,7SUoxI,r1pd67,qAccKV,CYsFlU,mxJMrW,J98UQW,KanhXo,fcBP0h,Z52H4M,yclzUj,CWJCUV,BTNIyq,pR5xqW,HLMKQQ,sLMehx,JOQ33e,gKARDy,kW5dWD,HBhkJ3,hLMpef";
		String[] sArray = StringUtils.split(sts, ",");
		List<String> dqls = new ArrayList<String>();
		List<String> uqls = new ArrayList<String>();
		List<String> urqls = new ArrayList<String>();
		for (String s : sArray) {
			String departId = "0001" + StringUtils.leftPad(dstart + "", 4, "0");
			String jd = StringUtils.split(s, "_")[0];
			String sqldepartment = "insert into uisp_lw_"
					+ st
					+ ".pubmodule_department_tbl (child,level,status,isPrivate,departmentNumber,departmentIntroduction,sortNo,departmentId,departmentName,delTag,parent_id)values"
					+ "('0',null,'0',null,'0001','','1','" + departId + "','" + StringUtils.split(s, "_")[1]
					+ "直报部门','0','0001');";
			//bu部门组织机构关联
			String sql1 = "insert into uisp_lw_"
					+ st
					+ ".form__base_departmentmanage_departmentinfo (fax,permitno,departmentProperty,agency,postcode,setupdate,contantAddress,contacts,cellphone,departmentDuty,approvetime,telephone,recordid,delTag,emals) "
					+ " select '' ,'','', recordid,'','','','','','','','','" + departId
					+ "','0','' from  uisp_lw_hhzz.form__base_mechanismset_mechanisminfo where mechanismnumber='" + jd
					+ "' and deltag='0' ;";
			dqls.add(sqldepartment);
			dqls.add(sql1);
			for (int i = 0; i <= 20; i++) {
				String uname = jd + StringUtils.leftPad(i + "", 2, "0");
				String md5Passwd = MD5Crypt.getMD5(StringUtils.split(pasd, ",")[i].getBytes());
				String usql = "insert into uisp_lw_"
						+ st
						+ ".pubmodule_user_tbl (password,userName,delTag,status,spelling,director,email,sex,trueName,department_id,sortNo,isPublicMobileTelephone,passwordAnswerTwo,loginType,id,logIP,officeTelephone,mobileTelExt,domain,passwordAnswerOne,lastLoginTime,passwordProtectOne,mobileTelephone)values"
						+ "('" + md5Passwd + "','" + uname + "','0','1','0','0002','','f','" + uname + "','" + departId
						+ "','1','0',null,'1','" + uid + "',null,'',null,null,null,null,null,'');";

				uqls.add(usql);
				String rid = "";
				if (i == 0)
					rid = "4";
				else if (i > 0 && i < 11)
					rid = "2";
				else
					rid = "3";
				String rusql = "insert into uisp_lw_" + st
						+ ".pubmodule_userrole_tbl (wayMark,user_id,role_id)values(null,'" + uid + "','" + rid + "');";
				urqls.add(rusql);
				uid++;
			}
			dstart++;
		}
		System.out.println(StringUtils.join(urqls, "\n"));
	}

	/**
	 * 按照xml模板导出word
	 * */
	public static void ExportWord(Map<String, Object> pmap) throws Exception {
		File f = new File("g://新建 Microsoft Word 97 - 2003 Document (2).xml");
		String fstr = FileUtils.readFileToString(f, "utf-8");

		File fimg = new File("g://tyd.jpg");
		byte[] fty = FileUtils.readFileToByteArray(fimg);

		BASE64Encoder be = new BASE64Encoder();
		String bimg = (be.encode(fty));
		pmap.put("img", bimg);
		pmap.put("img1", bimg);
		fstr = FreeMarkerUtil.rendereString(fstr, pmap);
		File sf = new File("g://myword.doc");
		FileUtils.writeStringToFile(sf, fstr, "utf-8");
	}

	public static void main(String[] args) throws Exception {
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("name", "你是word吗？");
		ExportWord(pmap);
	}

	public static void dm3Station(int k, List<String> sList) throws Exception {
		Map stMap = new HashMap();
		File f = new File("C:/Documents and Settings/Administrator/桌面/密码表/站点对应表.xls");
		POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(f));
		HSSFWorkbook wb = new HSSFWorkbook(fs);//建立新HSSFWorkbook对象  
		HSSFSheet sheet = wb.getSheetAt(k);
		int rowNum = sheet.getLastRowNum();
		for (int j = 1; j <= rowNum; j++) {
			HSSFRow row = sheet.getRow(j);
			row.createCell(0).setCellType(HSSFCell.CELL_TYPE_STRING);
			row.getSheet().getWorkbook().createCellStyle();
			//row.createCell(0).setCellStyle(BorderStyle.THIN);
			String station = getCellFormatValue(row.getCell(1));
			sList.add("" + station + "");
		}
		//System.out.println(StringUtils.join(sList, ","));
	}

	public static void dm4Station() throws Exception {

		for (int i = 0; i < 5; i++) {
			List<String> sList = new ArrayList<String>();
			dm3Station(i, sList);
		}
	}

	public static void dm2Station() throws Exception {
		Map stMAp = new HashMap();
		/*for (int i = 1; i <= 5; i++) {
			File f1 = new File("C:/Documents and Settings/Administrator/桌面/密码表/各组上的站点/" + i + "/link.txt");
			String str = FileUtils.readFileToString(f1);
			String[] sarray = StringUtils.split(str, ";\n");
			for (String s : sarray) {
				stMAp.put(s.substring(9), "fuisp" + i);
			}
		}*/
		for (int i = 0; i < 5; i++) {
			List<String> sList = new ArrayList<String>();
			dm3Station(i, sList);
			for (String key : sList)
				stMAp.put(key, "fuisp" + (i + 1));
		}
		//System.out.println(stMAp);
		//System.out.println(stMAp.keySet().size());
		File f = new File("C:/Documents and Settings/Administrator/桌面/密码表/密码表-new.xls");
		POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(f));
		HSSFWorkbook wb = new HSSFWorkbook(fs);//建立新HSSFWorkbook对象  
		HSSFCellStyle setBorder = wb.createCellStyle();
		setBorder.setBorderBottom(BorderStyle.THIN); //下边框
		setBorder.setBorderLeft(BorderStyle.THIN);//左边框
		setBorder.setBorderTop(BorderStyle.THIN);//上边框
		setBorder.setBorderRight(BorderStyle.THIN);//右边框
		HSSFSheet sheet = wb.getSheetAt(0);
		int rowNum = sheet.getLastRowNum();
		Map staaaaMap = new HashMap();
		Set s = new LinkedHashSet();
		Set<String> urSql = new LinkedHashSet<String>();
		for (int j = 1; j <= rowNum; j++) {
			HSSFRow row = sheet.getRow(j);
			//int colNum = row.getPhysicalNumberOfCells();
			HSSFCellStyle setBorder1 = row.getRowStyle();
			if (setBorder == null)
				setBorder1 = wb.createCellStyle();
			row.setRowStyle(setBorder1);
			String station = getCellFormatValue(row.getCell(1));
			//String loginname = getCellFormatValue(row.getCell(2));
			String dm = getCellFormatValue(row.getCell(4));
			s.add(dm);
			//System.out.println(station);
			String duisp = stMAp.get(station).toString();
			staaaaMap.put(dm, duisp + "/~" + station + "");
			//String md5Passwd = MD5Crypt.getMD5(passwd.getBytes());

		}
		HSSFSheet sheet1 = wb.getSheetAt(1);
		rowNum = sheet.getLastRowNum();
		//Map staaaaMap = new HashMap();
		//Set s = new LinkedHashSet();
		//Set<String> urSql = new LinkedHashSet<String>();
		for (int j = 1; j <= rowNum; j++) {
			HSSFRow row = sheet1.getRow(j);
			if (row == null)
				continue;
			//int colNum = row.getPhysicalNumberOfCells();
			String station = getCellFormatValue(row.getCell(1));
			//String loginname = getCellFormatValue(row.getCell(2));
			String dm = getCellFormatValue(row.getCell(4));
			s.add(dm);
			//System.out.println(station);
			String duisp = stMAp.get(station).toString();
			staaaaMap.put(dm, duisp + "/~" + station + "");
			//String md5Passwd = MD5Crypt.getMD5(passwd.getBytes());
			//row.getCell(1).setcells.getCellStyle()
			HSSFCellStyle setBorder2 = row.getCell(1).getCellStyle();
			//row.getSheet().getWorkbook()
			if (setBorder == null)
				setBorder = row.getSheet().getWorkbook().createCellStyle();
			row.getCell(1).setCellStyle(setBorder);
			setBorder.setBorderBottom(BorderStyle.THIN); //下边框
			setBorder.setBorderLeft(BorderStyle.THIN);//左边框
			setBorder.setBorderTop(BorderStyle.THIN);//上边框
			setBorder.setBorderRight(BorderStyle.THIN);//右边框
		}
		//System.out.println(s.size());
		Iterator<String> it = staaaaMap.keySet().iterator();
		List<String> dList = new ArrayList<String>();
		List<String> dList1 = new ArrayList<String>();
		List<String> dList2 = new ArrayList<String>();
		List<String> dList3 = new ArrayList<String>();
		List<String> dList4 = new ArrayList<String>();
		while (it.hasNext()) {
			String key = it.next();
			String fp = staaaaMap.get(key).toString();

			String ft = (fp.substring(5, 6));
			if (ft.equals("1"))
				dList.add("\"" + key + "\":" + "\"" + fp.replace("fuisp1", "fuisp") + "\"");
			else if (ft.equals("2"))
				dList1.add("\"" + key + "\":" + "\"" + fp.replace("fuisp2", "fuisp") + "\"");
			else if (ft.equals("3"))
				dList2.add("\"" + key + "\":" + "\"" + fp.replace("fuisp3", "fuisp") + "\"");
			else if (ft.equals("4"))
				dList3.add("\"" + key + "\":" + "\"" + fp.replace("fuisp4", "fuisp") + "\"");
			else if (ft.equals("5"))
				dList4.add("\"" + key + "\":" + "\"" + fp.replace("fuisp5", "fuisp") + "\"");
		}
		System.out.println(StringUtils.join(dList4, ",\n"));
	}

	public void addCellValue(HSSFRow row, int cnum, String val) {
		System.out.println("===" + val);
		HSSFCell cell = row.createCell(cnum);//建立新cell
		if (cell == null)
			cell = row.createCell(cnum);
		System.out.println("===" + cell);
		cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue(val);
		HSSFCellStyle setBorder = cell.getCellStyle();
		if (setBorder == null)
			setBorder = row.getSheet().getWorkbook().createCellStyle();
		cell.setCellStyle(setBorder);
		setBorder.setBorderBottom(BorderStyle.THIN); //下边框
		setBorder.setBorderLeft(BorderStyle.THIN);//左边框
		setBorder.setBorderTop(BorderStyle.THIN);//上边框
		setBorder.setBorderRight(BorderStyle.THIN);//右边框

	}

	public static void stoString(List<String> aList, int i) throws Exception {
		File f = new File("C:/Documents and Settings/Administrator/桌面/密码表/各组上的站点/" + i + "/link.txt");
		String str = FileUtils.readFileToString(f);
		String[] sarray = StringUtils.split(str, ";\n");
		// var dmMap={"100000":"http://www.baidu.com"};
		//List<String> aList = new ArrayList<String>();
		for (String s : sarray) {
			aList.add("\"" + s.substring(9) + "\":" + "\"fuisp" + i + "\"");
			//System.out.println(s.substring(9));
		}
	}

	public static Map<String, Object> pppp() throws Exception {
		File f = new File("C:/Documents and Settings/Administrator/桌面/密码表/安徽宿松县密码表.xls");
		POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(f));
		HSSFWorkbook wb = new HSSFWorkbook(fs);//建立新HSSFWorkbook对象  
		HSSFSheet sheet = wb.getSheetAt(0);
		List<String> Sql110000List = new ArrayList<String>();
		int rowNum = sheet.getLastRowNum();
		//String[] col = new String[colNum];
		//String[] title = new String[colNum];
		List<String> insertSqlList = new ArrayList<String>();
		List<String> addUrList = new ArrayList<String>();
		Map<String, String> idMap = new HashMap<String, String>();
		String departId = "00010002";
		Set<String> urSql = new LinkedHashSet<String>();
		for (int j = 1; j <= rowNum; j++) {
			HSSFRow row = sheet.getRow(j);
			//int colNum = row.getPhysicalNumberOfCells();
			String station = getCellFormatValue(row.getCell(1));
			station = station.replace(".0", "");
			String loginname = getCellFormatValue(row.getCell(2));
			String passwd = getCellFormatValue(row.getCell(3));
			String md5Passwd = MD5Crypt.getMD5(passwd.getBytes());
			if (station.equals("110000")) {
				Sql110000List.add("update uisp_lw_" + station + ".pubmodule_user_tbl set password='" + md5Passwd
						+ "' where userName ='" + loginname + "'");
				continue;
			}
			String id = "201";
			if (idMap.get(station) != null) {
				id = (Integer.valueOf(idMap.get(station)) + 1) + "";
			}
			idMap.put(station, id);
			String usql = "insert into uisp_lw_"
					+ station
					+ ".pubmodule_user_tbl (password,userName,delTag,status,spelling,director,email,sex,trueName,department_id,sortNo,isPublicMobileTelephone,passwordAnswerTwo,loginType,id,logIP,officeTelephone,mobileTelExt,domain,passwordAnswerOne,lastLoginTime,passwordProtectOne,mobileTelephone)values"
					+ "('" + md5Passwd + "','" + loginname + "','0','1','0','0002','','f','" + loginname + "','"
					+ departId + "','1','0',null,'1','" + id + "',null,'',null,null,null,null,null,'')";

			insertSqlList.add(usql);
			if (loginname.substring(loginname.length() - 2).equals("00"))
				addUrList.add("insert into uisp_lw_" + station
						+ ".pubmodule_userrole_tbl (wayMark,user_id,role_id)values " + "(null,'" + id + "','4')");
			else if (Integer.valueOf(loginname.substring(loginname.length() - 2)) < 11)
				addUrList.add("insert into uisp_lw_" + station
						+ ".pubmodule_userrole_tbl (wayMark,user_id,role_id)values " + "(null,'" + id + "','2')");
			else
				addUrList.add("insert into uisp_lw_" + station
						+ ".pubmodule_userrole_tbl (wayMark,user_id,role_id)values " + "(null,'" + id + "','3')");

			System.out.println(station + ",id:" + id);
			//System.out.println("station:" + station + ",loginname:" + loginname + ",passwd:" + passwd);
			/*	for (int i = 0; i < colNum; i++) {

					//title[i] = getStringCellValue(row.getCell((short) i));
					String val = getCellFormatValue(row.getCell(i));
					System.out.println(val);
					//title[i] = getCellFormatValue(row1.getCell(i));
				}*/
			urSql.add(station);
		}
		HSSFSheet sheet1 = wb.getSheetAt(1);

		rowNum = sheet1.getLastRowNum();
		for (int j = 1; j <= rowNum; j++) {
			HSSFRow row = sheet1.getRow(j);
			//int colNum = row.getPhysicalNumberOfCells();
			if (row == null)
				continue;
			String station = getCellFormatValue(row.getCell(1));
			String loginname = getCellFormatValue(row.getCell(2));
			String passwd = getCellFormatValue(row.getCell(3));
			String md5Passwd = MD5Crypt.getMD5(passwd.getBytes());
			if (station.equals("110000")) {
				Sql110000List.add("update uisp_lw_" + station + ".pubmodule_user_tbl set password='" + md5Passwd
						+ "' where userName ='" + loginname + "'");

				continue;
			}
			String id = "201";
			if (idMap.get(station) != null) {
				id = (Integer.valueOf(idMap.get(station)) + 1) + "";
			}
			idMap.put(station, id);
			String usql = "insert into uisp_lw_"
					+ station
					+ ".pubmodule_user_tbl (password,userName,delTag,status,spelling,director,email,sex,trueName,department_id,sortNo,isPublicMobileTelephone,passwordAnswerTwo,loginType,id,logIP,officeTelephone,mobileTelExt,domain,passwordAnswerOne,lastLoginTime,passwordProtectOne,mobileTelephone)values"
					+ "('" + md5Passwd + "','" + loginname + "','0','1','0','0002','','f','" + loginname + "','"
					+ departId + "','1','0',null,'1','" + id + "',null,'',null,null,null,null,null,'')";

			insertSqlList.add(usql);
			if (loginname.substring(loginname.length() - 2).equals("00"))
				addUrList.add("insert into uisp_lw_" + station
						+ ".pubmodule_userrole_tbl (wayMark,user_id,role_id)values " + "(null,'" + id + "','4')");
			else if (Integer.valueOf(loginname.substring(loginname.length() - 2)) < 11)
				addUrList.add("insert into uisp_lw_" + station
						+ ".pubmodule_userrole_tbl (wayMark,user_id,role_id)values " + "(null,'" + id + "','2')");
			else
				addUrList.add("insert into uisp_lw_" + station
						+ ".pubmodule_userrole_tbl (wayMark,user_id,role_id)values " + "(null,'" + id + "','3')");

			System.out.println(station + ",id:" + id);
			//System.out.println("station:" + station + ",loginname:" + loginname + ",passwd:" + passwd);
			/*	for (int i = 0; i < colNum; i++) {

					//title[i] = getStringCellValue(row.getCell((short) i));
					String val = getCellFormatValue(row.getCell(i));
					System.out.println(val);
					//title[i] = getCellFormatValue(row1.getCell(i));
				}*/
			urSql.add(station);
		}
		File sqlFile = new File("C:/Documents and Settings/Administrator/桌面/密码表/sql/insertSql.sql");
		if (!sqlFile.exists())
			sqlFile.createNewFile();
		FileUtils.writeStringToFile(sqlFile, StringUtils.join(insertSqlList, ";\n"));
		//HSSFRow row1 = sheet.getRow(1);
		List<String> us = new ArrayList<String>();
		for (String s : urSql) {
			us.add("delete from uisp_lw_" + s + ".pubmodule_user_log_tbl ");
			us.add("delete from uisp_lw_" + s + ".pubmodule_userrole_tbl ");
			us.add("delete from uisp_lw_" + s + ".pubmodule_user_tbl where id<>1");
		}
		File sFile = new File("C:/Documents and Settings/Administrator/桌面/密码表/sql/delurSql.sql");
		if (!sFile.exists())
			sFile.createNewFile();
		FileUtils.writeStringToFile(sFile, StringUtils.join(us, ";\n"));
		//////////////////////
		File adFile = new File("C:/Documents and Settings/Administrator/桌面/密码表/sql/addurSql.sql");
		if (!adFile.exists())
			adFile.createNewFile();
		FileUtils.writeStringToFile(adFile, StringUtils.join(addUrList, ";\n"));
		System.out.println(StringUtils.join(Sql110000List, ";\n"));
		return null;
	}

	public static Map<String, Object> aaaaa() throws Exception {
		File f = new File("G:/项目/_home_webapp_fuisp_tempdir_tempexcelcc(3).xls");
		Map<String, Object> keyMap = new HashMap<String, Object>();
		List<Map<String, Object>> dl = (getDataList(f, 2));
		for (Map<String, Object> m : dl) {
			keyMap.put(m.get("station").toString(), m);
		}
		//System.out.println(dl);
		return keyMap;
	}

	public static void ssss() throws Exception {
		File f = new File("G:/项目/最新全国红会站点及区县信息（分页签）.xls");
		List<Map<String, Object>> dl = (getDataList(f, 2));
		List<String> ids = new ArrayList<String>();
		StringBuffer sb = new StringBuffer(
				"insert into form__base_mechanismset_mechanisminfo (recordid,mechanismnumber,mechanismname,station,ownstation_radio,parentId,deltag,child) values \n");
		List<String> flist = new ArrayList<String>();
		////
		List<String> upList = new ArrayList<String>();
		Map<String, Object> keyMap = aaaaa();

		for (Map<String, Object> mp : dl) {
			if (mp.get("pid") == null || mp.get("pid").toString().trim().equals("")) {
				String qdm = mp.get("区划代码") == null ? "" : mp.get("区划代码").toString().trim().replace(".0", "");
				if (!qdm.equals("")) {
					ids.add("'" + qdm + "'");
				}
			} else {
				List<String> dlist = new ArrayList<String>();
				String pid = mp.get("pid").toString().replace(".0", "");
				Map<String, Object> pMap = (Map<String, Object>) keyMap.get(pid);
				if (pMap == null)
					System.out.println("null:" + pid);
				String maxId = pMap.get("aa") == null ? "" : pMap.get("aa").toString();
				String recordid = pMap.get("recordid") == null ? "" : pMap.get("recordid").toString();
				if (!maxId.equals("")) {
					maxId = maxId.substring(0, maxId.length() - 4)
							+ StringUtils.leftPad((Integer.valueOf(maxId.substring(maxId.length() - 4)) + 1) + "", 4,
									"0");
				} else
					maxId = recordid + "0001";
				pMap.put("aa", maxId);
				dlist.add("'" + maxId + "'");
				dlist.add("'" + mp.get("区划代码").toString().replace(".0", "") + "'");
				dlist.add("'" + mp.get("名称").toString().replace(".0", "") + "'");
				dlist.add("'" + mp.get("pid").toString().replace(".0", "") + "'");
				dlist.add("'" + "1" + "'");
				dlist.add("'" + recordid + "'");//parentId
				dlist.add("'" + "0" + "'");//deltag
				dlist.add("'0'");//child
				flist.add("(" + StringUtils.join(dlist, ",") + ")");
				upList.add("update form__base_mechanismset_mechanisminfo set child='1' where recordid='" + recordid
						+ "'");
			}
		}
		sb.append(StringUtils.join(flist, ",\n"));
		System.out.println(sb.toString());
		System.out.println(StringUtils.join(upList, ";\n"));
		//System.out.println(StringUtils.join(ids, ","));
	}

	public static void mechan() throws Exception {
		//	String Math.random();

		if (true)
			return;
		List<String> ids = new ArrayList<String>();
		ids.add("0001");
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
		File f = new File("G:/项目/全国红会站点.xls");
		List<Map<String, Object>> dl = getDataList(f, 3);
		//System.out.println(dl);
		//String recordid = "0001";
		StringBuffer sb = new StringBuffer(
				"insert into form__base_mechanismset_mechanisminfo (recordid,mechanismnumber,mechanismname,station,ownstation_radio,parentId,deltag,child) values \n");
		List<String> flist = new ArrayList<String>();
		String sbbb = new String();
		for (Map<String, Object> mp : dl) {
			Iterator<String> it = mp.keySet().iterator();
			String sbt = "";
			String station = mp.get("station").toString().replace(".0", "");
			String parentId = "";
			if (station.endsWith("0000")) {
				parentId = "0001";
			}
			List<String> dlist = new ArrayList<String>();
			dlist.add("'" + mp.get("recordid").toString().replace(".0", "") + "'");
			dlist.add("'" + mp.get("mechanismnumber").toString().replace(".0", "") + "'");
			dlist.add("'" + mp.get("mechanismname").toString().replace(".0", "") + "'");
			dlist.add("'" + mp.get("station").toString().replace(".0", "") + "'");
			dlist.add("'" + "1" + "'");
			dlist.add("'" + mp.get("parentId").toString().replace(".0", "") + "'");//parentId
			dlist.add("'" + "0" + "'");//deltag
			dlist.add("'" + mp.get("child").toString().replace(".0", "") + "'");//child
			//sbbb += "\"" + mp.get("station").toString().replace(".0", "") + "\":\"hhzz\",\n";
			sbbb += "" + mp.get("station").toString().replace(".0", "") + ",";
			/*while (it.hasNext()) {
				String key = it.next();
				String val = mp.get(key).toString();
				if (key.equals("jznd") && val.endsWith(".0"))
					val = val.substring(0, val.length() - 2);
				if (key.equals("roadType")) {
					dlist.add("(select id from ss_dictionary where name='" + val + "')");
				} else if (key.equals("yhqx")) {
					if (StringUtils.isNotBlank(val)) {
						String[] rq = StringUtils.split(val, "~");
						dlist.add("'" + df1.format(df.parse(rq[0])) + "'");
						dlist.add("'" + df1.format(df.parse(rq[1])) + "'");
					} else {
						dlist.add("null");
						dlist.add("null");
					}
				} else {
					if (StringUtils.isNotBlank(val))
						dlist.add("'" + val + "'");
					else
						dlist.add("" + null + "");
				}

			}*/
			//	dlist.add("'enabled'");
			flist.add("(" + StringUtils.join(dlist, ",") + ")");
		}
		sb.append(StringUtils.join(flist, ",\n"));
		System.out.println(sbbb);

	}

	//name,address,qc,kd,zkj,ks,mj,sjhz,xszq,xz,lgys_id,jznd,jcrq	,sbjg,xbjg,bz

	public static void strQl() throws Exception {

		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
		File f = new File("G:/项目/内控系统/桥梁.xls");
		List<Map<String, Object>> dl = (getDataList(f, 4));
		//System.out.println(dl);
		StringBuffer sb = new StringBuffer(
				"insert into ss_bridge (id,name,address,qc,kd,zkj,ks,mj,sjhz,xszq,xz,lgys_id,jznd,jcrq	,sbjg,xbjg,bz,create_user_id,create_time,last_update_user_id,last_update_time) values \n");
		List<String> flist = new ArrayList<String>();
		for (Map<String, Object> mp : dl) {
			Iterator<String> it = mp.keySet().iterator();
			String sbt = "";
			List<String> dlist = new ArrayList<String>();
			dlist.add("'" + Identities.uuid2() + "'");
			while (it.hasNext()) {
				String key = it.next();
				String val = mp.get(key).toString();
				if (key.equals("jznd") && val.endsWith(".0"))
					val = val.substring(0, val.length() - 2);
				/*if (key.equals("roadType")) {
					dlist.add("(select id from ss_dictionary where name='" + val + "')");
				} else if (key.equals("yhqx")) {
					if (StringUtils.isNotBlank(val)) {
						String[] rq = StringUtils.split(val, "~");
						dlist.add("'" + df1.format(df.parse(rq[0])) + "'");
						dlist.add("'" + df1.format(df.parse(rq[1])) + "'");
					} else {
						dlist.add("null");
						dlist.add("null");
					}
				} else */{
					if (StringUtils.isNotBlank(val))
						dlist.add("'" + val + "'");
					else
						dlist.add("" + null + "");
				}

			}
			//	dlist.add("'enabled'");
			dlist.add("'1'");
			dlist.add("'2013-09-11'");
			dlist.add("'1'");
			dlist.add("'2013-09-11'");
			flist.add("(" + StringUtils.join(dlist, ",") + ")");
		}
		sb.append(StringUtils.join(flist, ",\n"));
		System.out.println(sb);

	}

	/**
	 * 道路
	 * */
	public static void strRoad() throws Exception {

		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
		File f = new File("G:/项目/内控系统/道路.xls");
		List<Map<String, Object>> dl = (getDataList(f, 4));
		StringBuffer sb = new StringBuffer(
				"insert into ss_road (id,road_type_id,name,qd,yhqxq,yhqxz,roadc,roadw,roadm,rxdc,lk,lmj,qls,jcjs,ssjs,csks,status,create_user_id,create_time,last_update_user_id,last_update_time) values \n");
		List<String> flist = new ArrayList<String>();
		for (Map<String, Object> mp : dl) {
			Iterator<String> it = mp.keySet().iterator();
			String sbt = "";
			List<String> dlist = new ArrayList<String>();
			dlist.add("'" + Identities.uuid2() + "'");
			while (it.hasNext()) {
				String key = it.next();
				String val = mp.get(key).toString();
				if (key.equals("roadType")) {
					dlist.add("(select id from ss_dictionary where name='" + val + "')");
				} else if (key.equals("yhqx")) {
					if (StringUtils.isNotBlank(val)) {
						String[] rq = StringUtils.split(val, "~");
						dlist.add("'" + df1.format(df.parse(rq[0])) + "'");
						dlist.add("'" + df1.format(df.parse(rq[1])) + "'");
					} else {
						dlist.add("null");
						dlist.add("null");
					}
				} else {
					if (StringUtils.isNotBlank(val))
						dlist.add("'" + val + "'");
					else
						dlist.add("" + null + "");
				}

			}
			dlist.add("'enabled'");
			dlist.add("'1'");
			dlist.add("'2013-09-11'");
			dlist.add("'1'");
			dlist.add("'2013-09-11'");
			flist.add("(" + StringUtils.join(dlist, ",") + ")");
		}
		sb.append(StringUtils.join(flist, ",\n"));
		System.out.println(sb);

	}

	/**
	 * 读取文件内容，从start行开始读取
	 * */
	public static List<Map<String, Object>> getDataList(File file, int start) throws Exception {
		if (file.exists()) {
			Map<String, Object> repeatMap = new HashMap<String, Object>();
			List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();
			POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(file));
			HSSFWorkbook wb = new HSSFWorkbook(fs);//建立新HSSFWorkbook对象  
			HSSFSheet sheet = wb.getSheetAt(0);
			HSSFRow row = sheet.getRow(0);
			HSSFRow row1 = sheet.getRow(1);
			// 标题总列数
			int colNum = row.getPhysicalNumberOfCells();
			String[] col = new String[colNum];
			String[] title = new String[colNum];
			for (int i = 0; i < colNum; i++) {
				//title[i] = getStringCellValue(row.getCell((short) i));
				col[i] = getCellFormatValue(row.getCell(i));
				title[i] = getCellFormatValue(row1.getCell(i));
			}
			//int colNum = row.getPhysicalNumberOfCells();
			int rowNum = sheet.getLastRowNum();
			// 正文内容应该从第三行开始,第一行为表头的标题
			for (int i = (start - 1); i <= rowNum; i++) {
				Map<String, Object> content = new LinkedHashMap<String, Object>();
				row = sheet.getRow(i);
				int j = 0;
				while (j < colNum) {
					// 每个单元格的数据内容用"-"分割开，以后需要时用String类的replace()方法还原数据
					// 也可以将每个单元格的数据设置到一个javabean的属性中，此时需要新建一个javabean
					// str += getStringCellValue(row.getCell((short) j)).trim() +
					// "-";
					String str = getCellFormatValue(row.getCell(j)).trim();
					if (title[j].startsWith("*") && str.equals(""))
						throw new ImportException("第" + (i + 1) + "行的[" + title[j] + "]不能为空!");

					content.put(col[j], str);
					j++;
				}
				/*if (repeatArray != null) {

					String repStr = "";
					for (String rd : repeatArray) {
						repStr += content.get(rd).toString() + "_";
					}//判断数据重复
					if (repeatMap.get(repStr) != null) {
						throw new ImportException("第" + (i + 1) + "行和第" + repeatMap.get(repStr) + "行数据重复!");
					} else
						repeatMap.put(repStr, i + 1);
				}*/
				dataList.add(content);
				//str = "";
			}
			//显示释放内存
			System.gc();

			return dataList;
		}

		return null;
	}

	/**
	 *save=true(直接保存) geneId=true: Identities.uuid2()生成唯一Id,
	 *exmap扩展需要的属性{create_time:date}
	 * */
	public static List<Map<String, Object>> getExcelDataList(HttpServletRequest request) throws Exception {
		return getExcelDataList(request, false, false, new HashMap<String, Object>());
	}

	/**
	 *save=true(直接保存) geneId=true: Identities.uuid2()生成唯一Id,
	 *exmap扩展需要的属性{create_time:date}
	 * */
	public static List<Map<String, Object>> getExcelDataList(HttpServletRequest request, boolean save, boolean geneId,
			Map<String, Object> exmap) throws Exception {
		String module = request.getParameter("import_module");
		String fname = request.getParameter("import_fname");
		String[] repeatArray = null;
		File file = new File(PropertiesUtils.getFileDir() + File.separator + module + File.separator + fname);

		if (file.exists()) {
			Map<String, Object> repeatMap = new HashMap<String, Object>();
			List<Map<String, Object>> dataList = new ArrayList<Map<String, Object>>();
			POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(file));
			HSSFWorkbook wb = new HSSFWorkbook(fs);//建立新HSSFWorkbook对象  
			HSSFSheet sheet = wb.getSheetAt(0);
			HSSFRow row = sheet.getRow(0);
			HSSFRow row1 = sheet.getRow(1);
			HSSFRow row2 = sheet.getRow(2);
			HSSFRow row3 = sheet.getRow(3);
			String tableName = getCellFormatValue(row.getCell(0));
			String repeatStr = getCellFormatValue(row.getCell(1));
			if (StringUtils.isNotBlank(repeatStr)) {
				repeatArray = StringUtils.split(repeatStr, ",");
			}
			Map<String, Map<String, Object>> sqlMap = new HashMap<String, Map<String, Object>>();
			Map<String, String> colMap = new HashMap<String, String>();
			Map<String, Object> reqMap = new HashMap<String, Object>();
			// 标题总列数
			int colNum = row3.getPhysicalNumberOfCells();
			int rowNum = sheet.getLastRowNum();
			System.out.println("开始导入..[" + rowNum + "]行，[" + colNum + "]列");
			for (int i = 0; i < colNum; i++) {//加载id值
				String sql = getCellFormatValue(row1.getCell(i));
				if (StringUtils.isNotBlank(sql)) {
					List<Map<String, Object>> sqlList = JdbcUtil.executeQuery(sql, new HashMap<String, Object>());
					Map<String, Object> valMap = new HashMap<String, Object>();
					for (Map<String, Object> m : sqlList)
						valMap.put(m.get("name").toString(), m.get("id"));
					sqlMap.put(i + "", valMap);
				}
				//加载列字段
				String col = getCellFormatValue(row2.getCell(i));
				if (StringUtils.isNotBlank(col)) {
					colMap.put(i + "", col);
				}
				//加载必填字段
				String title = getCellFormatValue(row3.getCell(i));
				if (StringUtils.isNotBlank(col) && StringUtils.isNotBlank(title) && title.startsWith("*")) {
					reqMap.put(i + "", title);
				}
			}

			/*	String[] col = new String[colNum];
				String[] title = new String[colNum];
				for (int i = 0; i < colNum; i++) {
					//title[i] = getStringCellValue(row.getCell((short) i));
					col[i] = getCellFormatValue(row.getCell(i));
					title[i] = getCellFormatValue(row1.getCell(i));
				}*/
			//int colNum = row.getPhysicalNumberOfCells();
			// 正文内容应该从第三行开始,第一行为表头的标题
			System.out.println("开始分析数据..." + reqMap);
			for (int i = 4; i <= rowNum; i++) {
				Map<String, Object> content = new LinkedHashMap<String, Object>();
				row = sheet.getRow(i);
				int j = 0;
				while (j < colNum) {
					String col = colMap.get(j + "");
					if (StringUtils.isBlank(col)) {
						j++;
						continue;
					}
					String val = getCellFormatValue(row.getCell(j)).trim();
					//System.out.println(reqMap.get(j) + ":" + val);
					if (reqMap.get(j + "") != null && StringUtils.isBlank(val)) {
						throw new ImportException("第" + (i + 1) + "行的[" + reqMap.get(j + "") + "]不能为空!");
					}
					// 每个单元格的数据内容用"-"分割开，以后需要时用String类的replace()方法还原数据
					// 也可以将每个单元格的数据设置到一个javabean的属性中，此时需要新建一个javabean
					// str += getStringCellValue(row.getCell((short) j)).trim() +
					// "-";
					//String str = getCellFormatValue(row.getCell(j)).trim();
					if (sqlMap.get(j + "") != null) {//数据库需要存入id的excel里是汉字的
						Map<String, Object> valmap = sqlMap.get(j + "");
						Object nval = valmap.get(val);
						if (nval == null) {
							throw new ImportException("第" + (i + 1) + "行的[" + val + "]不存在!");
						} else
							val = nval.toString();
					}
					content.put(col, val);
					if (exmap != null && !exmap.isEmpty())
						content.putAll(exmap);
					j++;
				}
				if (repeatArray != null) {

					String repStr = "";
					for (String rd : repeatArray) {
						String[] colArray = StringUtils.split(rd, "+");
						for (String col : colArray)
							repStr += content.get(col).toString() + "_";
					}//判断数据重复
					if (repeatMap.get(repStr) != null) {
						throw new ImportException("第" + (i + 1) + "行数据[" + repStr + "]重复!");
					} else
						repeatMap.put(repStr, i + 1);
				}

				dataList.add(content);
				//System.out.println("第" + (i + 1) + "]行读取结束");
				//str = "";
			}
			//显示释放内存

			if (save) {//直接保存数据
				String sql = "insert into " + tableName + "(";
				List<String> cols = new ArrayList<String>();
				List<String> vals = new ArrayList<String>();
				if (geneId) {
					cols.add("id");
					vals.add(":id");
					for (Map<String, Object> m : dataList) {
						m.put("id", Identities.uuid2());
					}
				}
				Iterator<String> it = colMap.values().iterator();
				while (it.hasNext()) {
					String key = it.next();
					cols.add(key);
					vals.add(":" + key);
				}
				if (exmap != null && !exmap.isEmpty()) {
					Iterator<String> it1 = exmap.keySet().iterator();
					while (it1.hasNext()) {
						String key = it1.next();
						cols.add(key);
						vals.add(":" + key);
					}

				}
				JdbcUtil.updateBatch(sql + StringUtils.join(cols, ",") + ") values (" + StringUtils.join(vals, ",")
						+ ")", dataList);
			}
			if (file != null)
				file.delete();
			return dataList;
		}
		return null;
	}

	/**
	    * 根据HSSFCell类型设置数据
	    * @param cell
	    * @return
	    */
	private static String getCellFormatValue(HSSFCell cell) {
		String cellvalue = "";
		if (cell != null) {
			// 判断当前Cell的Type
			switch (cell.getCellType()) {
			// 如果当前Cell的Type为NUMERIC
			case HSSFCell.CELL_TYPE_NUMERIC:
			case HSSFCell.CELL_TYPE_FORMULA: {
				// 判断当前的cell是否为Date
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					// 如果是Date类型则，转化为Data格式

					//方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
					//cellvalue = cell.getDateCellValue().toLocaleString();

					//方法2：这样子的data格式是不带带时分秒的：2011-10-12
					Date date = cell.getDateCellValue();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					cellvalue = sdf.format(date);

				}
				// 如果是纯数字
				else {
					// 取得当前Cell的数值
					cellvalue = String.valueOf(cell.getNumericCellValue());
				}
				break;
			}
				// 如果当前Cell的Type为STRIN
			case HSSFCell.CELL_TYPE_STRING:
				// 取得当前的Cell字符串
				cellvalue = cell.getRichStringCellValue().getString();
				break;
			// 默认的Cell值
			default:
				cellvalue = " ";
			}
		} else {
			cellvalue = "";
		}
		if (cellvalue.endsWith(".0"))
			cellvalue = cellvalue.substring(0, cellvalue.length() - 2);

		return StringUtils.trimToEmpty(cellvalue);
		//return cellvalue;

	}

}
