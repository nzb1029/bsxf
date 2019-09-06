package org.bsxf.common.web.account;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Level;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.bsxf.common.entity.account.Role;
import org.bsxf.common.entity.account.User;
import org.bsxf.common.service.AccountManager;
import org.bsxf.utils.JdbcUtil;
import org.bsxf.utils.JqGirds;
import org.bsxf.utils.Page;
import org.bsxf.web.LtSecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.mapper.BeanMapper;
import org.springside.utils.Collections3;

/**
 * @类名称：UserController   
 * @类描述：用户业务控制类   
 * @作者：Administrator   
 * @创建时间：2014-10-24 上午09:38:20   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 上午09:38:20   
 * @修改备注：   
 * @版权：
 * @version
*/
@Controller
@RequestMapping(value = "/account/user")
public class UserController {
	@Autowired
	private AccountManager accountManager;
	/**
	 * @方法名: search
	 * @描述: 用户树查询，上线10条数据
	 * @参数 @param model
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 List<User>    
	 * @throws
	 */
	@RequestMapping(value = { "search" })
	@ResponseBody
	public List<User> search(Model model, HttpServletRequest request) {
		String q = request.getParameter("q");
		String limit = request.getParameter("limit");
		List<User> userList = accountManager.search(q, limit);

		return userList;
	}

	/**
	 * @方法名: list
	 * @描述: 用户列表方法，返回jsp页面
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "list" })
	public String list(Model model) {
		
		return "account/userList";
	}

	/**
	 * @方法名: selectUser
	 * @描述: 用户选择树地址
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "selectUser" })
	public String selectUser(Model model) {

		return "account/selectUser";
	}
	
	/*选择用户*/
	@RequestMapping(value = { "select" })
	public String select(Model model) {
		return "account/user-select";
	}
	@RequestMapping(value = { "jqgridselect" })
	@ResponseBody
	public Map jqgridselect(HttpServletRequest request) {
		Page<User> page = JqGirds.parmsToPage(request);
		
		System.out.println(page.getFilters());
		page = accountManager.findUserByPage(page);
		return JqGirds.renderJson(page);
	}

	
	/**
	 * @方法名: selectDepart
	 * @描述: 部门选择地址
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "selectDepart" })
	public String selectDepart(Model model) {

		return "account/selectDepart";
	}

	/**
	 * @方法名: userInfo
	 * @描述: 当前用户信息方法
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "userinfo" })
	public String userInfo(Model model) {
		model.addAttribute("user", accountManager.getUser(LtSecurityUtils.getLoginUser().getId()));
		return "account/userinfo";
	}

	/**
	 * @方法名: modifPasswd
	 * @描述: 密码修改方法
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "modifpasswd" })
	public String modifPasswd(Model model) {
		//model.addAttribute("user", accountManager.getUser(LtSecurityUtils.getLoginUser().getId()));
		return "account/modifpasswd";
	}

	/**
	 * @方法名: savemodify
	 * @描述: 密码修改保存方法
	 * @参数 @param model
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "savemodify" })
	@ResponseBody
	public String savemodify(Model model, HttpServletRequest request) {
		String passwd = request.getParameter("passwd");
		User suser = accountManager.getUser(LtSecurityUtils.getLoginUser().getId());
		suser.setPlainPassword(passwd);
		accountManager.saveOrUpdateUser(suser);
		return "true";
	}

	/**
	 * @方法名: saveInfo
	 * @描述: 用户信息修改保存
	 * @参数 @param user
	 * @参数 @param redirectAttributes
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "saveinfo" })
	public String saveInfo(User user, RedirectAttributes redirectAttributes) {
		if (StringUtils.isNotBlank(user.getId())) {
			Map<String, Object> parsMap = new HashMap<String, Object>();
			parsMap.put("name", user.getName());
			parsMap.put("email", user.getEmail());
			parsMap.put("id", user.getId());
			JdbcUtil.executeUpdate("update ss_user set name=:name ,email=:email where id=:id", parsMap);
			redirectAttributes.addFlashAttribute("message", "修改用户" + user.getLoginName() + "成功");
		}
		return "redirect:/account/user/userinfo";
	}


	/**
	 * @方法名: jqgrid
	 * @描述: 用户列表数据加载方法
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 Map    
	 * @throws
	 */
	@RequestMapping(value = { "jqgrid" })
	@ResponseBody
	public Map jqgrid(HttpServletRequest request) {
		Page page = JqGirds.parmsToPage(request);
		if (StringUtils.isBlank(page.getOrder())) {
			page.setOrder("u.create_time", "desc");
		}
		page = accountManager.findUserByPage(page);
		return JqGirds.renderJson(page);
	}

	/**
	 * @方法名: logjqgrid
	 * @描述: 登录日志数据加载方法
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 Map    
	 * @throws
	 */
	@RequestMapping(value = { "logjqgrid" })
	@ResponseBody
	public Map logjqgrid(HttpServletRequest request) {
		Page page = JqGirds.parmsToPage(request);
		if (page.getFilters().get("log_type") != null) {
			if (page.getFilters().get("log_type").equals("登录成功"))
				page.getFilters().put("log_type", "0");
			if (page.getFilters().get("log_type").equals("登录"))
				page.getFilters().put("log_type", "0");
			if (page.getFilters().get("log_type").equals("录"))
				page.getFilters().put("log_type", "0");
			if (page.getFilters().get("log_type").equals("登"))
				page.getFilters().put("log_type", "0");
			//page.setOrder("u.create_time", "desc");
		}
		page = accountManager.getUserLogPage(page);
		return JqGirds.renderJson(page);
	}

	/**
	 * @方法名: loglist
	 * @描述: 日志列表页
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "loglist" })
	public String loglist(HttpServletRequest request) {

		return "account/log";
	}

	/**
	 * @方法名: create
	 * @描述: 用户修改方法
	 * @参数 @param id
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequiresPermissions("user:edit")
	@RequestMapping(value = { "create/{id}" })
	public String create(@PathVariable("id")
	String id, Model model) {
		User user = new User();
		if (!id.equals("0")) {
			user = accountManager.getUser(id);
		}
		model.addAttribute(user);
		return "account/userForm";
	}
	
//	@RequestMapping(value = "changeBlock/{blockId}" )
//	@ResponseBody
//	public String changeBlock(@PathVariable("blockId") String blockId) {
//		if(StringUtils.isNotEmpty(blockId)){
//			LtSecurityUtils.getShiroUser().setBlockId(blockId);
//		}
//		return "0";
//	}

	/**
	 * @方法名: save
	 * @描述: 用户添加方法
	 * @参数 @param user
	 * @参数 @param redirectAttributes
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "save" })
	public String save(User user, RedirectAttributes redirectAttributes) {
		if (StringUtils.isNotBlank(user.getId())) {
			User suser = accountManager.getUser(user.getId());
			String password = suser.getPassword();
			BeanMapper.copy(user, suser);
			suser.setPassword(password);//还原之前的密码
			accountManager.saveOrUpdateUser(suser);
			redirectAttributes.addFlashAttribute("message", "修改用户" + user.getLoginName() + "成功");
		} else {
			accountManager.saveOrUpdateUser(user);
			redirectAttributes.addFlashAttribute("message", "创建用户" + user.getLoginName() + "成功");
		}

		return "redirect:/account/user/list";
	}

	/**
	 * @方法名: checkPasswd
	 * @描述: 密码验证
	 * @参数 @param oldplainPassword
	 * @参数 @return
	 * @返回类型 Boolean    
	 * @throws
	 */
	@RequestMapping(value = "checkPasswd")
	@ResponseBody
	public Boolean checkPasswd(@RequestParam("oldplainPassword")
	String oldplainPassword) {
		boolean ckflg = LtSecurityUtils.checkPasswd(oldplainPassword);

		return ckflg;

	}

	/**
	 * @方法名: checkLoginName
	 * @描述: 登录名验证
	 * @参数 @param oldLoginName
	 * @参数 @param loginName
	 * @参数 @return
	 * @返回类型 Boolean    
	 * @throws
	 */
	@RequestMapping(value = "checkLoginName")
	@ResponseBody
	public Boolean checkLoginName(@RequestParam("oldLoginName")
	String oldLoginName, @RequestParam("loginName")
	String loginName) {
		if (loginName.equals(oldLoginName)) {
			return true;
		} else if (accountManager.findUserByLoginName(loginName) == null) {
			return true;
		}

		return false;
	}
	@RequestMapping(value = "checkMobile")
	@ResponseBody
	public Boolean checkMobile(@RequestParam("oldPhoneNo")
	String oldPhoneNo, @RequestParam("phoneNo")
	String phoneNo) {
		if (phoneNo.equals(oldPhoneNo)) {
			return true;
		} else if (accountManager.findUserByMobile(phoneNo) == null) {
			return true;
		}

		return false;
	}
	@RequestMapping(value = "checkEmail")
	@ResponseBody
	public Boolean checkEmail(@RequestParam("oldEmail")
	String oldEmail, @RequestParam("email")
	String email) {
		if (email.equals(oldEmail)) {
			return true;
		} else if (accountManager.findUserByEmail(email) == null) {
			return true;
		}

		return false;
	}
	@RequestMapping(value = "checkCarno")
	@ResponseBody
	public Boolean checkCarno(@RequestParam("oldCardNo")
	String oldCardNo, @RequestParam("cardNo")
	String cardNo) {
		if (cardNo.equals(oldCardNo)) {
			return true;
		} else if (accountManager.findUserByCarno(cardNo) == null) {
			return true;
		}

		return false;
	}
	/**
	 * @方法名: delete
	 * @描述: 用户修改
	 * @参数 @param id
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequiresPermissions("user:edit")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id")
	String id) {
		if (id.equals("1") || id.startsWith("1,") || id.endsWith(",1") || id.indexOf(",1,") > 0) {
			throw new RuntimeException("超级管理员不能删除");
		}
		for (String sid : id.split(",")) {
			List<Role> urlist = accountManager.getUserRole(sid);
			if (urlist.size() > 0) {
				return "用户关联有角色【" + Collections3.extractToString(urlist, "name", ",") + "】不能删除";
			}
			
		}
		
		
		accountManager.disabledUser(id);
		return "true";
	}

	
	/**
	 * @方法名: distribRole
	 * @描述: 分配角色
	 * @参数 @param userId
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = "distribRole/{id}")
	public String distribRole(@PathVariable("id")
	String userId, Model model) {
		User user = accountManager.getUser(userId);
		List<Role> roles = accountManager.getUserRole(userId);
		String roleNames = "", roleIds = "";
		for (Role u : roles) {
			roleNames += u.getRoleName() + ",";
			roleIds += u.getId() + ",";
		}
		if (StringUtils.isNotBlank(roleNames)) {
			roleNames = roleNames.substring(0, roleNames.length() - 1);
			roleIds = roleIds.substring(0, roleIds.length() - 1);
		}
		Map<String, Object> pars = new HashMap<String, Object>();
		pars.put("user", user);
		pars.put("roleNames", roleNames);
		pars.put("roleIds", roleIds);
		model.addAllAttributes(pars);
		return "account/distribRole";
	}

	/**
	 * @方法名: saveDistrib
	 * @描述: 保存角色分配
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = "saveDistrib")
	@ResponseBody
	public String saveDistrib(HttpServletRequest request) {
		String roleIds = request.getParameter("roleIds");
		//String olduserIds = request.getParameter("olduserIds");
		String userId = request.getParameter("userId");
		List<Map> urList = new ArrayList<Map>();
		if (StringUtils.isNotBlank(roleIds)) {
			String[] uids = roleIds.split(",");
			for (String uid : uids) {
				Map uMap = new HashMap();
				uMap.put("userId", userId);
				uMap.put("roleId", uid);
				urList.add(uMap);
			}
		}
		accountManager.saveDistribUser(userId, urList);

		return "true";
	}

	/**
	 * @方法名: logger
	 * @描述: 设置日志级别页面
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = "logger")
	public String logger(HttpServletRequest request) {

		return "account/logger";
	}

	/**
	 * @方法名: loggerGet
	 * @描述: 日志级别获取
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = "loggerGet")
	@ResponseBody
	public String loggerGet(HttpServletRequest request) {
		String logName = request.getParameter("logName");
		//Level level = Level.toLevel("debug");
		org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(logName);
		//logger.setLevel(level);
		return logger.getEffectiveLevel().toString();
	}

	/**
	 * @方法名: loggerSet
	 * @描述: 日志级别设置保存
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = "loggerSet")
	@ResponseBody
	public String loggerSet(HttpServletRequest request) {
		String logLevel = request.getParameter("logLevel");
		String logName = request.getParameter("logName");
		//System.out.println("==============logLevel:" + logLevel);
		//System.out.println("==============logName:" + logName);
		Level level = Level.toLevel(logLevel);
		org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(logName);
		logger.setLevel(level);
		return logger.getEffectiveLevel().toString();
	}

	/**
	 * @方法名: viewUserP
	 * @描述: 用户权限查看
	 * @参数 @param userId
	 * @参数 @param request
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = "viewUserP/{id}")
	public String viewUserP(@PathVariable("id")
	String userId, HttpServletRequest request, Model model) {
		User u = accountManager.getUser(userId);
		List<Role> roles = accountManager.getUserRole(userId);
		model.addAttribute("user", u);
		model.addAttribute("roles", roles);
		//	System.out.println(Collections3.extractToString(collection, propertyName, separator)tractToList(roles, "id"));
		model.addAttribute("roleIds", Collections3.extractToString(roles, "id", ","));
		return "account/viewUserP";
	}

}
