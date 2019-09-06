package org.bsxf.common.repository.akl;

import java.util.List;
import java.util.Map;

import org.bsxf.common.entity.akl.Cost;
import org.bsxf.utils.Page;
import org.springframework.stereotype.Component;

/***
 * mybatis自动扫描此目录，无需再写实现
 * */
@Component
public interface CostMybatisDao {
	public Cost getCost(String id);

	public List<Cost> getAllCost();

	public void updateCost(Cost entity);

	public void saveCost(Cost entity);

	public void deleteCost(List<String> ids);

	public List<Cost> findCostByFilter(Page page);

	public int findCostCountByFilter(Page page);

	public List<Cost> getCostByBlockId(String blockId);

}
