package org.bsxf.utils;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.web.LtSecurityUtils;
import org.springside.web.Servlets;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JqGirds {
	private static ObjectMapper mapper = new ObjectMapper();
	public static String prefix = "filter_";

	@SuppressWarnings( { "unchecked", "rawtypes" })
	public static Page parmsToPage(HttpServletRequest request) {
		Page page = new Page();
		String pageNum = request.getParameter("page");
		String rows = request.getParameter("rows");
		String sidx = request.getParameter("sidx");
		String sord = request.getParameter("sord");
		if (StringUtils.isBlank(pageNum))
			pageNum = "1";
		if (StringUtils.isBlank(rows))
			rows = "10";
		page.setPageNo(Integer.valueOf(pageNum));
		page.setPageSize(Integer.valueOf(rows));
		if (StringUtils.isNotBlank(sidx)) {
			page.setOrder(sord);
			page.setOrderBy(sidx);
		}
		//过滤字段
		Map filters = Servlets.getParametersStartingWith(request, prefix);
		page.getFilters().putAll(filters);
		return page;
	}
	
	@SuppressWarnings( { "unchecked", "rawtypes" })
	public static Page parmsToPageAddPower(HttpServletRequest request) {
		Page page = new Page();
		String pageNum = request.getParameter("page");
		String rows = request.getParameter("rows");
		String sidx = request.getParameter("sidx");
		String sord = request.getParameter("sord");
		if (StringUtils.isBlank(pageNum))
			pageNum = "1";
		if (StringUtils.isBlank(rows))
			rows = "10";
		page.setPageNo(Integer.valueOf(pageNum));
		page.setPageSize(Integer.valueOf(rows));
		if (StringUtils.isNotBlank(sidx)) {
			page.setOrder(sord);
			page.setOrderBy(sidx);
		}
		//过滤字段
		Map filters = Servlets.getParametersStartingWith(request, prefix);
		page.getFilters().putAll(filters);
		return page;
	}

	@SuppressWarnings("unchecked")
	public static Map renderJson(Page page) {
		Map<String, Object> jqMap = new HashMap<String, Object>();
		jqMap.put("page", page.getPageNo());
		jqMap.put("total", page.getTotalPages());
		jqMap.put("records", page.getTotalCount());
		jqMap.put("rows", page.getResult());
		try {
			return jqMap;
		} catch (Exception e) {
			throw new RuntimeException("json转换异常", e);

		}
	}

	public static String renderSubGridJson(Page page) {
		Map<String, Object> jqMap = new HashMap<String, Object>();
		jqMap.put("rows", page.getResult());
		try {
			return mapper.writeValueAsString(jqMap);
		} catch (Exception e) {
			throw new RuntimeException("json转换异常", e);

		}
	}
}
