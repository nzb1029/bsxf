package org.bsxf.common.web.bsxf;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.bsxf.CheckHistory;
import org.bsxf.common.entity.bsxf.CheckResult;
import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.service.AccountManager;
import org.bsxf.common.service.bsxf.CheckHistoryManager;
import org.bsxf.common.service.bsxf.EquipmentManager;
import org.bsxf.security.ShiroDbRealm;
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
@RequestMapping(value = "/history")
public class CheckHistoryController {
	@Autowired
	private CheckHistoryManager historyManager ;
	@Autowired
	private EquipmentManager equipmentManager ;
	@Autowired
	private AccountManager accountManager ;
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
//		if (equipment == null
//				|| equipment.getCheckUser() == null
//				|| StringUtils.isBlank(equipment.getCheckUser().getId())) {
//			model.addAttribute("submitCheckResult", "未设置巡检员，请联系管理员对该灭火器设置巡检员");
//			return "bsxf/submitResult";
//		}
		model.addAttribute("xjUserList", accountManager.getUserByType("1"));
		model.addAttribute("oldRunStatus", "");
		model.addAttribute("oldComments", "");
		model.addAttribute("oldCheckUserPassword", "");
        model.addAttribute("checkHistoryId", Identities.uuid2());
		model.addAttribute("equipment", equipment);
		return "bsxf/resultForm";
	}

	@RequestMapping(value = "submitResult" , method = RequestMethod.POST)
    @ResponseBody
	public Map<String, String> submitResult(@Valid @ModelAttribute("checkResult") CheckResult checkResult) {
	    Map<String, String> resultMap = new HashMap<>();
        // 验证密码
        if (shiroDbRealm.checkPassword(checkResult.getCheckUserPassword(), checkResult.getCheckUser().getId())) {
            // 更新设备信息
            String submitResult = equipmentManager.checkResult(checkResult);
            if (StringUtils.isBlank(submitResult)) {
                // 保存巡检历史
                historyManager.checkResult(checkResult);
                resultMap.put("msg", "巡检完成，请关闭页面");
                resultMap.put("status", "success");
            } else {
                resultMap.put("msg", submitResult);
                resultMap.put("status", "fail");
            }
        } else {
            resultMap.put("msg", "巡检员密码有误，请重试");
            resultMap.put("status", "fail");
        }
        return resultMap;

    }
}
