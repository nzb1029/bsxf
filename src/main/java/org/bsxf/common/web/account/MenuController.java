package org.bsxf.common.web.account;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.account.Menu;
import org.bsxf.common.service.AccountManager;
import org.bsxf.utils.JdbcUtil;
import org.bsxf.utils.JqGirds;
import org.bsxf.utils.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.mapper.JsonMapper;
import org.springside.utils.Collections3;


/**
 * @类名称：MenuController   
 * @类描述：菜单业务控制类   
 * @作者：Administrator   
 * @创建时间：2014-10-24 上午09:45:53   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 上午09:45:53   
 * @修改备注：   
 * @版权：
 * @version
*/
@Controller
@RequestMapping(value = "/account/menu")
public class MenuController {
	
	private static Logger logger = LoggerFactory.getLogger(MenuController.class);
	
	@Autowired
	private AccountManager accountManager;

	/**
	 * @方法名: list
	 * @描述: 菜单列表页面控制类
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "list" })
	public String list(Model model) {

		return "account/menuList";
	}

	/**
	 * @方法名: mullist
	 * @描述: 多级菜单列表页面控制类
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "mullist" })
	public String mullist(Model model) {

		return "account/mulmenuList";
	}

	/**
	 * @方法名: menuTree
	 * @描述: 菜单树数据加载控制
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = "menuTree")
	@ResponseBody
	public String menuTree(Model model) {
		//Role role = accountManager.getRole(roleId);
		List<Map> menus = accountManager.getMulMenuTree();
		for (Map m : menus) {
			if (m.get("id").toString().equals("1")) {
				m.put("open", "true");
				m.put("drag", "false");
				m.put("drop", "false");
				//	m.put("drag", "false");
			}
		}
		return JsonMapper.nonDefaultMapper().toJson(menus);
	}

	/**
	 * @方法名: jqgrid
	 * @描述: 菜单列表页面数据控制方法，根据菜单登记和菜单Id可展现下级菜单数据
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 Map    
	 * @throws
	 */
	@RequestMapping(value = { "jqgrid" })
	@ResponseBody
	public Map jqgrid(HttpServletRequest request) {
		Page page = JqGirds.parmsToPageAddPower(request);
		String nodeid = request.getParameter("nodeid");
		String n_level = request.getParameter("n_level");
		if (StringUtils.isBlank(n_level))
			n_level = "0";
		else
			n_level = "" + (Integer.valueOf(n_level) + 1);
		if (StringUtils.isBlank(nodeid)) {
			page.getFilters().put("parentId", "1");
		} else
			page.getFilters().put("parentId", nodeid);
		page = accountManager.findMenuByPage(page);
		List<Menu> ms = page.getResult();
		for (Menu m : ms) {
			m.setLevel(Integer.valueOf(n_level));
		}
		return JqGirds.renderJson(page);
	}

	/**
	 * @方法名: createII
	 * @描述: 菜单创建方法2，给多级菜单树创建使用
	 * @参数 @param request
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "createII" })
	public String createII(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		String pid = request.getParameter("pid");

		Menu menu = new Menu();
		menu.setParentId(pid);
		if (StringUtils.isNotBlank(id)) {
			menu = accountManager.getMenu(id);
		}
        
		
		model.addAttribute("menu", menu);
		model.addAttribute("pmenu", accountManager.getMenu(menu.getParentId()));
		
		return "account/menuFormII";
	}

	/**
	 * @方法名: save
	 * @描述: 菜单保存方法，根据菜单的父类ID是否变化来判断是否要调整LikeId属性值（菜单等级使用）
	 * @参数 @param menu
	 * @参数 @param redirectAttributes
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "save" })
	public String save(Menu menu, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		
		accountManager.saveOrUpdateMenu(menu);
		redirectAttributes.addFlashAttribute("message", "编辑菜单[" + menu.getMenuName() + "]成功");
		//	}
		return "redirect:/account/menu/list";
	}

	/**
	 * @方法名: saveII
	 * @描述: 菜单保存方法2，多级菜单使用
	 * @参数 @param menu
	 * @参数 @param redirectAttributes
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 Map    
	 * @throws
	 */
	@RequestMapping(value = { "saveII" })
	@ResponseBody
	public Map saveII(Menu menu, RedirectAttributes redirectAttributes, HttpServletRequest request) {

		Map m = new HashMap();
		if (StringUtils.isNotBlank(menu.getId())) 
			m.put("add", "false");
		 else
			m.put("add", "true");
		m.put("name", menu.getMenuName());
		m.put("parentId", menu.getParentId());
		
		accountManager.saveOrUpdateMenuII(menu);
		
		m.put("id", menu.getId());
		return m;
	}

	/**
	 * @方法名: drop
	 * @描述: 菜单移动方法，设置父级Id和排序号
	 * @参数 @param redirectAttributes
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "drop" })
	@ResponseBody
	public String drop(RedirectAttributes redirectAttributes, HttpServletRequest request) {
		String pstr = request.getParameter("pstr");
		if (StringUtils.isNotBlank(pstr)) {
			List<Map<String, Object>> plist = JsonMapper.defaultMapper().fromJson(pstr, List.class, Map.class);
			JdbcUtil.updateBatch("update ss_menu set parent_id=:pid,sort_no=:sort where id=:id", plist);

		}
		return "true";
	}

	/**
	 * @方法名: updateSortNo
	 * @描述: 菜单单独更改排序号
	 * @参数 @param redirectAttributes
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "updateSortNo" })
	@ResponseBody
	public String updateSortNo(RedirectAttributes redirectAttributes, HttpServletRequest request) {
		String pstr = request.getParameter("pstr");
		if (StringUtils.isNotBlank(pstr)) {
			List<Map<String, Object>> plist = JsonMapper.defaultMapper().fromJson(pstr, List.class, Map.class);
			JdbcUtil.updateBatch("update ss_menu set sort_no=:sortNo where id=:id", plist);
		}
		return "true";
	}

	/**
	 * @方法名: delete
	 * @描述: 菜单删除方法
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
		
		try {
			accountManager.disabledMenu(Collections3.extractToList(id.split(",")));
		} catch (Exception e) {
			logger.error(e.getCause().getMessage());
			return "存在角色关联选中的菜单，请先在角色管理中移除与菜单的关联";
		}
		
		return "true";
	}
}
