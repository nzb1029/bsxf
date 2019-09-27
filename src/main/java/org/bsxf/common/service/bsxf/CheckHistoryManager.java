package org.bsxf.common.service.bsxf;

import java.util.Date;
import java.util.List;

import org.bsxf.common.entity.bsxf.CheckHistory;
import org.bsxf.common.entity.bsxf.CheckResult;
import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.repository.bsxf.CheckHistoryMybatisDao;
import org.bsxf.common.repository.bsxf.EquipmentMybatisDao;
import org.bsxf.security.ShiroDbRealm.ShiroUser;
import org.bsxf.utils.Page;
import org.bsxf.web.LtSecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Identities;

@Component
@Transactional
public class CheckHistoryManager {
	@Autowired
	private CheckHistoryMybatisDao checkHistoryDao;
	@Autowired
	private EquipmentMybatisDao equipmentDao;

	@Transactional(readOnly = true)
	public CheckHistory getCheckHistory(String id) {
		return checkHistoryDao.getCheckHistory(id);
	}

	@Transactional(readOnly = true)
	public List<CheckHistory> getAllCheckHistory() {
		return checkHistoryDao.getAllCheckHistory();
	}

	public String saveOrUpdate(CheckHistory entity) {
        //CheckHistory 比较特殊，进页面时就生成了主键，所以这里要改一下。
		String id = "";
		if (this.getCheckHistory(entity.getId()) != null) {
			checkHistoryDao.updateCheckHistory(entity);
			id = entity.getId();
		} else {
			entity.setCreateTime(new Date());
			entity.setCreateUser(LtSecurityUtils.getLoginUser());
			
			checkHistoryDao.saveCheckHistory(entity);
		}
		return id;

	}

	public void deleteCheckHistory(List<String> ids) {
		checkHistoryDao.deleteCheckHistory(ids);
	}

	public void disabledCheckHistory(List<String> ids) {
		checkHistoryDao.disabledCheckHistory(ids);
	}

	@Transactional(readOnly = true)
	public Page<CheckHistory> findCheckHistoryByPage(Page<CheckHistory> page) {
		ShiroUser user = LtSecurityUtils.getShiroUser();
		if(user != null && "1".equals(user.getUserType())){
			page.getFilters().put("checkUserId", user.getId());
		}
		int count = checkHistoryDao.findCheckHistoryCountByFilter(page);
		List<CheckHistory> cmps = checkHistoryDao.findCheckHistoryByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}

	public void checkResult(CheckResult checkResult) {
		Equipment equipment = equipmentDao.getEquipment(checkResult.getEquipmentId());
		CheckHistory checkHistory = new CheckHistory();
		checkHistory.setId(checkResult.getCheckHistoryId());
		checkHistory.setEquipment(equipment);
		checkHistory.setComments(checkResult.getComments());
		checkHistory.setStatus(equipment.getStatus());
		checkHistory.setRunStatus(equipment.getRunStatus());
		checkHistory.setField04(checkResult.getField04());
		checkHistory.setField05(checkResult.getField05());
		checkHistory.setField06(checkResult.getField06());
		checkHistory.setField07(checkResult.getField07());
		checkHistory.setField08(checkResult.getField08());
		checkHistory.setField09(checkResult.getField09());
		checkHistory.setField10(checkResult.getField10());
		checkHistory.setField11(checkResult.getField11());
		checkHistory.setField12(checkResult.getField12());
		checkHistory.setField13(checkResult.getField13());
		checkHistory.setField14(checkResult.getField14());
		
		checkHistory.setCheckUser(checkResult.getCheckUser());
		checkHistory.setCheckTime(new Date());
		saveOrUpdate(checkHistory);
	}
}
