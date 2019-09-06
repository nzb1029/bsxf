package org.bsxf.common.web.akl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.akl.Block;
import org.bsxf.common.entity.akl.BlockParam;
import org.bsxf.common.service.akl.BlockManager;
import org.bsxf.common.service.akl.BlockParamManager;
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

@Controller
@RequestMapping(value = "/param")
public class BlockParamController {
	@Autowired
	private BlockParamManager blockParamManager ;
	@Autowired
	private BlockManager blockManager ;

	@RequestMapping(value = { "list" })
	public String list(Model model) {
		return "akl/blockParamList";
	}

	@RequestMapping(value = { "jqgrid" })
	@ResponseBody
	public Map jqgrid(HttpServletRequest request) {
		Page page = JqGirds.parmsToPage(request);
		page = blockParamManager.findBlockParamByPage(page);
		return JqGirds.renderJson(page);
	}
	
	@RequestMapping(value = { "create/{id}" })
	public String create(@PathVariable("id")String id, Model model) {
	    BlockParam blockParam = new BlockParam();
		if (StringUtils.isNotBlank(id)&& !"undefined".equals(id)) {
			blockParam = blockParamManager.getBlockParam(id);
		}
		
		List<Block> blockList=blockManager.getAllBlock();
		
		model.addAttribute("blockList", blockList);
		model.addAttribute("blockParam", blockParam);
		
		return "akl/blockParamForm";
	}
	@RequestMapping(value = { "save" }, method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute("blockParam") BlockParam blockParam, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		
		blockParamManager.saveOrUpdate(blockParam);
		redirectAttributes.addFlashAttribute("message", "创建成功");
		return "redirect:/param/list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id") String id) {
		blockParamManager.deleteBlockParam(Collections3.extractToList(id.split(",")));
		return "true" ;
	}
	
}
