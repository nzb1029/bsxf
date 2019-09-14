package org.bsxf.common.service.bsxf;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.bsxf.CheckResult;
import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.repository.bsxf.EquipmentMybatisDao;
import org.bsxf.common.service.SystemManager;
import org.bsxf.security.ShiroDbRealm.ShiroUser;
import org.bsxf.utils.ExcelUtil;
import org.bsxf.utils.QrcodeUtil;
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

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Component
@Transactional
public class EquipmentManager {
	private static Logger logger = LoggerFactory.getLogger(EquipmentManager.class);

	private static final String defaultSheetName = "equipment_list";
	private static final String ROOT_PATH = "D:/xiaofang";// TODO 更改为文件根路径，用于存储： 1. 批量导入使用的excel文件；2. 生成的二维码文件
	private static final String EXCEL_PATH = "/excel/";
	private static final String QRCODE_PATH = "/qrcode/";
	private static final String QRCODE_TYPE = ".png";
	private static final String ROOT_URL = "http://pjkbalance.mynatapp.cc/history/resultForm/"; // TODO http://pjkbalance.mynatapp.cc 更新为正式的域名
	public static String getQrcodePath(String fileName) {
		return ROOT_PATH + QRCODE_PATH + getQrcodeFileName(fileName);
	}
	public static String getQrcodeFileName(String fileName) {
		if (fileName.indexOf(QRCODE_TYPE) > 0) {
			return fileName;
		} else {
			return fileName + QRCODE_TYPE;
		}
	}

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
			//如果新增的话,需要设置剩余巡检次数
			entity.setRemainNum(entity.getCheckFreq());
			entity.setLastRemainNum(entity.getCheckFreq());
			QrcodeUtil.generateQRCodeImage(ROOT_URL + entity.getEno(), getQrcodePath(entity.getEno()));
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

	@Transactional
	public String importEquipmentList(MultipartFile file) {
		File newFile = new File(ROOT_PATH + EXCEL_PATH + System.currentTimeMillis() + "_" + file.getOriginalFilename());
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
			Equipment equipment = generateEquipment(data);
			QrcodeUtil.generateQRCodeImage(ROOT_URL + equipment.getEno(), getQrcodePath(equipment.getEno()));
			equipmentDao.saveEquipment(equipment);
		}
		return "";
	}

	private SystemManager systemManager = new SystemManager();
	
	private Equipment generateEquipment(Map<String, Object> data) {
		Equipment equipment = new Equipment();
		//set deafult value
		equipment.setId(Identities.uuid2());
		equipment.setEquipmentTypeId("1");
		equipment.setSubTypeId("1");
		equipment.setCreateTime(new Date());
		equipment.setCreateUser(LtSecurityUtils.getLoginUser());
		equipment.setCheckFreq(1);
		equipment.setRemainNum(1);
		equipment.setLastRemainNum(1);
		
		for (String key : data.keySet()) {
			if("设备编号".equals(key)) {
				equipment.setEno(data.get(key).toString().trim());
			}else if("设备类别".equals(key)){
				equipment.setSubTypeName(data.get(key).toString().trim());
			}else if("设备名称".equals(key)){
				equipment.setName(data.get(key).toString().trim());
			}else if("区域".equals(key)){
				equipment.setArea(data.get(key).toString().trim());
			}else if("位置".equals(key)){
				equipment.setLocation(data.get(key).toString().trim());
			}else if("有效起期".equals(key)){
				equipment.setEffDate((Date) data.get(key));
			}else if("有效止期".equals(key)){
				equipment.setExpDate((Date) data.get(key));
			}else if("备注".equals(key)){
				equipment.setComments(data.get(key).toString().trim());
			}else{
				logger.error("{}-{} 无匹配字段", new Object[]{key, data.get(key)});
			 }
		}
		return equipment;
	}

	/**
	 * 每月剩余巡检次数,在下个月时会将这个字段复制到lastremainNum字段，这个字段重置
	 */
	public void updateRemainNum() {
		List<Equipment> equipmentList = this.getAllEquipment();
		if(!CollectionUtils.isEmpty(equipmentList)){
			for (Equipment equipment : equipmentList) {
				equipment.setLastRemainNum(equipment.getRemainNum());
				equipment.setRemainNum(equipment.getCheckFreq());
				this.equipmentDao.updateEquipment(equipment);
			}
		}
	}
	
	@Transactional(readOnly = true)
	public List<Equipment> getRemainEquipments() {
		return equipmentDao.getRemainEquipments();
	}

	public boolean generateQrcodefile(List<String> idList, String fileName) {
		if (CollectionUtils.isEmpty(idList) || StringUtils.isBlank(fileName)) {
			logger.error("二维码生成失败，参数有误：enoList[{}] qrcodePath[{}]", new Object[] {idList, fileName});
			return false;
		}
		String qrcodePath = getQrcodePath(fileName);
		List<File> qrcodeFileList = new ArrayList<>(idList.size());
		for (String id : idList) {
			if (StringUtils.isNotBlank(id)) {
				String filePath = getQrcodePath(id);
				File file = new File(filePath);
				if (!file.exists()) {
					QrcodeUtil.generateQRCodeImage(ROOT_URL + id, filePath);
				}
				qrcodeFileList.add(file);
			}
		}
		QrcodeUtil.mergeQRCode(qrcodeFileList, qrcodePath);
		return true;
	}

	public String checkResult(CheckResult checkResult) {
		Equipment equipment = equipmentDao.getEquipment(checkResult.getEquipmentId());
		if (equipment == null) {
			return "设备未在系统中维护，请确认";
		}
		equipment.setRunStatus(checkResult.getRunStatus());
		int newRemainNum = equipment.getRemainNum() - 1;
		equipment.setRemainNum(newRemainNum < 0 ? 0 : newRemainNum);
		equipment.setLastUpdateTime(new Date());
		equipment.setLastUpdateUser(checkResult.getCheckUser());
		saveOrUpdate(equipment);
		return "";
	}
}
