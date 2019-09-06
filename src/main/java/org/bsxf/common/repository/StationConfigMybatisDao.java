package org.bsxf.common.repository;

import java.util.List;
import java.util.Map;

import org.bsxf.common.entity.sys.StationConfig;
import org.bsxf.utils.Page;
import org.springframework.stereotype.Component;

/***
 * mybatis自动扫描此目录，无需再写实现
 * */
@Component
public interface StationConfigMybatisDao {
	public StationConfig getStationConfig(String id);

	public List<Map<String, Object>> getAllAreaTree();

	public List<StationConfig> getAllStationConfig();

	public void updateStationConfig(StationConfig entity);

	public void saveStationConfig(StationConfig entity);

	public void deleteStationConfig(List<String> ids);

	public void disabledStationConfig(List<String> ids);

	public List<StationConfig> findStationConfigByFilter(Page page);

	public int findStationConfigCountByFilter(Page page);

	public void deleteLog(String month);

}
