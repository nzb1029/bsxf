package org.bsxf.common.web;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.bsxf.security.ShiroDbRealm.ShiroUser;
import org.bsxf.utils.DateUtil;
import org.bsxf.web.LtSecurityUtils;
import org.springside.queue.QueuesHolder;
import org.springside.utils.Identities;

public class UserLogUtil {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	/**
	 * ss_user_log中的log_type
	 * 0:登录
	 * 1：登出
	 * 2：
	 * */
	public static void addUserLog(String logType) {
		ShiroUser su = LtSecurityUtils.getShiroUser();
		Map<String, String> logMap = new HashMap<String, String>();
		logMap.put("id", Identities.uuid2());
		logMap.put("user_id", su.getId());
		logMap.put("ip", su.getIp());
		logMap.put("session_id", SecurityUtils.getSubject().getSession().getId().toString());
		logMap.put("log_type", logType);
		logMap.put("log_time", DateUtil.formatDateToString(new Date()));

		//存储登录人信息，保持在线人列表
		try {
			QueuesHolder.getQueue("loginWriter").put(logMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * ss_user_log中的log_type
	 * 0:登录
	 * 1：登出
	 * 2：
	 * */
	public static void addAdminLog(String logType, HttpServletRequest request) {
		//	ShiroUser su = LtSecurityUtils.getShiroUser();
		Map<String, String> logMap = new HashMap<String, String>();
		logMap.put("id", Identities.uuid2());
		logMap.put("user_id", "1");
		logMap.put("ip", request.getRemoteHost());
		logMap.put("session_id", request.getSession().getId().toString());
		logMap.put("log_type", logType);
		logMap.put("log_time", DateUtil.formatDateToString(new Date()));

		//存储登录人信息，保持在线人列表
		try {
			QueuesHolder.getQueue("loginWriter").put(logMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
