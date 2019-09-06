package org.bsxf.common.dao.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bsxf.common.entity.sys.Dictionary;
import org.bsxf.utils.Page;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

@Component
public class DictionaryDao extends SqlSessionDaoSupport {
	public Dictionary getDictionary(String id) {
		return getSqlSession().selectOne("Config.getDictionary", id);
	}

	public Integer getDictionarySort(String parentId) {
		return getSqlSession().selectOne("Config.getDictionarySort", parentId);
	}

	public List<Dictionary> getDictionaryByCode(String typeCode) {
		return getSqlSession().selectList("Config.getDictionaryByCode", typeCode);
	}

	public List<Dictionary> getParentDictionary() {
		return getSqlSession().selectList("Config.getParentDictionary");
	}

	public List<Dictionary> getUseDictionaryByCode(String typeCode) {
		return getSqlSession().selectList("Config.getUseDictionaryByCode", typeCode);
	}

	public void updateDefaultByValue(String val, String typeCode) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("val", val);
		m.put("typeCode", typeCode);
		getSqlSession().update("Config.updateDefaultByValue", m);
	}

	public Page findDictionaryByPage(Page page) {
		int totalCount = getSqlSession().selectOne("Config.getDictionaryCount", page);
		page.setTotalCount(totalCount);
		List result = getSqlSession().selectList("Config.getDictionaryList", page);
		page.setResult(result);
		return page;
	}

	public void saveDictionary(Dictionary entity) {
		getSqlSession().insert("Config.insertDictionary", entity);

	}

	public void updateDictionary(Dictionary entity) {
		getSqlSession().update("Config.updateDictionary", entity);

	}

	public void deleteDictionary(List ids) {
		getSqlSession().delete("Config.deleteDictionary", ids);

	}

	public void disabledDictionary(List ids) {
		getSqlSession().delete("Config.disabledDictionary", ids);

	}

	public String getDictionaryLikeId(String parentId) {
		return getSqlSession().selectOne("Config.getDictionaryMaxLikeId", parentId);
	}

	public List<Dictionary> getAllDictionary() {
		return getSqlSession().selectList("Config.getAllDictionary");

	}

	public void updateSort(List<Dictionary> dList) {
		for (Dictionary d : dList)
			getSqlSession().update("Config.updateDictionarySort", d);
	}

	public void batchUpdateDictionaryDefault(Dictionary dictionary) {
		getSqlSession().update("Config.batchUpdateDictionaryDefault", dictionary);

	}
}
