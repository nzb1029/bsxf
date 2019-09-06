package org.bsxf.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bsxf.common.entity.account.Menu;
import org.bsxf.common.entity.account.Role;
import org.bsxf.common.entity.account.User;
import org.bsxf.utils.Page;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

@Component
public class RoleDao extends SqlSessionDaoSupport {
	public Role getRole(String id) {
		return getSqlSession().selectOne("Account.getRole", id);
	}

	public Role getRoleByAlias(String alias) {
		return getSqlSession().selectOne("Account.getRoleByAlias", alias);
	}

	public List<Role> getRoleByIds(List<String> ids) {
		return getSqlSession().selectList("Account.getRoleByIds", ids);
	}

	public Page findRoleByPage(Page page) {
		int totalCount = getSqlSession().selectOne("Account.getRoleCount", page);
		page.setTotalCount(totalCount);
		List result = getSqlSession().selectList("Account.getRoleList", page);
		page.setResult(result);
		return page;
	}

	public void updateRole(Role role) {
		getSqlSession().update("Account.updateRole", role);
	}

	public void saveRole(Role role) {
		getSqlSession().insert("Account.insertRole", role);
	}

	public void deleteRole(List<String> ids) {
		getSqlSession().delete("Account.deleteRole", ids);
	}

	public List<User> getRoleUsers(String roleId) {
		List result = getSqlSession().selectList("Account.getRoleUsers", roleId);
		return result;
	}

	public void deleteUserRoleByRoleId(String roleId) {
		getSqlSession().delete("Account.deleteUserRoleByRoleId", roleId);
	}

	public void deleteUserRoleByUserId(String userId) {
		getSqlSession().delete("Account.deleteUserRoleByUserId", userId);
	}

	public void saveUserRole(List<Map> urList) {
		getSqlSession().insert("Account.insertUserRole", urList);

	}

	public List<Menu> getRoleMenus(String roleId) {
		List result = getSqlSession().selectList("Account.getRoleMenus", roleId);
		return result;
	}

	public void deleteRoleMenuByRoleId(List<String> ids) {
		getSqlSession().delete("Account.deleteRoleMenuByRoleId", ids);
	}

	public void saveRoleMenu(List<Map> urList) {
		getSqlSession().insert("Account.insertRoleMenu", urList);

	}

	public void updateRoleAuth(String roleId, String permission) {
		Map pars = new HashMap();
		pars.put("roleId", roleId);
		pars.put("permission", permission);
		getSqlSession().insert("Account.updateRoleAuth", pars);

	}
}
