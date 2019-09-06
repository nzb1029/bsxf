package org.bsxf.security;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.shiro.UnavailableSecurityManagerException;
import org.bsxf.common.entity.account.User;
import org.bsxf.utils.DateUtil;
import org.bsxf.utils.EhcacheManager;
import org.bsxf.web.LtSecurityUtils;
import org.springside.queue.QueuesHolder;
import org.springside.utils.Identities;

public class SessionListener implements HttpSessionListener, HttpSessionAttributeListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {

		User u = null;
		try {
			u = LtSecurityUtils.getLoginUser();
		} catch (UnavailableSecurityManagerException e) {
			//session超时注销不管了
		}
		if (u != null) {
			//存储登录时间
			Map<String, String> logMap = new HashMap<String, String>();
			logMap.put("id", Identities.uuid2());
			logMap.put("user_id", u.getId());
			logMap.put("ip", "");
			logMap.put("session_id", se.getSession().getId().toString());
			logMap.put("log_type", "1");
			logMap.put("log_time", DateUtil.formatDateToString(new Date()));

			//存储登录人信息，保持在线人列表
			try {
				QueuesHolder.getQueue("loginWriter").put(logMap);
				//System.out.println(QueuesHolder.getQueueLength("loginWriter"));
				EhcacheManager.removeLogin(u);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		//String name = se.getName();
		//System.out.println(name + "被创建" + se.getSession().getAttribute(name));
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		/*
		String name = se.getName();
		if (name.equals("org.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEY")) {
			//SimplePrincipalCollection s=	(SimplePrincipalCollection) se.getValue();
			System.out.println(name + "被销毁" + se.getValue() + "," + se.getSource());
		}
		*/
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub

	}

}
