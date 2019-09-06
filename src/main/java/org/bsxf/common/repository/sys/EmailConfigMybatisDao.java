
package org.bsxf.common.repository.sys;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.bsxf.common.entity.sys.EmailConfig;
import org.bsxf.utils.Page;

/***
 * mybatis自动扫描此目录，无需再写实现类
 * */
@Component
public interface EmailConfigMybatisDao {
	public EmailConfig getEmailConfig(String id);

	public List<EmailConfig> getAllEmailConfig();

	public void updateEmailConfig(EmailConfig entity);

	public void saveEmailConfig(EmailConfig entity);

	public void deleteEmailConfig(List<String> ids);

	public void disabledEmailConfig(List<String> ids);

	public List<EmailConfig> findEmailConfigByFilter(Page page);

	public int findEmailConfigCountByFilter(Page page);
	
	public List<EmailConfig> findEmailConfigByCond(Map<String, Object> pars);
	
	
}
