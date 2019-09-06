package org.bsxf.common.web.account;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.account.Role;
import org.bsxf.common.entity.account.User;
import org.bsxf.common.service.AccountManager;
import org.bsxf.common.service.PermissionManager;
import org.bsxf.utils.JqGirds;
import org.bsxf.utils.Page;
import org.bsxf.web.LtSecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.mapper.BeanMapper;
import org.springside.mapper.JsonMapper;
import org.springside.utils.Collections3;

/**
 * @类名称：RoleController   
 * @类描述：角色业务控制类   
 * @作者：Administrator   
 * @创建时间：2014-10-24 上午09:15:30   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 上午09:15:30   
 * @修改备注：   
 * @版权：
 * @version
*/
@Controller
@RequestMapping(value = "/account/role")
public class RoleController {
	@Autowired
	private AccountManager accountManager;
	@Autowired
	private PermissionManager perManager;

	/**
	 * @方法名: list
	 * @描述: 角色列表页面控制方法
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "list" })
	public String list(Model model) {

		return "account/roleList";
	}

	/**
	 * @方法名: jqgrid
	 * @描述: 角色表格数据加载控制方法
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 Map    
	 * @throws
	 */
	@RequestMapping(value = { "jqgrid" })
	@ResponseBody
	public Map jqgrid(HttpServletRequest request) {
		Page page = JqGirds.parmsToPage(request);
		page = accountManager.findRoleByPage(page);
		return JqGirds.renderJson(page);
	}

	/**
	 * @方法名: loadauth
	 * @描述: 权限加载数据方法
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 Map    
	 * @throws
	 */
	@RequestMapping(value = { "loadauth" })
	@ResponseBody
	public Map loadauth(HttpServletRequest request) {
		//String roleid = request.getParameter("roleid");
		//accountManager.getRole(roleid);
		Page page = JqGirds.parmsToPage(request);
		page = perManager.findPermissionByPage(page);

		//page = accountManager.findRoleByPage(page);
		return JqGirds.renderJson(page);
	}

	/**
	 * @方法名: getRole
	 * @描述: 根据id加载角色信息
	 * @参数 @param id
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 Role    
	 * @throws
	 */
	@RequestMapping(value = { "getRole/{id}" })
	@ResponseBody
	public Role getRole(@PathVariable("id")
	String id, HttpServletRequest request) {
		Role role = accountManager.getRole(id);
		return role;
	}

	/**
	 * @方法名: create
	 * @描述: 角色新增和修改加载数据，地址后面跟id时是修改，否则是新增
	 * @参数 @param id
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "create/{id}" })
	public String create(@PathVariable("id")
	String id, Model model) {
		Role role = new Role();
		if (!id.equals("0")) {
			role = accountManager.getRole(id);
		}
		model.addAttribute(role);
		
		return "account/roleForm";
	}


	/**
	 * @方法名: save
	 * @描述: 角色保存方法，对象数据自动由spring绑定
	 * @参数 @param role
	 * @参数 @param redirectAttributes
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "save" })
	public String save(Role role, RedirectAttributes redirectAttributes) {
		if (StringUtils.isNotBlank(role.getId())) {
			Role srole = accountManager.getRole(role.getId());
			BeanMapper.copy(role, srole);
			accountManager.saveOrUpdateRole(srole);
			redirectAttributes.addFlashAttribute("message", "修改用户" + srole.getRoleName() + "成功");
		} else {
			accountManager.saveOrUpdateRole(role);
			redirectAttributes.addFlashAttribute("message", "创建角色" + role.getRoleName() + "成功");
		}
		
		return "redirect:/account/role/list";
	}

	/**
	 * @方法名: delete
	 * @描述: 角色删除方法，会判断角色下是否有用户，有责不允许删除
	 * @参数 @param id
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id")
	String id) {
		for (String sid : id.split(",")) {
			List<User> urlist = accountManager.getRoleUsers(sid);
			if (urlist.size() > 0) {
				return "角色关联有用户【" + Collections3.extractToString(urlist, "name", ",") + "】不能删除";
			}
		}
		accountManager.deleteRole(Collections3.extractToList(id.split(",")));
		return "true";
	}

	/**
	 * @方法名: distribUser
	 * @描述: 根据角色id，分配用户，此时加载已有的用户数据
	 * @参数 @param roleId
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = "distribUser/{id}")
	public String distribUser(@PathVariable("id")
	String roleId, Model model) {
		Role role = accountManager.getRole(roleId);
		List<User> users = accountManager.getRoleUsers(roleId);

		List<User> usersII = new ArrayList<User>();
//		for (User u : users) {
//			if (StringUtils.isNotBlank(LtSecurityUtils.getLoginUser().getJgId())) {
//				if (u.getJgId() != null && u.getJgId().equals(LtSecurityUtils.getLoginUser().getJgId()))
//					usersII.add(u);
//			} else if (StringUtils.isNotBlank(LtSecurityUtils.getLoginUser().getRegionId())) {
//				if (u.getRegionId() != null && u.getRegionId().equals(LtSecurityUtils.getLoginUser().getRegionId()))
//					usersII.add(u);
//			}
//		}
//		if (StringUtils.isNotBlank(LtSecurityUtils.getLoginUser().getJgId())
//				|| StringUtils.isNotBlank(LtSecurityUtils.getLoginUser().getRegionId()))
//			users = usersII;
		String userNames = "", userIds = "";
		for (User u : users) {
			userNames += u.getLoginName() + "[" + u.getName() + "],";
			userIds += u.getId() + ",";
		}
		if (StringUtils.isNotBlank(userNames)) {
			userNames = userNames.substring(0, userNames.length() - 1);
			userIds = userIds.substring(0, userIds.length() - 1);
		}
		Map<String, Object> pars = new HashMap<String, Object>();
		pars.put("role", role);
		pars.put("userNames", userNames);
		pars.put("userIds", userIds);
		model.addAllAttributes(pars);
		return "account/distribUser";
	}

	/**
	 * @方法名: saveDistrib
	 * @描述: 保存用户角色关系
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = "saveDistrib")
	@ResponseBody
	public String saveDistrib(HttpServletRequest request) {
		String userIds = request.getParameter("userIds");
		String roleId = request.getParameter("roleId");
		List<Map> urList = new ArrayList<Map>();
		if (StringUtils.isNotBlank(userIds)) {
			String[] uids = userIds.split(",");
			for (String uid : uids) {
				Map uMap = new HashMap();
				uMap.put("userId", uid);
				uMap.put("roleId", roleId);
				urList.add(uMap);
			}
		}
		accountManager.saveDistrib(roleId, urList);

		return "true";
	}

	/**
	 * @方法名: distribMenu
	 * @描述: 给角色分配菜单方法
	 * @参数 @param roleId
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = "distribMenu/{id}")
	public String distribMenu(@PathVariable("id")
	String roleId, Model model) {
		Role role = accountManager.getRole(roleId);
		model.addAttribute("role", role);
		return "account/distribMenu";
	}

	/**
	 * @方法名: menuTree
	 * @描述: 角色下的菜单树
	 * @参数 @param roleId
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = "menuTree/{roleId}")
	@ResponseBody
	public String menuTree(@PathVariable("roleId")
	String roleId, Model model,HttpServletRequest request) {
		String disabledTree = request.getParameter("disabledTree");
		//Role role = accountManager.getRole(roleId);
		List<Map> menus = accountManager.getMenuTree(roleId);
		for (Map m : menus) {
			if (m.get("id").toString().equals("1"))
				m.put("open", "true");
			if("1".equals(disabledTree))
				m.put("chkDisabled", true);
		}
		return JsonMapper.nonDefaultMapper().toJson(menus);
	}

	/**
	 * @方法名: saveDistribMenu
	 * @描述: 保存角色菜单
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = "saveDistribMenu")
	@ResponseBody
	public String saveDistribMenu(HttpServletRequest request) {
		String menuIds = request.getParameter("menuIds");
		String roleId = request.getParameter("roleId");
		String permission = request.getParameter("permission");

		List<Map> urList = new ArrayList<Map>();
		String[] uids = menuIds.split(",");
		for (String uid : uids) {
			if (StringUtils.isNotBlank(uid)) {
				Map uMap = new HashMap();
				uMap.put("menuId", uid);
				uMap.put("roleId", roleId);
				urList.add(uMap);
			}
		}
		accountManager.saveDistribMenu(roleId, urList, permission);

		return "true";
	}
}
