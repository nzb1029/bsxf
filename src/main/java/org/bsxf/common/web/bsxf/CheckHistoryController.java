package org.bsxf.common.web.bsxf;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.bsxf.CheckHistory;
import org.bsxf.common.entity.bsxf.CheckResult;
import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.service.bsxf.CheckHistoryManager;
import org.bsxf.common.service.bsxf.EquipmentManager;
import org.bsxf.security.ShiroDbRealm;
import org.bsxf.utils.JqGirds;
import org.bsxf.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.utils.Collections3;
import org.springside.utils.Identities;

@Controller
@RequestMapping(value = "/history")
public class CheckHistoryController {
	@Autowired
	private CheckHistoryManager historyManager ;
	@Autowired
	private EquipmentManager equipmentManager ;
	@Autowired
    private ShiroDbRealm shiroDbRealm;

	@RequestMapping(value = { "list" })
	public String list(Model model) {
		return "bsxf/checkHistoryList";
	}

	@RequestMapping(value = { "jqgrid" })
	@ResponseBody
	public Map jqgrid(HttpServletRequest request) {
		Page page = JqGirds.parmsToPage(request);
		page = historyManager.findCheckHistoryByPage(page);
		return JqGirds.renderJson(page);
	}
	
	@RequestMapping(value = { "create/{id}" })
	public String create(@PathVariable("id")String id, Model model) {
	    CheckHistory checkHistory = new CheckHistory();
		if (StringUtils.isNotBlank(id)&& !"undefined".equals(id)) {
			checkHistory = historyManager.getCheckHistory(id);
		}else{
			id = Identities.uuid2();
			checkHistory.setId(id);
		}
		
		model.addAttribute("checkHistory", checkHistory);
		return "bsxf/checkHistoryForm";
	}
	
	@RequestMapping(value = { "viewDetail/{id}" })
	public String viewDetail(@PathVariable("id")String id, Model model) {
	    CheckHistory checkHistory = new CheckHistory();
		if (StringUtils.isNotBlank(id)&& !"undefined".equals(id)) {
			checkHistory = historyManager.getCheckHistory(id);
		}
		if(StringUtils.isNotEmpty(checkHistory.getEquipment().getEno()) &&
		   StringUtils.contains(checkHistory.getEquipment().getEno(), "FHB")){
		    model.addAttribute("displayflag", "block");
		}else{
			model.addAttribute("displayflag", "none");
		}
		model.addAttribute("checkHistory", checkHistory);
		model.addAttribute("readOnly", true);
		return "bsxf/checkHistoryForm";
	}
	@RequestMapping(value = { "save" }, method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute("checkHistory") CheckHistory checkHistory, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		
		historyManager.saveOrUpdate(checkHistory);
		redirectAttributes.addFlashAttribute("message", "创建成功");
		return "redirect:/history/list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id") String id) {
		historyManager.deleteCheckHistory(Collections3.extractToList(id.split(",")));
		return "true" ;
	}

	@RequestMapping(value = "resultForm/{id}")
	public String resultForm(@PathVariable("id")String id, Model model) {
		Equipment equipment = equipmentManager.getEquipment(id);
		if (equipment == null
				|| equipment.getCheckUser() == null
				|| StringUtils.isBlank(equipment.getCheckUser().getId())) {
			model.addAttribute("submitCheckResult", "未设置巡检员，请联系管理员对该灭火器设置巡检员");
			return "bsxf/submitResult";
		}
		if(StringUtils.isNotEmpty(equipment.getEno()) &&
		   StringUtils.contains(equipment.getEno(), "FHB")){
			model.addAttribute("displayflag", "block");
		}else{
			model.addAttribute("displayflag", "none");
		}
		model.addAttribute("oldRunStatus", "");
		model.addAttribute("oldComments", "");
		model.addAttribute("oldCheckUserPassword", "");
        model.addAttribute("checkHistoryId", Identities.uuid2());
		model.addAttribute("equipment", equipment);
		model.addAttribute("submitCheckResult", "");
		return "bsxf/resultForm";
	}

	@RequestMapping(value = "submitResult" , method = RequestMethod.POST)
	public String submitResult(@Valid @ModelAttribute("checkResult") CheckResult checkResult, Model model) {
        // 验证密码
        if (shiroDbRealm.checkPassword(checkResult.getCheckUserPassword(), checkResult.getCheckUser().getId())) {
            // 更新设备信息
            String submitResult = equipmentManager.checkResult(checkResult);
            if (StringUtils.isBlank(submitResult)) {
                // 保存巡检历史
                historyManager.checkResult(checkResult);
                model.addAttribute("submitCheckResult", "巡检完成，请关闭页面");
                return "bsxf/submitResult";
            } else {
                model.addAttribute("submitCheckResult", submitResult);
            }
        } else {
            model.addAttribute("submitCheckResult", "巡检员密码有误，请重试");
        }
		model.addAttribute("oldRunStatus", checkResult.getRunStatus());
		model.addAttribute("oldComments", checkResult.getComments());
		model.addAttribute("oldCheckUserPassword", checkResult.getCheckUserPassword());
		model.addAttribute("checkHistoryId", checkResult.getCheckHistoryId());
		Equipment equipment = equipmentManager.getEquipment(checkResult.getEquipmentId());
		model.addAttribute("equipment", equipment);
		return "bsxf/resultForm";

    }
	
	@RequestMapping(value = "submitResult" , method = RequestMethod.GET)
	public String submitResult(Model model) {
		model.addAttribute("submitCheckResult", "巡检完成，请关闭页面");
		return "bsxf/submitResult";
    }
}
