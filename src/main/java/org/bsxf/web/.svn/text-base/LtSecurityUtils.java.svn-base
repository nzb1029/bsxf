package org.bsxf.web;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.bsxf.common.entity.account.User;
import org.bsxf.security.ShiroDbRealm.ShiroUser;
import org.bsxf.utils.EncryptUtils;
import org.springside.mapper.BeanMapper;

/**
 * 安全认证util类
 */
public class LtSecurityUtils {
	/*	*//***
																										 * 获取当前登录用户信息
																										 * */
	/*
		public static User getLoginUser() {
			Subject subject = SecurityUtils.getSubject();//.getPrincipals()
			if (subject.getPrincipal() == null)
				return null;
			if (subject.getSession(false) == null)
				return null;
			User user = (User) subject.getSession(false).getAttribute(EcContent.USER_IN_SESSION);
			if (user == null) {
				String loginName = subject.getPrincipal().toString();
				AccountManager accountManager = SpringContextHolder.getBean("accountManager");
				user = accountManager.findUserByLoginName(loginName);
				subject.getSession().setAttribute(EcContent.USER_IN_SESSION, user);
			}
			return user;
		}
	*/
	/***
	 * 获取当前登录用户信息,只提供基本信息:id,name,loginName方便对象关联User时使用，
	 * 需要其他信息的可从下面的方法取
	 * */
	public static User getLoginUser() {
		ShiroUser su = getShiroUser();
		if (su == null)
			return null;
		User u = BeanMapper.map(su, User.class);
		/*new User();
		u.setLoginName(su.getLoginName());
		u.setName(su.getName());
		u.setId(su.getId());*/
		return u;
	}

	public static ShiroUser getShiroUser() {
		Subject subject = SecurityUtils.getSubject();//.getPrincipals()
		if (subject.getPrincipal() == null)
			return null;
		return (ShiroUser) subject.getPrincipal();
	}

	public static boolean checkPasswd(String npasswd) {
		ShiroUser su = getShiroUser();
		String password = EncryptUtils.md5(npasswd);
		if (su.getPassword().equals(password))
			return true;
		return false;
	}

	public static void main(String[] args) {
		checkPasswd("admin");

	}
}
