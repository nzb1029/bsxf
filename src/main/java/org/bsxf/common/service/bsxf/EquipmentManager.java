package org.bsxf.common.service.bsxf;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.dao.UserDao;
import org.bsxf.common.entity.account.User;
import org.bsxf.common.entity.akl.Attachment;
import org.bsxf.common.entity.bsxf.CheckResult;
import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.entity.sys.Dictionary;
import org.bsxf.common.repository.bsxf.EquipmentMybatisDao;
import org.bsxf.common.service.SystemManager;
import org.bsxf.common.service.akl.AttachmentManager;
import org.bsxf.security.ShiroDbRealm.ShiroUser;
import org.bsxf.utils.*;
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

    private static final String defaultSheetName = PropertiesUtils.get("default_sheet_name");
	private static final String ROOT_PATH = PropertiesUtils.getFileDir();
	private static final String EXCEL_PATH = PropertiesUtils.get("excel_path");
	private static final String PDF_PATH = PropertiesUtils.get("pdf_path");
	private static final String QRCODE_TYPE = PropertiesUtils.get("qrcode_type");
	public static final String QRCODE_PDF_TYPE = PropertiesUtils.get("qrcode_pdf_type");
	private static final String ROOT_URL = PropertiesUtils.get("qrcode_url");
	public static String getQrcodePath(String fileName) {
		String subPath = FileUtils.getSubPath(fileName, "2", "");
		File fold = new File(ROOT_PATH + File.separator + subPath);
		if (!fold.exists()) {
			fold.mkdirs();
		}
		return ROOT_PATH + File.separator + subPath + File.separator + getQrcodeFileName(fileName, QRCODE_TYPE);
	}
	public static String getQrcodePDFPath(String fileName) {
		File fold = new File(ROOT_PATH + File.separator + PDF_PATH);
		if (!fold.exists()) {
			fold.mkdirs();
		}
		return ROOT_PATH + File.separator + PDF_PATH + File.separator + getQrcodeFileName(fileName, QRCODE_PDF_TYPE);
	}
	public static String getQrcodeFileName(String fileName, String fileType) {
		if (fileName.indexOf(fileType) > 0) {
			return fileName;
		} else {
			return fileName + fileType;
		}
	}

    @Autowired
    private EquipmentMybatisDao equipmentDao;

	@Autowired
    private AttachmentManager attachmentManager;

	@Autowired
	private SystemManager systemManager;

	@Autowired
	private UserDao userDao;

	@Transactional(readOnly = true)
	public Equipment getEquipment(String id) {
		return equipmentDao.getEquipment(id);
	}

	@Transactional(readOnly = true)
	public List<Equipment> getAllEquipment() {
		return equipmentDao.getAllEquipment();
	}

	private void save(Equipment equipment) {
        List<Equipment> equipmentList = equipmentDao.getEquipmentByEno(equipment.getEno());
        if (!CollectionUtils.isEmpty(equipmentList)) {
            throw new RuntimeException("消防器编码(" + equipment.getEno() + ")已存在，请确认");
        }
        equipment.setCreateTime(new Date());
        equipment.setCreateUser(LtSecurityUtils.getLoginUser());
        //如果新增的话,需要设置剩余巡检次数
        equipment.setRemainNum(equipment.getCheckFreq());
        equipment.setLastRemainNum(0);
        equipmentDao.saveEquipment(equipment);
        generateQrcodefile(equipment.getId(), equipment.getEno());
    }

	@Transactional(rollbackFor = RuntimeException.class)
	public String saveOrUpdate(Equipment entity) {
        //Equipment 比较特殊，进页面时就生成了主键，所以这里要改一下。
		String id = "";
		if (this.getEquipment(entity.getId()) != null) {
			//如果修改了CheckFreq的话,也要更新下remainNumber
			entity.setRemainNum(entity.getCheckFreq());
			equipmentDao.updateEquipment(entity);
			id = entity.getId();
		} else {
		    entity.setName("灭火器");
			entity.setCreateTime(new Date());
			entity.setCreateUser(LtSecurityUtils.getLoginUser());
			//如果新增的话,需要设置剩余巡检次数
			entity.setRemainNum(entity.getCheckFreq());
			entity.setLastRemainNum(entity.getCheckFreq());
			equipmentDao.saveEquipment(entity);
			generateQrcodefile(entity.getId(), entity.getEno());
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

	@Transactional(rollbackFor = RuntimeException.class)
	public void importEquipmentList(MultipartFile file) {
		File fold = new File(ROOT_PATH + File.separator + EXCEL_PATH);
		if (!fold.exists()) {
			fold.mkdirs();
		}
		File newFile = new File(ROOT_PATH + File.separator + EXCEL_PATH + File.separator + System.currentTimeMillis() + "_" + file.getOriginalFilename());
		try {
			file.transferTo(newFile);
		} catch (IOException e) {
			logger.error("模板文件转换失败，报错：", e);
			throw new RuntimeException("文件转换失败，请确认");
		}
		List<Map<String, Object>> dataList = ExcelUtil.getData(newFile, defaultSheetName, 5);
		if (CollectionUtils.isEmpty(dataList)) {
		    throw new RuntimeException("文件无数据，请确认");
		}
		List<Dictionary> categoryList = systemManager.getDictionaryByCode("xf_category");
		for (Map<String, Object> data : dataList) {
			Equipment equipment = generateEquipment(data, categoryList);
			if (equipment != null) {
				save(equipment);
			}
		}
	}
	
	private Equipment generateEquipment(Map<String, Object> data, List<Dictionary> categoryList) {
        logger.info("解析设备：{}", data);
        Equipment equipment = new Equipment();
        //set deafult value
        equipment.setId(Identities.uuid2());
        equipment.setEquipmentTypeId("1");
        equipment.setName("灭火器");
        equipment.setCreateTime(new Date());
        equipment.setCreateUser(LtSecurityUtils.getLoginUser());
        equipment.setCheckFreq(1);

        Object enoObj = data.get("设备编号");
        if (enoObj == null) {
            return null;
        }
        String eno = data.get("设备编号").toString().trim();
        if (StringUtils.isBlank(eno)) {
            return null;
        }
        equipment.setEno(eno);
        for (String key : data.keySet()) {
            if ("设备类别".equals(key)) {
                equipment.setSubTypeName(data.get(key).toString().trim());
                for (Dictionary category : categoryList) {
                    if (category.getName().equalsIgnoreCase(equipment.getSubTypeName())) {
                        equipment.setSubTypeId(category.getVal());
                        break;
                    }
                }
            } else if ("区域".equals(key)) {
                equipment.setArea(data.get(key).toString().trim());
            } else if ("位置".equals(key)) {
                equipment.setLocation(data.get(key).toString().trim());
            } else if ("001有效起期".equals(key)) {
                if (StringUtils.isNotBlank(data.get(key).toString())) {
                    equipment.setEffDate((Date) data.get(key));
                }
            } else if ("001有效止期".equals(key)) {
                if (StringUtils.isNotBlank(data.get(key).toString())) {
                    equipment.setExpDate((Date) data.get(key));
                }
            } else if ("001出厂日期".equals(key)) {
                if (StringUtils.isNotBlank(data.get(key).toString())) {
                    equipment.setProductionDate((Date) data.get(key));
                }
            } else if ("002有效起期".equals(key)) {
                if (StringUtils.isNotBlank(data.get(key).toString())) {
                    equipment.setEffDate2((Date) data.get(key));
                }
            } else if ("002有效止期".equals(key)) {
                if (StringUtils.isNotBlank(data.get(key).toString())) {
                    equipment.setExpDate2((Date) data.get(key));
                }
            } else if ("002出厂日期".equals(key)) {
                if (StringUtils.isNotBlank(data.get(key).toString())) {
                    equipment.setProductionDate2((Date) data.get(key));
                }
            } else if ("003有效起期".equals(key)) {
                if (StringUtils.isNotBlank(data.get(key).toString())) {
                    equipment.setEffDate3((Date) data.get(key));
                }
            } else if ("003有效止期".equals(key)) {
                if (StringUtils.isNotBlank(data.get(key).toString())) {
                    equipment.setExpDate3((Date) data.get(key));
                }
            } else if ("003出厂日期".equals(key)) {
                if (StringUtils.isNotBlank(data.get(key).toString())) {
                    equipment.setProductionDate3((Date) data.get(key));
                }
            } else if ("备注".equals(key)) {
                equipment.setComments(data.get(key).toString().trim());
            } else if ("数量".equals(key)) {
                equipment.setAmount(((Double) data.get(key)).intValue());
            } else if ("巡检负责人".equalsIgnoreCase(key)) {
                String userName = data.get(key).toString().trim();
                List<User> userList = userDao.getUserByName(userName);
                if (CollectionUtils.isEmpty(userList) || userList.size() > 1) {
                    logger.error("数据有误：{}", data);
                    throw new RuntimeException(equipment.getEno() + " 设备的巡检员(" + userName + ")设置有误，请确认");
                }
                equipment.setCheckUser(userList.get(0));
            } else if (!"设备编号".equals(key)) {
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

	public boolean generateQrcodePDFFile(List<String> idList, String fileName) {
        if (StringUtils.isBlank(fileName)) {
            logger.error("二维码生成失败，参数有误：enoList[{}] qrcodePath[{}]", new Object[] {idList, fileName});
            return false;
        }
	    if (CollectionUtils.isEmpty(idList)) {
	        idList = equipmentDao.getAllEquipmentId();
        }
        if (CollectionUtils.isEmpty(idList)) {
            logger.error("二维码生成失败，参数有误：enoList[{}] qrcodePath[{}]", new Object[] {idList, fileName});
            return false;
        }
		List<String> qrcodeFilePathList = new ArrayList<>(idList.size());
		for (String id : idList) {
			if (StringUtils.isNotBlank(id)) {
				String filePath = getQrcodePath(id);
				File file = new File(filePath);
				if (!file.exists()) {
					Equipment equipment = equipmentDao.getEquipment(id);
					generateQrcodefile(id, equipment.getEno());
				}
				qrcodeFilePathList.add(filePath);
			}
		}
		String qrcodePath = getQrcodePDFPath(fileName);
		QrcodeUtil.mergeQRCode(qrcodeFilePathList, qrcodePath);
		return true;
	}

	private void generateQrcodefile(String id, String eno) {
        QrcodeUtil.generateQRCodeImage(ROOT_URL + id, eno, getQrcodePath(id));
        saveQrcodeAttachment(id, FileUtils.getSubPath(id, "2", ""), getQrcodeFileName(id, QRCODE_TYPE));
    }

	@Transactional(rollbackFor = RuntimeException.class)
	public String checkResult(CheckResult checkResult) {
		Equipment equipment = equipmentDao.getEquipment(checkResult.getEquipmentId());
		if (equipment == null) {
			return "设备未在系统中维护，请确认";
		}
		equipment.setRunStatus(checkResult.getRunStatus());
		equipment.setField04(checkResult.getField04());
		equipment.setField05(checkResult.getField05());
		equipment.setField06(checkResult.getField06());
		equipment.setField07(checkResult.getField07());
		equipment.setField08(checkResult.getField08());
		equipment.setField09(checkResult.getField09());
		equipment.setField10(checkResult.getField10());
		equipment.setField11(checkResult.getField11());
		equipment.setField12(checkResult.getField12());
		equipment.setField13(checkResult.getField13());
		equipment.setField14(checkResult.getField14());
		int newRemainNum = equipment.getRemainNum() - 1;
		equipment.setRemainNum(newRemainNum < 0 ? 0 : newRemainNum);
		equipment.setLastUpdateTime(new Date());
		equipment.setLastUpdateUser(checkResult.getCheckUser());
		saveOrUpdate(equipment);
		return "";
	}

    private void saveQrcodeAttachment(String businessId, String fullPath, String fileName) {
        Attachment attach = new Attachment();
        attach.setFilename(fileName);
        attach.setFileType("2");
        attach.setFilepath(fullPath);
        attach.setField01("");
        attach.setBusinessId(businessId);
        attachmentManager.saveOrUpdate(attach);
    }
}
