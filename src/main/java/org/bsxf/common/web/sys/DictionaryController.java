package org.bsxf.common.web.sys;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.sys.Dictionary;
import org.bsxf.common.service.SystemManager;
import org.bsxf.utils.JqGirds;
import org.bsxf.utils.Page;
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
import org.springside.utils.Collections3;

/**
 * @类名称：DictionaryController   
 * @类描述：字典管理  
 * @作者：Administrator   
 * @创建时间：2014-10-24 下午01:51:10   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 下午01:51:10   
 * @修改备注：   
 * @版权：
 * @version
*/
@Controller
@RequestMapping(value = "/config/dictionary")
public class DictionaryController {
	@Autowired
	private SystemManager systemManager;

	@RequestMapping(value = { "list" })
	public String list(Model model) {
		return "config/dictionaryList";
	}

	@RequestMapping(value = { "jqgrid" })
	@ResponseBody
	public Map jqgrid(HttpServletRequest request) {
		Page page = JqGirds.parmsToPage(request);
		String pid = request.getParameter("pid");
		if (StringUtils.isNotBlank(pid)) {
			page.getFilters().put("parentId", pid);
			page.setOrder("sort", "asc");
		} else
			page.setOrder("typeCode", "asc");
		page = systemManager.findDictionaryByPage(page);
		return JqGirds.renderJson(page);
	}

	@RequestMapping(value = { "create" })
	public String create(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		String mt = request.getParameter("mt");
		Dictionary dictionary = new Dictionary();
		if (StringUtils.isNotBlank(mt)) {
			if (mt.equals("add")) {// add sub
				Dictionary pd = systemManager.getDictionary(id);
				dictionary.setParent(pd);
			} else {//edit sub
				dictionary = systemManager.getDictionary(id);
			}
		} else {
			if (StringUtils.isNotBlank(id)) {
				dictionary = systemManager.getDictionary(id);
			}
		}

		model.addAttribute("dictionary", dictionary);

		return "config/dictionaryForm";
	}

	@RequestMapping(value = { "save" }, method = RequestMethod.POST)
	public String save(@ModelAttribute("dictionary")
	Dictionary dictionary, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		systemManager.saveOrUpdateDictionary(dictionary);
		Map<String, List<Dictionary>> dMap = (Map<String, List<Dictionary>>) request.getSession().getServletContext()
				.getAttribute("dic");
		List<Dictionary> dlist = systemManager.getDictionaryByCode(dictionary.getTypeCode());
		dMap.put(dictionary.getTypeCode(), dlist);
		redirectAttributes.addFlashAttribute("message", "创建字典" + dictionary.getName() + "成功");
		return "redirect:/config/dictionary/list";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id")
	String id, HttpServletRequest request) {
		List<Dictionary> rlist = new ArrayList<Dictionary>();
		for (String idd : id.split(",")) {

			Dictionary dictionary = systemManager.getDictionary(idd);

			rlist.add(dictionary);
		}
		systemManager.disabledDictionary(Collections3.extractToList(id.split(",")));
		Map<String, List<Dictionary>> dMap = (Map<String, List<Dictionary>>) request.getSession().getServletContext()
				.getAttribute("dic");
		for (Dictionary dictionary : rlist) {

			//Dictionary dictionary = systemManager.getDictionary(idd);
			List<Dictionary> dlist = systemManager.getDictionaryByCode(dictionary.getTypeCode());
			dMap.put(dictionary.getTypeCode(), dlist);
		}
		return "true";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "enabled/{id}")
	@ResponseBody
	public String enabled(@PathVariable("id")
	String id, HttpServletRequest request) {
		systemManager.disabledDictionary(Collections3.extractToList(id.split(",")));
		Map<String, List<Dictionary>> dMap = (Map<String, List<Dictionary>>) request.getSession().getServletContext()
				.getAttribute("dic");
		for (String idd : id.split(",")) {
			Dictionary dictionary = systemManager.getDictionary(idd);
			List<Dictionary> dlist = systemManager.getDictionaryByCode(dictionary.getTypeCode());
			dMap.put(dictionary.getTypeCode(), dlist);
		}

		return "true";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "sort")
	@ResponseBody
	public String sort(HttpServletRequest request) {
		String id = request.getParameter("id");
		String tp = request.getParameter("tp");
		Dictionary dictionary = systemManager.getDictionary(id);
		Page page = new Page(100);
		page.getFilters().put("parentId", dictionary.getParent().getId());
		page.setOrder("sort", "asc");
		page = systemManager.findDictionaryByPage(page);
		List<Dictionary> dList = page.getResult();
		for (int i = 0; i < dList.size(); i++) {
			Dictionary d = dList.get(i);
			d.setSort(i + 1);
			if (d.getId().equals(id)) {
				if (tp.equals("down") && i != (dList.size() - 1)) {
					d.setSort(i + 2);
					dList.get(i + 1).setSort(i + 1);
					i++;
				} else if (tp.equals("up") && i != 0) {
					d.setSort(i);
					dList.get(i - 1).setSort(i + 1);
				}
			}
		}
		if (dList.size() > 0)
			systemManager.updateSort(dList);
		Map<String, List<Dictionary>> dMap = (Map<String, List<Dictionary>>) request.getSession().getServletContext()
				.getAttribute("dic");
		//System.out.println(dictionary.getTypeCode());
		List<Dictionary> dlist = systemManager.getDictionaryByCode(dictionary.getTypeCode());
		//for (Dictionary d : dlist)
		//	System.out.println(d.getName());
		dMap.put(dictionary.getTypeCode(), dlist);
		return "true";
	}

	@ModelAttribute("dictionary")
	public Dictionary getDictionary(@RequestParam(value = "id", required = false)
	String id) {
		if (StringUtils.isNotBlank(id))
			return systemManager.getDictionary(id);
		else
			return new Dictionary();
	}

	/** 
	 *  不要绑定对象中的id属性.
	*/

	/*@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setDisallowedFields("id");
	}*/
}
