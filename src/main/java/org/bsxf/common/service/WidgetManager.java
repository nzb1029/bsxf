package org.bsxf.common.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.employee.Widget;
import org.bsxf.common.repository.employee.WidgetMybatisDao;
import org.bsxf.utils.Page;
import org.bsxf.web.LtSecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Identities;

/**
 * @类名称：WidgetManager   
 * @类描述：小部件数据处理类   
 * @作者：Administrator   
 * @创建时间：2014-10-24 上午10:20:38   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 上午10:20:38   
 * @修改备注：   
 * @版权：
 * @version
*/
@Component
@Transactional
public class WidgetManager {
	@Autowired
	private WidgetMybatisDao widgetDao;

	@Transactional(readOnly = true)
	public Widget getWidget(String id) {
		return widgetDao.getWidget(id);
	}

	@Transactional(readOnly = true)
	public List<Widget> getAllWidget() {
		return widgetDao.getAllWidget();
	}

	@Transactional(readOnly = true)
	public List<Widget> getUserWidget(List<String> regid) {
		return widgetDao.getUserWidget(regid);
	}

	/**
	 * @方法名: saveOrUpdate
	 * @描述: 保存或更新部件信息
	 * @参数 @param entity
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	public String saveOrUpdate(Widget entity) {

		String id = "";
		if (StringUtils.isNotBlank(entity.getId())) {
			entity.setLastUpdateTime(new Date());
			entity.setLastUpdateUser(LtSecurityUtils.getLoginUser());
			widgetDao.updateWidget(entity);
			id = entity.getId();
		} else {
			id = Identities.uuid2();
			entity.setId(id);
			entity.setCreateTime(new Date());
			entity.setCreateUser(LtSecurityUtils.getLoginUser());
			entity.setLastUpdateTime(new Date());
			entity.setLastUpdateUser(LtSecurityUtils.getLoginUser());
			widgetDao.saveWidget(entity);
		}
		return id;

	}

	public void deleteWidget(List<String> ids) {
		widgetDao.deleteWidget(ids);
	}

	public void disabledWidget(List<String> ids) {
		widgetDao.disabledWidget(ids);
	}

	public void removeWid(Map<String, Object> pars) {
		widgetDao.removeWid(pars);
	}

	/**
	 * @方法名: deleteUserWidget
	 * @描述: 用户页面删除小部件
	 * @参数 @param widgetId
	 * @参数 @param userId
	 * @返回类型 void    
	 * @throws
	 */
	public void deleteUserWidget(String widgetId, String userId) {
		Map<String, Object> pars = new HashMap<String, Object>();
		pars.put("widgetId", widgetId);
		pars.put("userId", userId);
		pars.put("id", Identities.uuid2());
		widgetDao.deleteUserWidget(pars);
	}

	public List<Widget> getUserDeleteWidget(String userId) {

		return widgetDao.getUserDeleteWidget(userId);
	}

	/**
	 * @方法名: findWidgetByPage
	 * @描述: 根据分页查找部件
	 * @参数 @param page
	 * @参数 @return
	 * @返回类型 Page<Widget>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public Page<Widget> findWidgetByPage(Page<Widget> page) {
		int count = widgetDao.findWidgetCountByFilter(page);
		List<Widget> cmps = widgetDao.findWidgetByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}

	@Transactional(readOnly = true)
	public List<Widget> findWidgetByCond(Map<String, Object> pars) {
		return widgetDao.findWidgetByCond(pars);
	}

	@Transactional(readOnly = true)
	public String getWidgetPos(Map<String, Object> pars) {
		return widgetDao.getWidgetPos(pars);
	}

	public void savePos(Map<String, Object> pars) {
		widgetDao.savePos(pars);
	}

	public void updatePos(Map<String, Object> pars) {
		widgetDao.updatePos(pars);
	}

	public List<Map<String, Object>> getUserWidgetPos(String userId) {
		return widgetDao.getUserWidgetPos(userId);
	}
}
