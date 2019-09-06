package org.bsxf.common.service.akl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.akl.Cost;
import org.bsxf.common.repository.akl.CostMybatisDao;
import org.bsxf.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Identities;

@Component
@Transactional
public class CostManager {
	@Autowired
	private CostMybatisDao costDao;

	@Transactional(readOnly = true)
	public Cost getCost(String id) {
		return costDao.getCost(id);
	}

	@Transactional(readOnly = true)
	public List<Cost> getAllCost() {
		return costDao.getAllCost();
	}
	
	@Transactional(readOnly = true)
	public List<Cost> getCostByBlockId(String blockId) {
		return costDao.getCostByBlockId(blockId);
	}

	public String saveOrUpdate(Cost entity) {

		String id = "";
		if (StringUtils.isNotBlank(entity.getId())) {
			costDao.updateCost(entity);
			id = entity.getId();
		} else {
			id = Identities.uuid2();
			entity.setId(id);
			costDao.saveCost(entity);
		}
		return id;

	}

	public void deleteCost(List<String> ids) {
		costDao.deleteCost(ids);
	}

	@Transactional(readOnly = true)
	public Page<Cost> findCostByPage(Page<Cost> page) {
		int count = costDao.findCostCountByFilter(page);
		List<Cost> cmps = costDao.findCostByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}
}
