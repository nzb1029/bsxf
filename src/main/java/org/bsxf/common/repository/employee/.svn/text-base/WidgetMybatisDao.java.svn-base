package org.bsxf.common.repository.employee;

import java.util.List;
import java.util.Map;

import org.bsxf.common.entity.employee.Widget;
import org.bsxf.utils.Page;
import org.springframework.stereotype.Component;

/***
 * mybatis�Զ�ɨ���Ŀ¼��������дʵ����
 * */
@Component
public interface WidgetMybatisDao {
	public Widget getWidget(String id);

	public void deleteUserWidget(Map<String, Object> pars);

	public List<Widget> getUserDeleteWidget(String id);

	public List<Widget> getAllWidget();

	public List<Widget> getUserWidget(List<String> regid);

	public void updateWidget(Widget entity);

	public void saveWidget(Widget entity);

	public void deleteWidget(List<String> ids);

	public void removeWid(Map<String, Object> pars);

	public void disabledWidget(List<String> ids);

	public List<Widget> findWidgetByFilter(Page page);

	public int findWidgetCountByFilter(Page page);

	public List<Widget> findWidgetByCond(Map<String, Object> pars);

	public String getWidgetPos(Map<String, Object> pars);

	public void savePos(Map<String, Object> pars);

	public void updatePos(Map<String, Object> pars);

	public List<Map<String, Object>> getUserWidgetPos(String userId);

}
