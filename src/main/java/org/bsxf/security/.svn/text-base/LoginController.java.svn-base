package org.bsxf.security;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.bsxf.common.entity.account.User;
import org.bsxf.common.web.SessionKey;
import org.bsxf.utils.DateUtil;
import org.bsxf.utils.EhcacheManager;
import org.bsxf.utils.JdbcUtil;
import org.bsxf.web.LtSecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，

 * 真正登录的POST请求由Filter完成,
 * 
 * @author calvin
 */
@Controller
public class LoginController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		//SessionKey.getSubject().
		if (LtSecurityUtils.getShiroUser() != null)
			return "redirect:/";
		return "security/login";
	}

	/***
	 *登录处理页面，根据系统配置，判断用户是否要锁定
	 * */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM)
	String userName, Model model, HttpServletRequest request) {

		Integer count = (Integer) request.getSession().getAttribute(SessionKey.LOGIN_FAILED_COUNT);
		if (count == null)
			count = Integer.valueOf(0);
		count++;
		int fc = EhcacheManager.getStationConfig().getFailCount() == null ? 0 : EhcacheManager.getStationConfig()
				.getFailCount();
		if (fc > 0 && fc <= count) {//失败次数达到限定次数
			System.out.println("用户锁定");
			JdbcUtil.executeSql("update ss_user set is_lock=1,lock_time='" + DateUtil.formatDateToString(new Date())
					+ "' where login_name='" + userName + "'");
			model.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME,
					"org.apache.shiro.authc.DisabledAccountException");
		}
		request.getSession().setAttribute(SessionKey.LOGIN_FAILED_COUNT, count);

		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
		return "security/login";
	}

	@RequestMapping(value = "/showPerson", method = RequestMethod.GET)
	public String showPerson(Model model) {
		List<User> uList = EhcacheManager.getLogin();
		model.addAttribute("uList", uList);
		return "security/showPerson";
	}

}
