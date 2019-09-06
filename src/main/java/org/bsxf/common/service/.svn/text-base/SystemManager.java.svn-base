package org.bsxf.common.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.dao.sys.AreaDao;
import org.bsxf.common.dao.sys.DictionaryDao;
import org.bsxf.common.entity.sys.Area;
import org.bsxf.common.entity.sys.Dictionary;
import org.bsxf.common.entity.sys.Dictype;
import org.bsxf.utils.EhcacheManager;
import org.bsxf.utils.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Identities;

/**
 * @类名称：SystemManager   
 * @类描述：   
 * @作者：Administrator   
 * @创建时间：2014-10-24 下午01:30:31   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 下午01:30:31   
 * @修改备注：   
 * @版权：
 * @version
*/
@Component
@Transactional
public class SystemManager {
	@Autowired
	private DictionaryDao dictionaryDao;
	@Autowired
	private AreaDao areaDao;

	private Logger logger = LoggerFactory.getLogger(SystemManager.class);

	@SuppressWarnings("unchecked")
	public List<Dictionary> getDictionaryByCode(String typeCode) {
		List<Dictionary> dList = null;//(List<Dictionary>) EhcacheManager.get(typeCode);
		if (dList == null) {
			dList = dictionaryDao.getDictionaryByCode(typeCode);
			EhcacheManager.put(typeCode, dList);
		} else {
			logger.info("字典[" + typeCode + "]缓存中已存在！");
		}
		return dList;
	}

	public List<Dictionary> getDictionaryByCodeAddRoot(String typeCode, String rootName) {
		List<Dictionary> df = new ArrayList<Dictionary>();
		Dictionary d = new Dictionary();
		d.setId("");
		d.setName(rootName);
		df.add(d);
		df.addAll(getDictionaryByCode(typeCode));
		return df;
	}

	public List<Dictionary> getParentDictionary() {
		return dictionaryDao.getParentDictionary();
	}

	/**
	 * @方法名: getShippingMethod
	 * @描述: 货运方式字典列表
	 * @参数 @return
	 * @返回类型 List<Dictionary>    
	 * @throws
	 */
	public List<Dictionary> getShippingMethod() {
		return getDictionaryByCode(Dictype.shippingMethod);
		//return dictionaryDao.getDictionaryByCode(Dictype.shippingMethod);
	}


	public void updateSort(List<Dictionary> dList) {
		dictionaryDao.updateSort(dList);
	}

	@Transactional(readOnly = true)
	public Page findDictionaryByPage(Page page) {
		return dictionaryDao.findDictionaryByPage(page);
	}

	@Transactional(readOnly = true)
	public Dictionary getDictionary(String id) {
		return dictionaryDao.getDictionary(id);
	}

	public String saveOrUpdateDictionary(Dictionary dictionary) {
		String id = "";
		if (dictionary.getParent() == null)
			dictionary.setParent(new Dictionary());
		if (StringUtils.isBlank(dictionary.getParent().getId()))
			dictionary.getParent().setId(null);

		if (StringUtils.isNotBlank(dictionary.getId())) {
			dictionaryDao.updateDictionary(dictionary);
			id = dictionary.getId();
		} else {
			Integer sort = dictionaryDao.getDictionarySort(dictionary.getParent().getId());
			if (sort != null)
				dictionary.setSort(sort);
			id = Identities.uuid2();
			dictionary.setId(id);
			dictionaryDao.saveDictionary(dictionary);
		}
		if (dictionary.getDefaultFlg().equals("y")) {//设置了默认值
			dictionaryDao.batchUpdateDictionaryDefault(dictionary);
		}
		EhcacheManager.remove(dictionary.getTypeCode());
		return id;
	}

	public void deleteDictionary(List<String> ids) {
		for (String id : ids) {
			Dictionary d = getDictionary(id);
			EhcacheManager.remove(d.getTypeCode());
		}
		dictionaryDao.deleteDictionary(ids);

	}

	public void disabledDictionary(List<String> ids) {

		for (String id : ids) {
			Dictionary d = getDictionary(id);
			if (d != null)
				EhcacheManager.remove(d.getTypeCode());
		}
		dictionaryDao.disabledDictionary(ids);
	}

	@Transactional(readOnly = true)
	public List<Dictionary> getAllDictionary() {
		return dictionaryDao.getAllDictionary();
	}

	//area

	/**
	 * @方法名: getArea
	 * @描述: 省、市，区，均用此函数
	 * @参数 @param id
	 * @参数 @return
	 * @返回类型 Area    
	 * @throws
	 */
	public Area getArea(String id) {
		return areaDao.getArea(id);
	}

	public List<Area> getAllProvince() {
		return areaDao.getAllProvince();

	}

	public List<Area> getAllArea() {
		return areaDao.getAllArea();

	}

	public List<Area> getAreaByParentId(String parentId) {
		return areaDao.getAreaByParentId(parentId);

	}
}
