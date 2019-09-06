package org.bsxf.common.dao;

import java.util.List;
import java.util.Map;

import org.bsxf.common.entity.account.Menu;
import org.bsxf.utils.Page;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

@Component
public class MenuDao extends SqlSessionDaoSupport {
	public Menu getMenu(String id) {
		return getSqlSession().selectOne("Account.getMenu", id);
	}

	public Page findMenuByPage(Page page) {
		int totalCount = getSqlSession().selectOne("Account.getMenuCount", page);
		page.setTotalCount(totalCount);
		List result = getSqlSession().selectList("Account.getMenuList", page);
		page.setResult(result);
		return page;
	}

	public List<Menu> getAllMenuSelf() {
		return getSqlSession().selectList("Account.getAllMenuSelf");
	}

	public void saveMenu(Menu menu) {
		getSqlSession().insert("Account.insertMenu", menu);

	}

	public int getMenuSortNoByParentId(String pid) {
		List f = getSqlSession().selectList("Account.getMenuSortNoByParentId", pid);
		if (f.size() == 0 || f.get(0) == null)
			return 0;
		else
			return (Integer) f.get(0);

	}

	public void updateMenu(Menu menu) {
		getSqlSession().update("Account.updateMenu", menu);

	}

	public void deleteMenu(List ids) {
		getSqlSession().delete("Account.deleteMenu", ids);

	}

	public void disabledMenu(List ids) {
		getSqlSession().delete("Account.disabledMenu", ids);

	}

	public void disabledSubMenu(List ids) {
		getSqlSession().delete("Account.disabledSubMenu", ids);

	}

	public String getMenuLikeId(String parentId) {
		return getSqlSession().selectOne("Account.getMaxLikeId", parentId);
	}

	public List<Map> getMenuTree(String[] roleId) {
		return getSqlSession().selectList("Account.getMenuTree", roleId);
	}

	public List<Map> getMulMenuTree() {
		return getSqlSession().selectList("Account.getMulMenuTree");
	}
}
