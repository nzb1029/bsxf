package org.bsxf.common.service.sys;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.sys.EmailConfig;
import org.bsxf.common.repository.sys.EmailConfigMybatisDao;
import org.bsxf.utils.Page;
import org.bsxf.web.LtSecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Identities;

@Component
@Transactional
public class EmailConfigManager {
	@Autowired
	private EmailConfigMybatisDao emailConfigDao;
	
	@Transactional(readOnly = true)
	public EmailConfig getEmailConfig(String id) {
		return emailConfigDao.getEmailConfig(id);
	}
	
	@Transactional(readOnly = true)
	public List<EmailConfig> getAllEmailConfig() {
		return emailConfigDao.getAllEmailConfig();
	}

	public String saveOrUpdate(EmailConfig entity) {

		String id = "";
		if (StringUtils.isNotBlank(entity.getId())) {
		    entity.setLastUpdateTime(new Date());
			entity.setLastUpdateUser(LtSecurityUtils.getLoginUser());
			emailConfigDao.updateEmailConfig(entity);
			id = entity.getId();
		} else {
			id = Identities.uuid2();
			entity.setId(id);
			entity.setCreateTime(new Date());
			entity.setCreateUser(LtSecurityUtils.getLoginUser());
			entity.setLastUpdateTime(new Date());
			entity.setLastUpdateUser(LtSecurityUtils.getLoginUser());
			emailConfigDao.saveEmailConfig(entity);
		}
		return id;

	}

	public void deleteEmailConfig(List<String> ids) {
		emailConfigDao.deleteEmailConfig(ids);
	}

	public void disabledEmailConfig(List<String> ids) {
		emailConfigDao.disabledEmailConfig(ids);
	}
	@Transactional(readOnly = true)
	public Page<EmailConfig> findEmailConfigByPage(Page<EmailConfig> page) {
		int count = emailConfigDao.findEmailConfigCountByFilter(page);
		List<EmailConfig> cmps = emailConfigDao.findEmailConfigByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}
	@Transactional(readOnly = true)
	public List<EmailConfig> findEmailConfigByCond(Map<String, Object> pars) {
		return emailConfigDao.findEmailConfigByCond(pars);
	}
}
