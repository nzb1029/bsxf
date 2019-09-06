package org.bsxf.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.sys.StationConfig;
import org.bsxf.common.repository.StationConfigMybatisDao;
import org.bsxf.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Identities;

/**
 * @类名称：StationConfigManager   
 * @类描述：省市区设置   
 * @作者：Administrator   
 * @创建时间：2014-10-24 上午11:03:01   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 上午11:03:01   
 * @修改备注：   
 * @版权：
 * @version
*/
@Component
@Transactional
public class StationConfigManager {
	@Autowired
	private StationConfigMybatisDao stationConfigDao;

	@Transactional(readOnly = true)
	public StationConfig getStationConfig(String id) {
		return stationConfigDao.getStationConfig(id);
	}

	@Transactional(readOnly = true)
	public List<Map<String, Object>> getAllAreaTree() {

		List<Map<String, Object>> alist = stationConfigDao.getAllAreaTree();
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("id", "0");
		rmap.put("name", "中国");
		rmap.put("parent_id", "");
		//alist.add(rmap);
		return alist;
	}

	@Transactional(readOnly = true)
	public List<StationConfig> getAllStationConfig() {
		return stationConfigDao.getAllStationConfig();
	}

	public String saveOrUpdate(StationConfig entity) {

		String id = "";
		if (StringUtils.isNotBlank(entity.getId())) {
			stationConfigDao.updateStationConfig(entity);
			id = entity.getId();
		} else {
			id = Identities.uuid2();
			entity.setId(id);
			stationConfigDao.saveStationConfig(entity);
		}
		return id;

	}

	public void deleteStationConfig(List<String> ids) {
		stationConfigDao.deleteStationConfig(ids);
	}

	public void disabledStationConfig(List<String> ids) {
		stationConfigDao.disabledStationConfig(ids);
	}

	@Transactional(readOnly = true)
	public Page<StationConfig> findStationConfigByPage(Page<StationConfig> page) {
		int count = stationConfigDao.findStationConfigCountByFilter(page);
		List<StationConfig> cmps = stationConfigDao.findStationConfigByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}

	public void deleteLog(String month) {
		stationConfigDao.deleteLog(month);
	}
}
