package org.bsxf.common.repository.bsxf;

import java.util.List;

import org.bsxf.common.entity.bsxf.CheckHistory;
import org.bsxf.utils.Page;
import org.springframework.stereotype.Component;

/***
 * mybatis自动扫描此目录，无需再写实现
 * */
@Component
public interface CheckHistoryMybatisDao {
	
	public CheckHistory getCheckHistory(String id);

	public List<CheckHistory> getAllCheckHistory();

	public void updateCheckHistory(CheckHistory entity);

	public void saveCheckHistory(CheckHistory entity);

	public void deleteCheckHistory(List<String> ids);

	public void disabledCheckHistory(List<String> ids);

	public List<CheckHistory> findCheckHistoryByFilter(Page page);

	public int findCheckHistoryCountByFilter(Page page);

	public List<CheckHistory> getUserCheckHistory(String userId);

}
