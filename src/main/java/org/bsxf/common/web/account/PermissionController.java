package org.bsxf.common.web.account;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.account.Menu;
import org.bsxf.common.entity.account.Permission;
import org.bsxf.common.service.AccountManager;
import org.bsxf.common.service.PermissionManager;
import org.bsxf.utils.JqGirds;
import org.bsxf.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.utils.Collections3;

/**
 * @类名称：PermissionController   
 * @类描述：权限控制类   
 * @作者：Administrator   
 * @创建时间：2014-10-24 上午09:55:47   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 上午09:55:47   
 * @修改备注：   
 * @版权：
 * @version
*/
@Controller
@RequestMapping(value = "/permission")
public class PermissionController {
	@Autowired
	private PermissionManager permissionManager;
	@Autowired
	private AccountManager acctManager;

	/**
	 * @方法名: list
	 * @描述: 权限列表页面控制方法
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "list" })
	public String list(Model model) {
		return "permission/permissionList";
	}

	/**
	 * @方法名: jqgrid
	 * @描述: 权限表格数据加载方法，默认菜单id排序
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 Map    
	 * @throws
	 */
	@RequestMapping(value = { "jqgrid" })
	@ResponseBody
	public Map jqgrid(HttpServletRequest request) {
		Page<Permission> page = JqGirds.parmsToPage(request);
		if (StringUtils.isBlank(page.getOrderBy())) {
			page.setOrderBy("p.menu_id");
			page.setOrder("asc");

		}
		page = permissionManager.findPermissionByPage(page);
		return JqGirds.renderJson(page);
	}

	/**
	 * @方法名: menutree
	 * @描述: 菜单树控制方法，默认根目录展开
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 List<Menu>    
	 * @throws
	 */
	@RequestMapping(value = { "menutree" })
	@ResponseBody
	public List<Menu> menutree(HttpServletRequest request) {
		List<Menu> ms = acctManager.getAllMenuSelf();
		for (Menu m : ms) {
			if (m.getId().equals("1")) {
				m.setOpen("true");
			}
		}
		return ms;
	}

	/**
	 * @方法名: create
	 * @描述: 权限新增修改控制方法
	 * @参数 @param request
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "create" })
	public String create(HttpServletRequest request, Model model) {
		Permission permission = new Permission();
		String id = request.getParameter("id");
		String mid = request.getParameter("mid");
		if (StringUtils.isNotBlank(id)) {
			permission = permissionManager.getPermission(id);
		} else {
			if (StringUtils.isNotBlank(mid)) {
				Menu m = acctManager.getMenu(mid);
				permission.setMenu(m);
			}
		}
		model.addAttribute("permission", permission);
		return "permission/permissionForm";
	}

	/**
	 * @方法名: save
	 * @描述: 权限保存方法
	 * @参数 @param permission
	 * @参数 @param redirectAttributes
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "save" })
	public String save(@Valid
	@ModelAttribute("permission")
	Permission permission, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		permissionManager.saveOrUpdate(permission);
		redirectAttributes.addFlashAttribute("message", "创建成功");
		return "redirect:/permission/list";
	}

	/**
	 * @方法名: delete
	 * @描述: 权限删除方法地址后面直接跟id
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
		permissionManager.disabledPermission(Collections3.extractToList(id.split(",")));
		return "true";
	}

	/**
	 * @方法名: getPermission
	 * @描述: 根据请求参数获取权限
	 * @参数 @param id
	 * @参数 @return
	 * @返回类型 Permission    
	 * @throws
	 */
	@ModelAttribute("permission")
	public Permission getPermission(@RequestParam(value = "id", required = false)
	String id) {
		if (StringUtils.isNotBlank(id))
			return permissionManager.getPermission(id);
		else
			return new Permission();
	}

	/** 
	 *  不要绑定对象中的id属�?.
	*/

	/*	@InitBinder
		protected void initBinder(WebDataBinder binder) {
			binder.setDisallowedFields("id");
		}*/

}
