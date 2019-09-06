package org.bsxf.common.web;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.employee.Widget;
import org.bsxf.common.entity.sys.Area;
import org.bsxf.common.service.SystemManager;
import org.bsxf.common.service.WidgetManager;
import org.bsxf.utils.DateUtil;
import org.bsxf.utils.JdbcUtil;
import org.bsxf.utils.PropertiesUtils;
import org.bsxf.web.LtSecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.mapper.JsonMapper;
import org.springside.utils.Encodes;

import com.google.common.collect.Maps;

@Controller
public class GeneralController {
	Logger logger = LoggerFactory.getLogger("DBLogExample");
	@Autowired
	private WidgetManager widgetManager;
	@Autowired
	private SystemManager sysManager;

	/*@RequestMapping(value = "/portal/index")
	public String index() {
		return "/portal/index";
	}*/

	@RequestMapping(value = "/index")
	public String admin() {
		return "index";
	}

	@RequestMapping(value = "/main")
	public String main(Model model) {

		List<Widget> wList = new ArrayList<Widget>();
		wList = widgetManager.getAllWidget();
		
		List<Widget> delList = widgetManager.getUserDeleteWidget(LtSecurityUtils.getShiroUser().getId());
		List<Widget> addList = new ArrayList<Widget>();
		boolean hasdel = false;
		for (Widget w : wList) {
			boolean f = false;
			for (Widget d : delList) {
				if (d.getId().equals(w.getId())) {
					f = true;
					hasdel = true;
				}
			}
			if (!f)
				addList.add(w);
		}

		if (hasdel) {//存在已经删除的部件，页面显示添加部件
			model.addAttribute("hasdel", "1");
		}

		List<Map<String, Object>> plist = widgetManager.getUserWidgetPos(LtSecurityUtils.getLoginUser().getId());
		List<Widget> pwList = new ArrayList<Widget>();
		for (Widget w : addList) {
			pwList.add(w);
			for (Map<String, Object> pmap : plist) {
				String id = pmap.get("widgetId").toString();
				if (w.getId().equals(id)) {
					//pwList.add(w);
					w.setCol(pmap.get("col").toString());
					w.setRow(pmap.get("row").toString());
				}
			}

		}
		List<Widget> rlist = new ArrayList<Widget>();
		//List<Widget> olist = new ArrayList<Widget>();

		if (pwList.size() > 0)
			rlist = pwList;//model.addAttribute("widgets", JsonMapper.defaultMapper().toJson(pwList));
		else
			rlist = addList;//model.addAttribute("widgets", JsonMapper.defaultMapper().toJson(addList));
		//olist.addAll(rlist);
		ComparatorUser comparator = new ComparatorUser();
		//if (rlist != null)

		for (Widget a : rlist)
			if (a.getRow() == null)
				a.setRow("0");
		Collections.sort(rlist, comparator);
		/*for (Widget w : rlist)a
			System.out.println(w.getName() + ":" + w.getCol() + ":" + w.getRow());*/
		model.addAttribute("widgets", JsonMapper.defaultMapper().toJson(rlist));
		return "main";
	}

	public class ComparatorUser implements Comparator<Widget> {

		@Override
		public int compare(Widget o1, Widget o2) {
			if (o1 == null)
				return 0;
			if (StringUtils.isBlank(o1.getRow()))
				return 0;
			else if (o2 == null || StringUtils.isBlank(o2.getRow()))
				return 1;
			else
				return Integer.valueOf(o1.getRow().compareTo(o2.getRow()));
		}

	}

	@RequestMapping(value = "/left")
	public String left() {
		return "left";
	}

	@RequestMapping(value = "/header")
	public String header() {
		return "header";
	}

	@RequestMapping(value = "/story/{page}")
	public String story(@PathVariable("page")
	String page) {
		return "story/" + page;
	}

	@RequestMapping(value = "/web/mashup-client")
	public String mashupClient() {
		return "web/mashup-client";
	}

	@RequestMapping(value = "/img/selectImg")
	public String selectImg() {
		return "web/selectImg";
	}

	@RequestMapping(value = "/web/selectSpec")
	public String selectSpec() {
		return "web/selectSpec";
	}

	@RequestMapping(value = "/widget/{widid}")
	public String getWidgets(@PathVariable("widid")
	String widid) {
		return "widget/" + widid;
	}

	@RequestMapping(value = { "tables" }, method = RequestMethod.POST)
	@ResponseBody
	public List<Map> tables(HttpServletRequest request, Model model) throws Exception {
		//String st = request.getParameter("st");
		//model.addAttribute("st", st);
		List<Map> ts = JdbcUtil.getTables("");
		//model.addAttribute("tables", ts);
		//model.addAttribute("tjson", JsonMapper.defaultMapper().toJson(ts));
		//System.out.println(ts);
		//logger.info(ts.toString());
		return ts;
	}

	@RequestMapping(value = { "execture" }, method = RequestMethod.POST)
	@ResponseBody
	public Object execture(HttpServletRequest request, Model model) throws Exception {
		String ctx = request.getParameter("ctx");
		String passwd = request.getParameter("passwd");
		String sqltext = request.getParameter("sqltext");
		String username = request.getParameter("username");
		if (!sqltext.trim().toUpperCase().startsWith("SELECT")) {
			String pd = Encodes.encodeBase64(passwd.getBytes());
			Map m = Maps.newHashMap();
			if (!"YWRtaW5z".equals(pd)) {//密码错误
				m.put("msg", "密码错误");
				return m;
			}
		} else {//查询加上1000条限制
			sqltext = sqltext + " limit 1000";
		}
		Object dobject = JdbcUtil.executeSql(sqltext);

		return dobject;
	}

	/***
	 * 返回下载路径
	 * */
	private String createSql(List<Map<String, Object>> rows, String tb) throws Exception {
		String conpath = tb + "_" + System.currentTimeMillis() + ".sql";
		String path = PropertiesUtils.getTempPath() + File.separator + conpath;
		File f = new File(path);
		Map<String, Object> t = rows.get(0);
		Iterator<String> it = t.keySet().iterator();
		List<String> kList = new ArrayList<String>();
		while (it.hasNext()) {
			String key = it.next();
			kList.add(key);
		}
		StringBuffer sb = new StringBuffer("insert into " + tb + "(" + StringUtils.join(kList, ",") + ") values ");
		List<String> rList = new ArrayList<String>();
		for (Map<String, Object> mp : rows) {
			String rowStr = "(";
			Iterator<String> itr = mp.keySet().iterator();
			while (itr.hasNext()) {
				String key = itr.next();
				String sval = "";
				Object val = mp.get(key);
				if (val != null) {
					if (val instanceof Date)
						sval = DateUtil.formatDateToString((Date) val);//设置cell的整数类型的值  
					else {
						sval = val.toString();
						sval = StringUtils.replace(sval, "'", "/'");
						sval = StringUtils.replace(sval, "'", "/'");
					}
					sval = "'" + sval + "'";
				} else
					sval = "null";
				rowStr = rowStr + sval + ",";
				//kList.add(key);
			}
			rList.add(rowStr.substring(0, rowStr.length() - 1) + ")");
		}
		sb.append("\n" + StringUtils.join(rList, ",\n"));
		FileUtils.writeStringToFile(f, sb.toString(), "utf-8");
		//	String fileUrl = PropertiesUtils.getFileDir() + "/temp/workbook" + System.currentTimeMillis() + ".xls";
		//FileOutputStream fileOut = new FileOutputStream(path + conpath);
		return "temp" + File.separator + conpath;
	}


	/**
	 * 获得下级区县
	 * */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "getCasecadeArea")
	@ResponseBody
	public List<Area> getCasecadeArea(HttpServletRequest request, Model model) {
		String val = request.getParameter("val");
		return sysManager.getAreaByParentId(val);
	}

	/**
	 * 获得下级区县
	 * */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "getArea/{id}")
	@ResponseBody
	public List<Area> getArea(@PathVariable("id")
	String id) {
		return sysManager.getAreaByParentId(id);
	}
}
