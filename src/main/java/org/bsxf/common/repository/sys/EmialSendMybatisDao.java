
package org.bsxf.common.repository.sys;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.bsxf.common.entity.sys.EmialSend;
import org.bsxf.utils.Page;

/***
 * mybatis自动扫描此目录，无需再写实现类
 * */
@Component
public interface EmialSendMybatisDao {
	public EmialSend getEmialSend(String id);

	public List<EmialSend> getAllEmialSend();

	public void updateEmialSend(EmialSend entity);

	public void saveEmialSend(EmialSend entity);

	public void deleteEmialSend(List<String> ids);

	public void disabledEmialSend(List<String> ids);

	public List<EmialSend> findEmialSendByFilter(Page page);

	public int findEmialSendCountByFilter(Page page);
	
	public List<EmialSend> findEmialSendByCond(Map<String, Object> pars);
	
	
}
