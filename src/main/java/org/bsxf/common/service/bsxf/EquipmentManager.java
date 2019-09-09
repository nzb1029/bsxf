package org.bsxf.common.service.bsxf;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.repository.bsxf.EquipmentMybatisDao;
import org.bsxf.security.ShiroDbRealm.ShiroUser;
import org.bsxf.common.service.SystemManager;
import org.bsxf.utils.ExcelUtil;
import org.bsxf.utils.Page;
import org.bsxf.web.LtSecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springside.utils.Identities;

@Component
@Transactional
public class EquipmentManager {
	private static Logger logger = LoggerFactory.getLogger(EquipmentManager.class);
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

	private static final String defaultSheetName = "equipment_list";
	private static final String defaultFilePath = "D:\\xiaofang\\excel\\";

	@Transactional
	public String importEquipmentList(MultipartFile file) {
		File newFile = new File(defaultFilePath + System.currentTimeMillis() + file.getOriginalFilename());
		try {
			file.transferTo(newFile);
		} catch (IOException e) {
			logger.error("模板文件转换失败，报错：", e);
			return "文件转换失败，请确认";
		}
		List<Map<String, Object>> dataList = ExcelUtil.getData(newFile, defaultSheetName);
		if (CollectionUtils.isEmpty(dataList)) {
			return "文件无数据，请确认";
		}
		for (Map<String, Object> data : dataList) {
			equipmentDao.saveEquipment(generateEquipment(data));
		}
		return "";
	}

	private SystemManager systemManager = new SystemManager();
	
	private Equipment generateEquipment(Map<String, Object> data) {
		Equipment equipment = new Equipment();
		equipment.setId(Identities.uuid2());
		equipment.setCreateTime(new Date());
		equipment.setCreateUser(LtSecurityUtils.getLoginUser());
		for (String key : data.keySet()) {
			if("设备编号".equals(key)) {
				equipment.setEno(data.get(key).toString().trim());
			}else if("设备类别".equals(key)){
				equipment.setSubTypeName(data.get(key).toString().trim());
				if ("4kg干粉".equals(data.get(key).toString().trim().toLowerCase())) {
					equipment.setSubTypeId("1");
				}
			}else if("设备名称".equals(key)){
				equipment.setName(data.get(key).toString().trim());
			}else if("区域".equals(key)){
				equipment.setName(data.get(key).toString().trim());
			}else if("位置".equals(key)){
				equipment.setName(data.get(key).toString().trim());
			}else if("有效起期".equals(key)){
				equipment.setName(data.get(key).toString().trim());
			}else if("有效止期".equals(key)){
				equipment.setName(data.get(key).toString().trim());
			}else if("备注".equals(key)){
				equipment.setName(data.get(key).toString().trim());
			}else{
				logger.error("{}-{} 无匹配字段", new Object[]{key, data.get(key)});
			 }
		}
		System.out.println(systemManager.getDictionaryByCode("xf_category"));
		return equipment;
	}
}
