package org.bsxf.common.repository.akl;

import java.util.List;

import org.bsxf.common.entity.akl.Income;
import org.bsxf.utils.Page;
import org.springframework.stereotype.Component;

/***
 * mybatis自动扫描此目录，无需再写实现
 * */
@Component
public interface IncomeMybatisDao {
	public Income getIncome(String id);

	public List<Income> getAllIncome();

	public void updateIncome(Income entity);

	public void saveIncome(Income entity);

	public void deleteIncome(List<String> ids);

	public List<Income> findIncomeByFilter(Page page);

	public int findIncomeCountByFilter(Page page);

	public List<Income> getIncomeByBlockId(String blockId);

}
