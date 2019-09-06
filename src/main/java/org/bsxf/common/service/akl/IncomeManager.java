package org.bsxf.common.service.akl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.akl.Income;
import org.bsxf.common.repository.akl.IncomeMybatisDao;
import org.bsxf.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Identities;

@Component
@Transactional
public class IncomeManager {
	@Autowired
	private IncomeMybatisDao incomeDao;

	@Transactional(readOnly = true)
	public Income getIncome(String id) {
		return incomeDao.getIncome(id);
	}
	
	@Transactional(readOnly = true)
	public List<Income> getIncomeByBlockId(String blockId) {
		return incomeDao.getIncomeByBlockId(blockId);
	}

	@Transactional(readOnly = true)
	public List<Income> getAllIncome() {
		return incomeDao.getAllIncome();
	}

	public String saveOrUpdate(Income entity) {

		String id = "";
		if (StringUtils.isNotBlank(entity.getId())) {
			incomeDao.updateIncome(entity);
			id = entity.getId();
		} else {
			id = Identities.uuid2();
			entity.setId(id);
			incomeDao.saveIncome(entity);
		}
		return id;

	}

	public void deleteIncome(List<String> ids) {
		incomeDao.deleteIncome(ids);
	}

	@Transactional(readOnly = true)
	public Page<Income> findIncomeByPage(Page<Income> page) {
		int count = incomeDao.findIncomeCountByFilter(page);
		List<Income> cmps = incomeDao.findIncomeByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}
}
