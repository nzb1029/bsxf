package org.bsxf.common.web.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.employee.Widget;
import org.bsxf.common.service.SystemManager;
import org.bsxf.common.service.WidgetManager;
import org.bsxf.utils.JqGirds;
import org.bsxf.utils.Page;
import org.bsxf.web.LtSecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.mapper.JsonMapper;
import org.springside.utils.Collections3;
import org.springside.utils.Identities;
import org.springside.web.Servlets;

/**
 * @类名称：WidgetController   
 * @类描述：小部件业务控制类   
 * @作者：Administrator   
 * @创建时间：2014-10-24 上午10:16:21   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 上午10:16:21   
 * @修改备注：   
 * @版权：
 * @version
*/
@Controller
@RequestMapping(value = "/widget")
public class WidgetController {
	@Autowired
	private WidgetManager widgetManager;

	@Autowired
	private SystemManager sysManager;

	/**
	 * @方法名: list
	 * @描述: 部件列表方法
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "list" })
	public String list(Model model) {
		return "employee/widgetList";
	}

	/**
	 * @方法名: jqgrid
	 * @描述: 部件数据表格加载方法
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 Map    
	 * @throws
	 */
	@RequestMapping(value = { "jqgrid" })
	@ResponseBody
	public Map jqgrid(HttpServletRequest request) {
		Page<Widget> page = JqGirds.parmsToPage(request);
		page = widgetManager.findWidgetByPage(page);
		return JqGirds.renderJson(page);
	}

	/**
	 * @方法名: savePos
	 * @描述: 保存坐标信息，小部件在首页，有二维表格参数
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "savePos" })
	@ResponseBody
	public String savePos(HttpServletRequest request) {
		if (StringUtils.isBlank(LtSecurityUtils.getLoginUser().getId()))
			return "true";
		String dstr = request.getParameter("dstr");
		List<Map> dlist = JsonMapper.defaultMapper().fromJson(dstr, List.class, Map.class);
		Map<String, Object> pars = new HashMap<String, Object>();
		pars.put("userId", LtSecurityUtils.getLoginUser().getId());
		for (Map wmap : dlist) {
			pars.put("widgetId", wmap.get("id"));
			pars.put("col", wmap.get("col"));
			pars.put("row", wmap.get("row"));
			String id = widgetManager.getWidgetPos(pars);
			if (StringUtils.isBlank(id)) {
				pars.put("id", Identities.uuid2());
				widgetManager.savePos(pars);
			} else {
				pars.put("id", id);
				widgetManager.updatePos(pars);
			}
		}
		return "true";
	}

	/**
	 * @方法名: create
	 * @描述: 部件保存方法
	 * @参数 @param request
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "create" })
	public String create(HttpServletRequest request, Model model) {
		Widget widget = new Widget();
		String id = request.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			widget = widgetManager.getWidget(id);
		}

		model.addAttribute("widget", widget);
		return "employee/widgetForm";
	}

	/**
	 * @方法名: addWidget
	 * @描述: 新增小部件
	 * @参数 @param request
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "addWidget" })
	public String addWidget(HttpServletRequest request, Model model) {
		List<Widget> wList = widgetManager.getUserDeleteWidget(LtSecurityUtils.getShiroUser().getId());
		model.addAttribute("widList", wList);
		model.addAttribute("widget", new Widget());
		return "employee/addWidget";
	}

	/**
	 * @方法名: save
	 * @描述: 部件保存方法
	 * @参数 @param widget
	 * @参数 @param redirectAttributes
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "save" }, method = RequestMethod.POST)
	public String save(@Valid
	@ModelAttribute("widget")
	Widget widget, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		widgetManager.saveOrUpdate(widget);
		redirectAttributes.addFlashAttribute("message", "创建成功");
		return "redirect:/widget/list";
	}

	/**
	 * @方法名: delete
	 * @描述: 部件删除
	 * @参数 @param id
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id")
	String id) {
		widgetManager.disabledWidget(Collections3.extractToList(id.split(",")));
		return "true";
	}

	/**
	 * @方法名: saveAdd
	 * @描述: 部件新增保存方法
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "saveAdd")
	@ResponseBody
	public String saveAdd(HttpServletRequest request) {
		Map<String, Object> ids = Servlets.getParametersStartingWith(request, "");
		String id = ids.get("id") == null ? "" : ids.get("id").toString();
		String[] idarray = StringUtils.split(id, ",");
		Map<String, Object> pars = new HashMap<String, Object>();
		pars.put("userId", LtSecurityUtils.getLoginUser().getId());
		for (String wid : idarray) {
			pars.put("widgetId", wid);
			widgetManager.removeWid(pars);
		}
		return "true";
	}

	/**
	 * @方法名: deleteUserWidget
	 * @描述: 删除用户和部件的关联关系
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "deleteUserWidget/{id}")
	@ResponseBody
	public String deleteUserWidget(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println(id);
		widgetManager.deleteUserWidget(id, LtSecurityUtils.getLoginUser().getId());
		return "true";
	}

	/**你好
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	/**
	 * @方法名: getWidget
	 * @描述: 根据请求参数获取部件
	 * @参数 @param id
	 * @参数 @return
	 * @返回类型 Widget    
	 * @throws
	 */
	@ModelAttribute("widget")
	public Widget getWidget(@RequestParam(value = "id", required = false)
	String id) {
		if (StringUtils.isNotBlank(id))
			return widgetManager.getWidget(id);
		else
			return new Widget();
	}

	/** 
	 *  不要绑定对象中的id属性.
	

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setDisallowedFields("id");
	}
	*/

}
