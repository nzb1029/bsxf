package org.bsxf.common.web.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.sys.StationConfig;
import org.bsxf.common.service.StationConfigManager;
import org.bsxf.utils.EhcacheManager;
import org.bsxf.utils.JdbcUtil;
import org.bsxf.utils.JqGirds;
import org.bsxf.utils.Page;
import org.bsxf.utils.PropertiesUtils;
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
 * @类名称：StationConfigController   
 * @类描述：省市区设置控制器   
 * @作者：Administrator   
 * @创建时间：2014-10-24 上午10:57:13   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 上午10:57:13   
 * @修改备注：   
 * @版权：
 * @version
*/
@Controller
@RequestMapping(value = "/stationConfig")
public class StationConfigController {
	@Autowired
	private StationConfigManager stationConfigManager;

	@RequestMapping(value = { "list" })
	public String list(Model model) {
		return "stationConfig/stationConfigList";
	}

	@RequestMapping(value = { "areaList" })
	public String areaList(Model model) {
		return "stationConfig/areaList";
	}

	@RequestMapping(value = { "areaform" })
	public String areaform(Model model, HttpServletRequest request) {
		model.addAttribute("pid", request.getParameter("pid"));
		return "stationConfig/areaForm";
	}

	/**
	 * @方法名: areasave
	 * @描述: 地区信息保存
	 * @参数 @param model
	 * @参数 @param request
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "areasave" })
	@ResponseBody
	public String areasave(Model model, HttpServletRequest request) {
		String pid = (request.getParameter("pid"));
		String name = (request.getParameter("name"));
		List<Map<String, Object>> fp = JdbcUtil.executeQuery("select max(id) as id from ss_area where parent_id='"
				+ pid + "'", new HashMap<String, Object>());
		if (fp.size() > 0) {
			Map<String, Object> f = fp.get(0);
			Integer id = Integer.valueOf(f.get("id").toString()) + 1;
			JdbcUtil.executeUpdate("insert into ss_area (id,name,parent_id) values('" + id + "','" + name + "','" + pid
					+ "')", new HashMap<String, Object>());

		} else
			return "false";
		return "true";
	}

	@RequestMapping(value = { "areatree" })
	@ResponseBody
	public List<Map<String, Object>> areatree(HttpServletRequest request) {
		List<Map<String, Object>> ms = stationConfigManager.getAllAreaTree();
		/*for (Menu m : ms) {
			if (m.getId().equals("1")) {
				m.setOpen("true");
			}
		}*/
		return ms;
	}

	@RequestMapping(value = { "jqgrid" })
	@ResponseBody
	public Map jqgrid(HttpServletRequest request) {
		Page<StationConfig> page = JqGirds.parmsToPage(request);
		page = stationConfigManager.findStationConfigByPage(page);
		return JqGirds.renderJson(page);
	}

	@RequestMapping(value = { "reload" })
	@ResponseBody
	public String reload(HttpServletRequest request, Model model) {
		PropertiesUtils.reload();
		return "true";
	}

	@RequestMapping(value = { "create" })
	public String create(HttpServletRequest request, Model model) {
		StationConfig stationConfig = new StationConfig();
		List<StationConfig> slist = stationConfigManager.getAllStationConfig();
		if (slist.size() > 0) {
			stationConfig = slist.get(0);
		}
		model.addAttribute("stationConfig", stationConfig);
		return "stationConfig/stationConfigForm";
	}

	@RequestMapping(value = { "save" })
	public String save(@Valid
	@ModelAttribute("stationConfig")
	StationConfig stationConfig, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		stationConfigManager.saveOrUpdate(stationConfig);
		EhcacheManager.setStationConfig(stationConfig);
		redirectAttributes.addFlashAttribute("message", "配置成功");
		return "redirect:/stationConfig/create";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id")
	String id) {
		stationConfigManager.deleteStationConfig(Collections3.extractToList(id.split(",")));
		return "true";
	}

	/**
	 * �?��RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效�?先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上�?
	 * 因为仅update()方法的form中有id属�?，因此仅在update时实际执�?
	 */
	@ModelAttribute("stationConfig")
	public StationConfig getStationConfig(@RequestParam(value = "id", required = false)
	String id) {
		if (StringUtils.isNotBlank(id))
			return stationConfigManager.getStationConfig(id);
		else
			return new StationConfig();
	}

	/** 
	 *  不要绑定对象中的id属�?.
	*/

	/*@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setDisallowedFields("id");
	}*/

}
