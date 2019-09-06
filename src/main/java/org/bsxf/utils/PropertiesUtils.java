/**
 * Copyright (c) 2005-2010 springside.org.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * 
 * $Id: PropertiesUtils.java 1211 2010-09-10 16:20:45Z calvinxiu $
 */
package org.bsxf.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.account.Permission;
import org.springside.utils.PropertiesLoader;

/**
 * Properties Util函数.
 * 
 */
public class PropertiesUtils {

	private static PropertiesLoader propertiesLoader;

	private static boolean loaded = false;
	static {
		if (!loaded) {
			reload();

		}
	}

	public static void reload() {
		try {
			propertiesLoader = new PropertiesLoader("application.properties");
			loaded = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String get(String key) {
		return propertiesLoader.getProperty(key, "");
	}

	/**
	 * 角色可添加的方法级的权限
	 * */
	public static List<Permission> getPermissions() {
		String permission = get("permissions");
		List<Permission> permList = new ArrayList<Permission>();
		if (StringUtils.isBlank(permission))
			return permList;
		else {
			String[] ps = StringUtils.split(permission, ";");
			for (String p : ps) {
				Permission per = new Permission(p.split("-")[0], p.split("-")[1]);
				permList.add(per);
			}
		}
		return permList;
	}

	/**
	 * 小部件
	 * */
	public static List<Permission> getWidgets() {
		String widgets = get("widgets");
		List<Permission> widList = new ArrayList<Permission>();
		if (StringUtils.isBlank(widgets))
			return widList;
		else {
			String[] ps = StringUtils.split(widgets, ";");
			for (String p : ps) {
				Permission per = new Permission(p.split(":")[0], p.split(":")[1]);
				widList.add(per);
			}
		}
		return widList;
	}

	/**
	 * 取得系统文件路径，默认返回windows的d://app
	 * */
	public static String getFileDir() {
		String fileDir = get("file_dir");
		if (StringUtils.isBlank(fileDir))
			fileDir = EhcacheManager.getStationConfig().getEname();
		File f = new File(fileDir);
		if (!f.exists())
			f.mkdir();
		return fileDir;
	}

	/**
	 * 取得临时文件目录
	 * */
	public static String getTempPath() {
		String path = PropertiesUtils.getFileDir() + File.separator + "temp" + File.separator;
		File f = new File(path);
		if (!f.exists())
			f.mkdir();
		return path;
	}

	/**
	 * 获得rest full webservice的基础url
	 * */
	public static String getRsBaseUrl() {
		String url = getBaseUrl();// get("rs_base_url");
		if (url.endsWith("/"))
			return url + "rs";
		else
			return url + "/rs";

	}

	public static String getBaseUrl() {
		String url = get("rs_base_url");
		if (StringUtils.isBlank(url))
			return "http://localhost:8088/akl-min";
		else {
			return url;
		}
	}
}
