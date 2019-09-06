package org.bsxf.common.dao.sys;

import java.util.List;

import org.bsxf.common.entity.sys.Area;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

@Component
public class AreaDao extends SqlSessionDaoSupport {
	/**
	 * 省、市，区，均用此函数
	 * */
	public Area getArea(String id) {
		return getSqlSession().selectOne("Config.getArea", id);
	}

	public List<Area> getAllProvince() {
		return getSqlSession().selectList("Config.getAllProvince");

	}

	public List<Area> getAllArea() {
		return getSqlSession().selectList("Config.getAllArea");

	}

	public List<Area> getAreaByParentId(String parentId) {
		return getSqlSession().selectList("Config.getAreaByParentId", parentId);

	}
}
