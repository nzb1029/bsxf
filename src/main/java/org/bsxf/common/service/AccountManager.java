package org.bsxf.common.service;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.bsxf.common.dao.MenuDao;
import org.bsxf.common.dao.RoleDao;
import org.bsxf.common.dao.UserDao;
import org.bsxf.common.entity.account.Menu;
import org.bsxf.common.entity.account.Role;
import org.bsxf.common.entity.account.User;
import org.bsxf.common.repository.akl.BlockMybatisDao;
import org.bsxf.common.web.UserLogUtil;
import org.bsxf.security.ShiroDbRealm;
import org.bsxf.utils.EncryptUtils;
import org.bsxf.utils.Page;
import org.bsxf.web.LtSecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Collections3;
import org.springside.utils.Identities;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;


/**
 * @类名称：AccountManager   
 * @类描述：用户管理类   
 * @作者：Administrator   
 * @创建时间：2014-10-23 上午09:19:50   
 * @修改人：Administrator   
 * @修改时间：2014-10-23 上午09:19:50   
 * @修改备注：   
 * @版权：
 * @version
*/
//Spring Service Bean的标识.
@Component
@Transactional
public class AccountManager {
	private static Logger logger = LoggerFactory.getLogger(AccountManager.class);
	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private MenuDao menuDao;
	
	@Autowired
	private BlockMybatisDao blockDao;


	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Transactional(readOnly = true)
	public List<Map<String, Object>> getUserLog(String id) {
		return userDao.getUserLog(id);
	}
	
	@Transactional(readOnly = true)
	public User findUserByLoginNameOrEmailOrMobile(String loginName) {
		try {
			User u = userDao.findUserByLoginNameOrEmailOrMobile(loginName);
			if (u != null){
				u.setRoleList(userDao.getUserRole(u.getId()));
				u.setBlockList(blockDao.getUserBlock(u.getId()));
			}
			return u;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * @方法名: findUserByLoginName
	 * @描述: 根据登录名查找用户
	 * @参数 @param loginName
	 * @参数 @return
	 * @返回类型 User    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public User findUserByLoginName(String loginName) {
		try {
			User u = userDao.findUserByLoginName(loginName);
			if (u != null)
				u.setRoleList(userDao.getUserRole(u.getId()));
			return u;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@Transactional(readOnly = true)
	public User findUserByMobile(String phoneNo) {
		try {
			User u = userDao.findUserByMobile(phoneNo);
			 
			return u;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@Transactional(readOnly = true)
	public User findUserByEmail(String email) {
		try {
			User u = userDao.findUserByEmail(email);
			 
			return u;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@Transactional(readOnly = true)
	public User findUserByCarno(String cardNo) {
		try {
			User u = userDao.findUserByCarno(cardNo);
			return u;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * @方法名: search
	 * @描述: 根据查询字符串查找用户
	 * @参数 @param q
	 * @参数 @param limit
	 * @参数 @return
	 * @返回类型 List<User>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public List<User> search(String q, String limit) {

		List<User> us = userDao.search(q, limit);

		return us;
	}
	
	@Transactional(readOnly = true)
	public List<User> getUserByType(String type) {
		List<User> us = userDao.getUserByType(type);
		
		return us;
	}

	/**
	 * @方法名: findUserIdsByLoginNames
	 * @描述: 根据用户的loginName组合查询id组合
	 * @参数 @param loginNames
	 * @参数 @return 1,2,3
	 * @返回类型 String    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public String findUserIdsByLoginNames(String loginNames) {

		String userIds = userDao.findUserIdsByLoginNames(loginNames);

		return userIds;
	}

	/**
	 * @方法名: getUserByIds
	 * @描述: 更加id集合查询用户
	 * @参数 @param loginNames
	 * @参数 @return
	 * @返回类型 List<User>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public List<User> getUserByIds(String loginNames) {
		List<User> userIds = userDao.getUserByIds(loginNames);

		return userIds;
	}

	/**
	 * @方法名: findUserIdsByLoginAndNames
	 * @描述: 根据用户的loginName(name)组合查询id组合
	 * @参数 @param loginNames
	 * @参数 @return 1,2
	 * @返回类型 String    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public String findUserIdsByLoginAndNames(String loginNames) {

		String userIds = userDao.findUserIdsByLoginAndNames(loginNames);

		return userIds;
	}

	/**
	 * @方法名: findUserByPage
	 * @描述: 分页查询用户信息
	 * @参数 @param page
	 * @参数 @return
	 * @返回类型 Page    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public Page findUserByPage(Page page) {

		return userDao.findUserByPage(page);
	}

	/**
	 * @方法名: batchSaveOrUpdateUser
	 * @描述: 批量更新用户信息
	 * @参数 @param us
	 * @返回类型 void    
	 * @throws
	 */
	public void batchSaveOrUpdateUser(List<User> us) {
		for (User u : us)
			saveOrUpdateUser(u);
	}

	/**
	 * @方法名: saveOrUpdateUser
	 * @描述: 用户新增和更新方法，根据对象ID是否存在判断是新增还是更新
	 * @参数 @param user
	 * @返回类型 void    
	 * @throws
	 */
	public void saveOrUpdateUser(User user) {
		//System.out.println(user.getDepartId());
		if (StringUtils.isBlank(user.getPlainPassword()))
			user.setPlainPassword("123456");
		if (StringUtils.isNotBlank(user.getPlainPassword())) {
			//HashPassword hashPassword = shiroRealm.encrypt(user.getPlainPassword());
			//user.setPassword(hashPassword.password);
			//换成md5加密
			String password = EncryptUtils.md5(user.getPlainPassword());
			user.setPassword(password);
		}
		if (StringUtils.isNotBlank(user.getId())) {
			userDao.updateUser(user);
			UserLogUtil.addUserLog("修改了用户信息[" + user.getLoginName() + "]");
			//更新员工关联人员的部门

		} else {
			user.setId(Identities.uuid2());
			user.setCreateTime(new Date());
			userDao.saveUser(user);
			UserLogUtil.addUserLog("新增了用户信息[" + user.getLoginName() + "]");
		}
//		if (user.getLeader() == null || StringUtils.isBlank(user.getLeader().getId())) {//为选择上级，更新成部门负责人
//			userDao.setUserLeaderByDepartment(user);
//		}
		//System.out.println(user.get);
		//同步上下级关系值
//		Map<String, Object> pars = new HashMap<String, Object>();
//		pars.put("nullleader", "1");
//		List<User> users = userDao.getAllUser(pars);
		//递归生成director
//		addDirector(users, "");
	}

	/**
	 * @方法名: addDirector
	 * @描述: 用户添加上级
	 * @参数 @param users
	 * @参数 @param pDirector
	 * @返回类型 void    
	 * @throws
	 */
//	public void addDirector(List<User> users, String pDirector) {
//		int start = 1;
//		for (User u : users) {
//			u.setDirector(pDirector + StringUtils.leftPad(start + "", 4, "0"));
//			//System.out.println(u.getDirector());
//			userDao.updateUserDirector(u);
//			start++;
//			Map<String, Object> pars = new HashMap<String, Object>();
//			pars.put("leader", u.getId());
//			List<User> subusers = userDao.getAllUser(pars);
//			addDirector(subusers, u.getDirector());
//		}
//	}

	/**
	 * @方法名: getUserLogPage
	 * @描述: 分页查询用户登录日志列表信息
	 * @参数 @param page
	 * @参数 @return
	 * @返回类型 Page    
	 * @throws
	 */
	public Page getUserLogPage(Page page) {
		int totalCount = userDao.getUserLogListCount(page);
		page.setTotalCount(totalCount);
		List result = userDao.getUserLogList(page);
		page.setResult(result);
		return page;
	}

	/**
	* 更新工作流用户以及角色
	* @param user          用户对象{@link User}
	* @param roleIds       用户拥有的角色ID集合
	* @param activitiUser  Activiti引擎的用户对象，{@link org.activiti.engine.identity.User}
	*/
	/*	private void updateActivitiData(User user, org.activiti.engine.identity.User activitiUser) {

			String userId = user.getLoginName();

			// 更新用户主体信息
			activitiUser.setFirstName(user.getLoginName());
			activitiUser.setLastName(user.getName());
			activitiUser.setPassword(StringUtils.EMPTY);
			activitiUser.setEmail(user.getEmail());
			identityService.saveUser(activitiUser);

				// 删除用户的membership
				List<Group> activitiGroups = identityService.createGroupQuery().groupMember(userId).list();
				for (Group group : activitiGroups) {
					//logger.debug("delete group from activit: {}", ToStringBuilder.reflectionToString(group));
					identityService.deleteMembership(userId, group.getId());
				}

				// 添加membership
				for (Role role : user.getRoleList()) {
					// Role role = roleManager.getEntity(roleId);
					logger.debug("add role to activit: {}", role);
					identityService.createMembership(userId, role.getId());
				}
		}*/

	/**
	 * @方法名: getUserRole
	 * @描述: 根据用户ID获取工作流用户以及角色
	 * @参数 @param userId
	 * @参数 @return user 用户对象{@link User}
	 * @参数 @return roleIds 用户拥有的角色ID集合
	 * @返回类型 List<Role>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public List<Role> getUserRole(String userId) {

		return userDao.getUserRole(userId);
	}

	/**
	 * @方法名: getUserMenu
	 * @描述: 得到当前用户所拥有的菜单列表
	 * @参数 @return
	 * @返回类型 List<Menu>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public List<Menu> getUserMenu() {
		String loginName = SecurityUtils.getSubject().getPrincipal().toString();
		User user = findUserByLoginName(loginName);

		Map<String, Object> map = Maps.newHashMap();
		map.put("noOne", "yes");
		if (!user.getId().equals("1")) {//不是超级管理员
			map.put("userId", user.getId());
		}
		List<Menu> menus = userDao.getAllMenu(map);
		return menus;

	}

	/**
	 * @方法名: getUserMenuII
	 * @描述: 最多三级菜单
	 * @参数 @return
	 * @返回类型 List<Menu>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public List<Menu> getUserMenuII() {
		Map pars = new LinkedHashMap();
		if (!LtSecurityUtils.getLoginUser().getId().equals("1"))
			pars.put("uid", LtSecurityUtils.getLoginUser().getId());
		pars.put("pid", "1");
		List<Menu> pmenus = userDao.getUserMenusByParent(pars);
		for (Menu p : pmenus) {
			pars.put("pid", p.getId());
			p.setMenuList(userDao.getUserMenusByParent(pars));
			for (Menu pp : p.getMenuList()) {
				pars.put("pid", pp.getId());
				pp.setMenuList(userDao.getUserMenusByParent(pars));
			}
		}
		return pmenus;

	}

	/**
	 * @方法名: getAllMenuWithoutRoot
	 * @描述: 得到所有菜单，排除根菜单
	 * @参数 @return
	 * @返回类型 List<Menu>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public List<Menu> getAllMenuWithoutRoot() {
		Map<String, Object> map = Maps.newHashMap();
		map.put("noOne", "yes");
		List<Menu> menus = userDao.getAllMenu(map);
		return menus;

	}

	/**
	 * @方法名: getAllUser
	 * @描述: 得到所有用户，pars是过滤参数
	 * @参数 @param pars
	 * @参数 @return
	 * @返回类型 List<User>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public List<User> getAllUser(Map<String, Object> pars) {
		return userDao.getAllUser(pars);
	}

	/**
	 * @方法名: getAllRoleUser
	 * @描述: 得到所有角色用户，pars是过滤参数
	 * @参数 @param pars
	 * @参数 @return
	 * @返回类型 List<Map>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public List<Map> getAllRoleUser(Map<String, Object> pars) {
		return userDao.getAllRoleUser(pars);
	}

	/**
	 * @方法名: getTreeUser
	 * @描述: 得到用户数，pars是过滤参数
	 * @参数 @param pars
	 * @参数 @return
	 * @返回类型 List<Map>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public List<Map> getTreeUser(Map<String, Object> pars) {
		return userDao.getTreeUser(pars);
	}

	/**
	 * @方法名: deleteUser
	 * @描述: 数据库删除用户，根据用户ID删除
	 * @参数 @param id
	 * @返回类型 void    
	 * @throws
	 */
	public void deleteUser(String id) {
		userDao.deleteUser(id);
	}

	/**
	 * @方法名: disabledUser
	 * @描述: 根据用户ID禁用用户
	 * @参数 @param id
	 * @返回类型 void    
	 * @throws
	 */
	public void disabledUser(String id) {
		userDao.disabledUser(id);
		UserLogUtil.addUserLog("删除了用户信息[" + id + "]");
	}

	/**
	 * @方法名: getUser
	 * @描述: 根据用户ID得到用户
	 * @参数 @param id
	 * @参数 @return
	 * @返回类型 User    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public User getUser(String id) {
		return userDao.getUser(id);
	}

	/**
	 * @方法名: getRole
	 * @描述: 根据角色ID得到角色
	 * @参数 @param id
	 * @参数 @return
	 * @返回类型 Role    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public Role getRole(String id) {
		return roleDao.getRole(id);
	}
	
	@Transactional(readOnly = true)
	public Role getRoleByAlias(String alias) {
		return roleDao.getRoleByAlias(alias);
	}
	/**
	 * @方法名: getRoleByIds
	 * @描述: 根据角色Id集合获取角色
	 * @参数 @param ids
	 * @参数 @return
	 * @返回类型 List<Role>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public List<Role> getRoleByIds(List<String> ids) {
		return roleDao.getRoleByIds(ids);
	}

	/**
	 * @方法名: findRoleByPage
	 * @描述: 角色分页查询
	 * @参数 @param page
	 * @参数 @return
	 * @返回类型 Page    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public Page findRoleByPage(Page page) {

		return roleDao.findRoleByPage(page);
	}

	/**
	 * @方法名: saveOrUpdateRole
	 * @描述: 保存或更新角色，根据Id是否存在判断保存和更新
	 * @参数 @param role
	 * @返回类型 void    
	 * @throws
	 */
	public void saveOrUpdateRole(Role role) {

		if (StringUtils.isNotBlank(role.getId())) {
			roleDao.updateRole(role);
			UserLogUtil.addUserLog("修改了角色信息[" + role.getRoleName() + "]");
		} else {
			role.setId(Identities.uuid2());
			roleDao.saveRole(role);
			UserLogUtil.addUserLog("新增了角色信息[" + role.getRoleName() + "]");
		}
	}

	/**
	 * @方法名: deleteRole
	 * @描述: 删除角色
	 * @参数 @param ids
	 * @返回类型 void    
	 * @throws
	 */
	public void deleteRole(List<String> ids) {
		roleDao.deleteRoleMenuByRoleId(ids);
		roleDao.deleteRole(ids);
	}

	/**
	 * @方法名: getRoleUsers
	 * @描述: 得到角色下的用户
	 * @参数 @param roleId
	 * @参数 @return
	 * @返回类型 List<User>    
	 * @throws
	 */
	public List<User> getRoleUsers(String roleId) {
		return roleDao.getRoleUsers(roleId);
	}


	/**
	 * @方法名: saveUserRole
	 * @描述: 保存用户所分配的角色
	 * @参数 @param urList
	 * @返回类型 void    
	 * @throws
	 */
	public void saveUserRole(List<Map> urList) {
		roleDao.saveUserRole(urList);

	}

	/**
	 * @方法名: saveDistrib
	 * @描述: 保存用户角色关系
	 * @参数 @param roleId
	 * @参数 @param urList
	 * @返回类型 void    
	 * @throws
	 */
	public void saveDistrib(String roleId, List<Map> urList) {
		roleDao.deleteUserRoleByRoleId(roleId);
		if (urList.size() > 0)
			roleDao.saveUserRole(urList);
	}

	/**
	 * @方法名: saveDistribUser
	 * @描述: 保存用户角色关系
	 * @参数 @param userId
	 * @参数 @param urList
	 * @返回类型 void    
	 * @throws
	 */
	public void saveDistribUser(String userId, List<Map> urList) {
		roleDao.deleteUserRoleByUserId(userId);
		if (urList.size() > 0)
			roleDao.saveUserRole(urList);
	}

	/**
	 * @方法名: saveDistribMenu
	 * @描述: 保存角色分配的权限
	 * @参数 @param roleId
	 * @参数 @param urList
	 * @参数 @param permission
	 * @返回类型 void    
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	public void saveDistribMenu(String roleId, List<Map> urList, String permission) {
		roleDao.deleteRoleMenuByRoleId(Collections3.extractToList(roleId.split(",")));
		if (urList.size() > 0)
			roleDao.saveRoleMenu(urList);
		roleDao.updateRoleAuth(roleId, permission);
	}

	/**
	 * @方法名: getMenu
	 * @描述: 根据菜单Id得到菜单
	 * @参数 @param id
	 * @参数 @return
	 * @返回类型 Menu    
	 * @throws
	 */
	public Menu getMenu(String id) {
		return menuDao.getMenu(id);
	}

	/**
	 * @方法名: findMenuByPage
	 * @描述: 得到菜单列表
	 * @参数 @param page
	 * @参数 @return
	 * @返回类型 Page    
	 * @throws
	 */
	public Page findMenuByPage(Page page) {
		return menuDao.findMenuByPage(page);
	}

	/**
	 * @方法名: deleteMenu
	 * @描述: 删除菜单
	 * @参数 @param id
	 * @返回类型 void    
	 * @throws
	 */
	public void deleteMenu(String id) {
		List ids = Lists.newArrayList();
		ids.add(id);
		menuDao.deleteMenu(ids);

	}

	/**
	 * @方法名: deleteMenu
	 * @描述: 根据菜单id集合删除菜单
	 * @参数 @param ids
	 * @返回类型 void    
	 * @throws
	 */
	public void deleteMenu(List ids) {
		menuDao.deleteMenu(ids);

	}

	/**
	 * @方法名: disabledMenu
	 * @描述: 根据菜单id禁用菜单
	 * @参数 @param ids
	 * @返回类型 void    
	 * @throws
	 */
	public void disabledMenu(List ids) {
		menuDao.disabledMenu(ids);
		//同时删除其子菜单
		menuDao.disabledSubMenu(ids);
		UserLogUtil.addUserLog("删除了菜单信息[" + ids + "]");
	}

	/**
	 * @方法名: saveOrUpdateMenu
	 * @描述: 保存或更新菜单，根据菜单id是否存在判断
	 * @参数 @param menu
	 * @返回类型 void    
	 * @throws
	 */
	public void saveOrUpdateMenu(Menu menu) {

		if (StringUtils.isNotBlank(menu.getId())) {
			menuDao.updateMenu(menu);
			UserLogUtil.addUserLog("修改了菜单信息[" + menu.getMenuName() + "]");
		} else {
			menu.setId(Identities.uuid2());
			menuDao.saveMenu(menu);
			UserLogUtil.addUserLog("新增了菜单[" + menu.getMenuName() + "]");
		}
	}

	/**
	 * @方法名: saveOrUpdateMenuII
	 * @描述: 保存或更新菜单，根据菜单id是否存在判断
	 * @参数 @param menu
	 * @返回类型 void    
	 * @throws
	 */
	public void saveOrUpdateMenuII(Menu menu) {

		if (StringUtils.isNotBlank(menu.getId())) {
			menuDao.updateMenu(menu);
			UserLogUtil.addUserLog("修改了菜单信息[" + menu.getMenuName() + "]");
		} else {
			menu.setId(Identities.uuid2());
			menu.setSortNo(menuDao.getMenuSortNoByParentId(menu.getParentId()));
			menuDao.saveMenu(menu);
			UserLogUtil.addUserLog("新增了菜单[" + menu.getMenuName() + "]");
		}
	}

	/**
	 * @方法名: getMenuLikeId
	 * @描述: 获取菜单等级likeId的值
	 * @参数 @param parentId
	 * @参数 @param length
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	public String getMenuLikeId(String parentId, Integer length) {
		String maxId = menuDao.getMenuLikeId(parentId);
		if (StringUtils.isBlank(maxId)) {
			return StringUtils.leftPad("1", length, "0");
		} else {
			String nextId = maxId.substring(maxId.length() - length);
			String pLikeId = maxId.substring(0, maxId.length() - length);
			nextId = (Integer.valueOf(nextId) + 1) + "";//去掉0且加1
			return pLikeId + StringUtils.leftPad(nextId, length, "0");
		}
	}

	/**
	 * @方法名: getRoleMenus
	 * @描述: 得到指定角色下的所有菜单
	 * @参数 @param roleId
	 * @参数 @return
	 * @返回类型 List<Menu>    
	 * @throws
	 */
	public List<Menu> getRoleMenus(String roleId) {
		return roleDao.getRoleMenus(roleId);
	}

	/**
	 * @方法名: getMenuTree
	 * @描述: 得到菜单树（角色下的）
	 * @参数 @param roleId
	 * @参数 @return
	 * @返回类型 List<Map>    
	 * @throws
	 */
	public List<Map> getMenuTree(String roleId) {

		return menuDao.getMenuTree(StringUtils.split(roleId, ","));
	}

	/**
	 * @方法名: getMulMenuTree
	 * @描述: 多级菜单树数据加载
	 * @参数 @return
	 * @返回类型 List<Map>    
	 * @throws
	 */
	public List<Map> getMulMenuTree() {

		return menuDao.getMulMenuTree();
	}

	/**
	 * @方法名: getAllMenuSelf
	 * @描述: 所有菜单加载
	 * @参数 @return
	 * @返回类型 List<Menu>    
	 * @throws
	 */
	public List<Menu> getAllMenuSelf() {
		return menuDao.getAllMenuSelf();
	}

	/**
	 * @方法名: getTreeUserByJg
	 * @描述: 得到机构下的用户树
	 * @参数 @param pars
	 * @参数 @return
	 * @返回类型 List<Map>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public List<Map> getTreeUserByJg(Map<String, Object> pars) {
		return userDao.getTreeUserByJg(pars);
	}

	/**
	 * @方法名: getTreeUserByRegion
	 * @描述: 得到区划下的用户
	 * @参数 @param pars
	 * @参数 @return
	 * @返回类型 List<Map>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public List<Map> getTreeUserByRegion(Map<String, Object> pars) {
		return userDao.getTreeUserByRegion(pars);
	}

}
