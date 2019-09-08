package org.bsxf.common.service.bsxf;

import java.util.Date;
import java.util.List;

import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.repository.bsxf.EquipmentMybatisDao;
import org.bsxf.security.ShiroDbRealm.ShiroUser;
import org.bsxf.utils.Page;
import org.bsxf.web.LtSecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional
public class EquipmentManager {
	@Autowired
	private EquipmentMybatisDao equipmentDao;

	@Transactional(readOnly = true)
	public Equipment getEquipment(String id) {
		return equipmentDao.getEquipment(id);
	}

	@Transactional(readOnly = true)
	public List<Equipment> getAllEquipment() {
		return equipmentDao.getAllEquipment();
	}

	public String saveOrUpdate(Equipment entity) {
        //Equipment 比较特殊，进页面时就生成了主键，所以这里要改一下。
		String id = "";
		if (this.getEquipment(entity.getId()) != null) {
			equipmentDao.updateEquipment(entity);
			id = entity.getId();
		} else {
			entity.setCreateTime(new Date());
			entity.setCreateUser(LtSecurityUtils.getLoginUser());
			
			equipmentDao.saveEquipment(entity);
		}
		return id;

	}

	public void deleteEquipment(List<String> ids) {
		equipmentDao.deleteEquipment(ids);
	}

	public void disabledEquipment(List<String> ids) {
		equipmentDao.disabledEquipment(ids);
	}

	@Transactional(readOnly = true)
	public Page<Equipment> findEquipmentByPage(Page<Equipment> page) {
		ShiroUser user = LtSecurityUtils.getShiroUser();
		if(user != null && "1".equals(user.getUserType())){
			page.getFilters().put("checkUserId", user.getId());
		}
		int count = equipmentDao.findEquipmentCountByFilter(page);
		List<Equipment> cmps = equipmentDao.findEquipmentByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}
}
