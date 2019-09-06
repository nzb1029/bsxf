package org.bsxf.common.web.sys;

import javax.servlet.http.HttpServletRequest;

import org.bsxf.common.entity.sys.Dictionary;
import org.bsxf.common.service.SystemManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @类名称：DictionaryDetailController   
 * @类描述：   
 * @作者：Administrator   
 * @创建时间：2014-10-24 下午01:51:30   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 下午01:51:30   
 * @修改备注：   
 * @版权：
 * @version
*/
@Controller
@RequestMapping(value = "/config/dictionary")
public class DictionaryDetailController {
	@Autowired
	private SystemManager systemManager;

	@RequestMapping(value = { "save/{id}" })
	public String save(Dictionary dictionary, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		System.out.println("咋回事");
		systemManager.saveOrUpdateDictionary(dictionary);
		redirectAttributes.addFlashAttribute("message", "修改字典" + dictionary.getName() + "成功");
		return "redirect:/config/dictionary/list";
	}

	@ModelAttribute("dictionary")
	public Dictionary getDictionary(@PathVariable("id")
	String id) {
		return systemManager.getDictionary(id);
	}

}
