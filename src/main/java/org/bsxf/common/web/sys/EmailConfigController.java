
package org.bsxf.common.web.sys;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.entity.sys.EmailConfig;
import org.bsxf.common.service.SystemManager;
import org.bsxf.common.service.bsxf.EquipmentManager;
import org.bsxf.common.service.sys.EmailConfigManager;
import org.bsxf.email.SimpleMailService;
import org.bsxf.utils.EhcacheManager;
import org.bsxf.utils.EmailUtil;
import org.bsxf.utils.ImportException;
import org.bsxf.utils.ImportUtil;
import org.bsxf.utils.JqGirds;
import org.bsxf.utils.Page;
import org.bsxf.utils.PropertiesUtils;
import org.bsxf.web.LtSecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
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

@Controller
@RequestMapping(value = "/sys/emailConfig")
public class EmailConfigController {
	@Autowired
	private EmailConfigManager emailConfigManager;
	@Autowired
	private EquipmentManager equipmentManager;
	@Autowired
	private SystemManager sysManager;
	
	

    private static Logger logger = LoggerFactory.getLogger(EmailConfigController.class);

    @RequestMapping(value = { "importHouse" })
	@ResponseBody
	public Map<String, Object> importEmailConfig(HttpServletRequest request, Model model) {
		Map<String, Object> msgMap = new HashMap<String, Object>();
		try {
		
			Map<String, Object> exmap = new HashMap<String, Object>();
			exmap.put("create_time", new Date());
			exmap.put("create_user_id", LtSecurityUtils.getLoginUser().getId());
			List<Map<String, Object>> dataList = ImportUtil.getExcelDataList(request, true, true, exmap);
		 
			 
		} catch (ImportException e) {
			msgMap.put("msg", e.getMessage());
		} catch (DuplicateKeyException e) {
			msgMap.put("msg", e.getMessage());
		} catch (Exception e) {
			msgMap.put("msg", "系统出现异常");
			e.printStackTrace();
		}

		return msgMap;
	}

	@RequestMapping(value = { "list" })
	public String list(Model model) {
		return "sys/emailConfigList";
	}

	@RequestMapping(value = { "jqgrid" })
	@ResponseBody
	public Map jqgrid(HttpServletRequest request) {
		Page<EmailConfig> page = JqGirds.parmsToPage(request);
		page = emailConfigManager.findEmailConfigByPage(page);
		return JqGirds.renderJson(page);
	}

	@RequestMapping(value = { "create" })
	public String create(HttpServletRequest request, Model model) {
		EmailConfig emailConfig  = new EmailConfig();
		 
	    List<EmailConfig> elist=	emailConfigManager.getAllEmailConfig();
	    if(elist.size()>0)
	    	emailConfig=elist.get(0);
		model.addAttribute("emailConfig", emailConfig);
		return "sys/emailConfigForm";
	}

	@RequestMapping(value = { "save" }, method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute("emailConfig")
	EmailConfig emailConfig, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		emailConfigManager.saveOrUpdate(emailConfig);
		EhcacheManager.setEmailConfig(emailConfig);
		redirectAttributes.addFlashAttribute("message", "创建成功");
		return "redirect:/sys/emailConfig/create";
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "test")
	@ResponseBody
	public String test( ) {
	     EmailConfig config = EhcacheManager.getEmailConfig();
	     if(StringUtils.isNotBlank(config.getId())){
	    	 /*******************************test begin************************************/
	    	 List<Equipment> list = equipmentManager.getAllEquipment();
		     boolean e = EmailUtil.sendMineEmailByNow(PropertiesUtils.get("email_subject") ,list ,PropertiesUtils.get("email_to"),PropertiesUtils.get("email_userName"));
	    	/****************************test begin********************************************/ 
	    	 boolean f= EmailUtil.sendSimpleEmailByNow("test", "本邮件为测试邮件", config.getUsername());
	    	if(f)
	    		 return "1";
	    	 else
	    		 return "2";
	     }else 
	    	  return "0";
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id")
	String id) {
		emailConfigManager.disabledEmailConfig(Collections3.extractToList(id.split(",")));
		return "true";
	}
	/**你好
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute("emailConfig")
	public EmailConfig getEmailConfig(@RequestParam(value = "id", required = false)
	String id) {
		if (StringUtils.isNotBlank(id))
			return emailConfigManager.getEmailConfig(id);
		else
			return new EmailConfig();
	}

}
