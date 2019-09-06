
package org.bsxf.common.web.sys;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.sys.EmialSend;
import org.bsxf.common.service.SystemManager;
import org.bsxf.common.service.sys.EmialSendManager;
import org.bsxf.utils.ImportException;
import org.bsxf.utils.ImportUtil;
import org.bsxf.utils.JqGirds;
import org.bsxf.utils.Page;
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
@RequestMapping(value = "/sys/emialSend")
public class EmialSendController {
	@Autowired
	private EmialSendManager emialSendManager;
	
	@Autowired
	private SystemManager sysManager;

    private static Logger logger = LoggerFactory.getLogger(EmialSendController.class);

    @RequestMapping(value = { "importHouse" })
	@ResponseBody
	public Map<String, Object> importEmialSend(HttpServletRequest request, Model model) {
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
		return "sys/emialSendList";
	}

	@RequestMapping(value = { "jqgrid" })
	@ResponseBody
	public Map jqgrid(HttpServletRequest request) {
		Page<EmialSend> page = JqGirds.parmsToPage(request);
		page.setOrder("sendTime", "desc");
		page = emialSendManager.findEmialSendByPage(page);
		return JqGirds.renderJson(page);
	}

	@RequestMapping(value = { "create" })
	public String create(HttpServletRequest request, Model model) {
		EmialSend emialSend  = new EmialSend();
		String id = request.getParameter("id");
		if (StringUtils.isNotBlank(id)) {
			emialSend = emialSendManager.getEmialSend(id);
		}
		
		model.addAttribute("emialSend", emialSend);
		return "sys/emialSendForm";
	}

	@RequestMapping(value = { "save" }, method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute("emialSend")
	EmialSend emialSend, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		emialSendManager.saveOrUpdate(emialSend);
		redirectAttributes.addFlashAttribute("message", "创建成功");
		return "redirect:/sys/emialSend/list";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public String delete(@PathVariable("id")
	String id) {
		emialSendManager.disabledEmialSend(Collections3.extractToList(id.split(",")));
		return "true";
	}
	/**你好
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute("emialSend")
	public EmialSend getEmialSend(@RequestParam(value = "id", required = false)
	String id) {
		if (StringUtils.isNotBlank(id))
			return emialSendManager.getEmialSend(id);
		else
			return new EmialSend();
	}

	/** 
	 *  不要绑定对象中的id属性.
	

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setDisallowedFields("id");
	}
 */

}
