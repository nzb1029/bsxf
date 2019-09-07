package org.bsxf.common.web.bsxf;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.service.bsxf.EquipmentManager;
import org.bsxf.utils.JqGirds;
import org.bsxf.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.utils.Collections3;
import org.springside.utils.Identities;

@Controller
@RequestMapping(value = "/equipment")
public class EquipmentController {
	@Autowired
	private EquipmentManager equipmentManager ;

	@RequestMapping(value = { "list" })
	public String list(Model model) {
		return "bsxf/equipmentList";
	}

	@RequestMapping(value = { "jqgrid" })
	@ResponseBody
	public Map jqgrid(HttpServletRequest request) {
		Page page = JqGirds.parmsToPage(request);
		page = equipmentManager.findEquipmentByPage(page);
		return JqGirds.renderJson(page);
	}
	
	@RequestMapping(value = { "create/{id}" })
	public String create(@PathVariable("id")String id, Model model) {
	    Equipment equipment = new Equipment();
		if (StringUtils.isNotBlank(id)&& !"undefined".equals(id)) {
			equipment = equipmentManager.getEquipment(id);
		}else{
			id = Identities.uuid2();
			equipment.setId(id);
		}
		
		model.addAttribute("equipment", equipment);
		
		return "bsxf/equipmentForm";
	}
	@RequestMapping(value = { "save" }, method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute("equipment") Equipment equipment, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		
		equipmentManager.saveOrUpdate(equipment);
		redirectAttributes.addFlashAttribute("message", "创建成功");
		return "redirect:/equipment/list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id") String id) {
		equipmentManager.deleteEquipment(Collections3.extractToList(id.split(",")));
		return "true" ;
	}
	
}
