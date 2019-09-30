package org.bsxf.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.bsxf.common.entity.account.Menu;
import org.bsxf.common.entity.account.Role;
import org.bsxf.common.entity.account.User;
import org.bsxf.utils.Page;
import org.springframework.stereotype.Component;

@Component
public class UserDao extends SqlSessionDaoSupport {
	public User findUserByLoginName(String loginName) {
		return getSqlSession().selectOne("Account.getUserByLoginName", loginName);
	}
	public List<User> getUserByName(String name) {
		return getSqlSession().selectList("Account.getUserByName", name);
	}
	public List<User> getUserByType(String type) {
		return getSqlSession().selectList("Account.getUserByType", type);
	}
	public User findUserByLoginNameOrEmailOrMobile(String loginName) {
		return getSqlSession().selectOne("Account.findUserByLoginNameOrEmailOrMobile", loginName);
	}
	
	public User findUserByMobile(String phoneNo) {
		return getSqlSession().selectOne("Account.findUserByMobile", phoneNo);
	}
	public User findUserByEmail(String email) {
		return getSqlSession().selectOne("Account.findUserByEmail", email);
	}
	public User findUserByCarno(String cardNo) {
		return getSqlSession().selectOne("Account.findUserByCarno", cardNo);
	}
	public String findUserIdsByLoginNames(String loginNames) {
		return getSqlSession().selectOne("Account.findUserIdsByLoginNames", loginNames.split(","));
	}

	public List<User> getUserByIds(String ids) {
		return getSqlSession().selectList("Account.getUserByIds", ids.split(","));
	}

	public List<Map<String, Object>> getUserLog(String id) {
		return getSqlSession().selectList("Account.getUserLog", id);
	}

	public List<Map<String, Object>> getUserLogList(Page page) {
		return getSqlSession().selectList("Account.getUserLogList", page);
	}

	public Integer getUserLogListCount(Page page) {
		return getSqlSession().selectOne("Account.getUserLogListCount", page);
	}

	public String findUserIdsByLoginAndNames(String loginNames) {
		return getSqlSession().selectOne("Account.findUserIdsByLoginAndNames", loginNames.split(","));
	}

	public void updateUser(User user) {
		getSqlSession().update("Account.updateUser", user);
	}


	public void setUserLeaderByDepartment(User user) {
		getSqlSession().update("Account.setUserLeaderByDepartment", user);
	}

	public void saveUser(User user) {
		getSqlSession().insert("Account.insertUser", user);
	}

	public void updateUserDirector(User user) {
		getSqlSession().insert("Account.updateUserDirector", user);
	}

	public User getUser(String id) {
		return getSqlSession().selectOne("Account.getUser", id);
	}

	public List<Role> getUserRole(String id) {
		return getSqlSession().selectList("Account.getUserRole", id);
	}

	public List<Menu> getAllMenu(Map map) {
		return getSqlSession().selectList("Account.getAllMenu", map);
	}

	public List<Menu> getUserMenusByParent(Map map) {
		System.out.println(map);
		return getSqlSession().selectList("Account.getUserMenusByParent", map);
	}

	public List<User> getAllUser(Map<String, Object> pars) {
		return getSqlSession().selectList("Account.getAllUser", pars);
	}

	public List<User> search(String q, String limit) {
		Map<String, Object> pars = new HashMap<String, Object>();
		pars.put("q", q);
		pars.put("limit", Integer.valueOf(limit));
		return getSqlSession().selectList("Account.search", pars);
	}

	public List<Map> getAllRoleUser(Map<String, Object> pars) {
		return getSqlSession().selectList("Account.getAllRoleUser", pars);
	}

	public List<Map> getTreeUser(Map<String, Object> pars) {
		return getSqlSession().selectList("Account.getTreeUser", pars);
	}

	public void deleteUser(String id) {
		getSqlSession().delete("Account.deleteUser", id.split(","));
	}

	public void disabledUser(String id) {
		getSqlSession().delete("Account.disabledUser", id.split(","));
	}

	public Page findUserByPage(Page page) {
		int totalCount = getSqlSession().selectOne("Account.getAllUserCount", page);
		page.setTotalCount(totalCount);
		List result = getSqlSession().selectList("Account.getAllUserPage", page);
		page.setResult(result);
		return page;
	}

	public List<Map> getTreeUserByJg(Map<String, Object> pars) {
		return getSqlSession().selectList("Account.getTreeUserByJg", pars);
	}

	public List<Map> getTreeUserByRegion(Map<String, Object> pars) {
		return getSqlSession().selectList("Account.getTreeUserByRegion", pars);
	}

}
