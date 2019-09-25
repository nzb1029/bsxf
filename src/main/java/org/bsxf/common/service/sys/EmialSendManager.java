package org.bsxf.common.service.sys;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.sys.EmialSend;
import org.bsxf.common.repository.sys.EmialSendMybatisDao;
import org.bsxf.utils.Page;
import org.bsxf.web.LtSecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Identities;

@Component
@Transactional
public class EmialSendManager {
	@Autowired
	private EmialSendMybatisDao emialSendDao;
	
	@Transactional(readOnly = true)
	public EmialSend getEmialSend(String id) {
		return emialSendDao.getEmialSend(id);
	}
	
	@Transactional(readOnly = true)
	public List<EmialSend> getAllEmialSend() {
		return emialSendDao.getAllEmialSend();
	}

	public String saveOrUpdate(EmialSend entity) {

		String id = "";
		if (StringUtils.isNotBlank(entity.getId())) {
		    entity.setLastUpdateTime(new Date());
			//entity.setLastUpdateUser(LtSecurityUtils.getLoginUser());
			emialSendDao.updateEmialSend(entity);
			id = entity.getId();
		} else {
			id = Identities.uuid2();
			entity.setId(id);
			entity.setCreateTime(new Date());
			//entity.setCreateUser(LtSecurityUtils.getLoginUser());
			entity.setLastUpdateTime(new Date());
			//entity.setLastUpdateUser(LtSecurityUtils.getLoginUser());
			emialSendDao.saveEmialSend(entity);
		}
		return id;

	}

	public void deleteEmialSend(List<String> ids) {
		emialSendDao.deleteEmialSend(ids);
	}

	public void disabledEmialSend(List<String> ids) {
		emialSendDao.disabledEmialSend(ids);
	}
	@Transactional(readOnly = true)
	public Page<EmialSend> findEmialSendByPage(Page<EmialSend> page) {
		int count = emialSendDao.findEmialSendCountByFilter(page);
		List<EmialSend> cmps = emialSendDao.findEmialSendByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}
	@Transactional(readOnly = true)
	public List<EmialSend> findEmialSendByCond(Map<String, Object> pars) {
		return emialSendDao.findEmialSendByCond(pars);
	}
}
