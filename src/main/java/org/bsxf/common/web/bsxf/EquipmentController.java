package org.bsxf.common.web.bsxf;

import java.io.*;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.service.bsxf.EquipmentManager;
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
@RequestMapping(value = "/equipment")
public class EquipmentController {
	@Autowired
	private EquipmentManager equipmentManager ;

	@RequestMapping(value = { "list" })
	public String list(Model model) {
		return "bsxf/equipmentList";
	}
	
	@RequestMapping(value = { "zxingList" })
	public String zxingList(Model model) {
		return "bsxf/equipmentZxingList";
	}
	
	@RequestMapping(value = { "userList" })
	public String userList(Model model) {
		return "bsxf/equipmentUserList";
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
	@RequestMapping(value = { "viewDetail/{id}" })
	public String viewDetail(@PathVariable("id")String id, Model model) {
	    Equipment equipment = new Equipment();
		if (StringUtils.isNotBlank(id)&& !"undefined".equals(id)) {
			equipment = equipmentManager.getEquipment(id);
		}
		model.addAttribute("equipment", equipment);
		model.addAttribute("readOnly", true);
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

	@RequestMapping(value = "importEquipmentList", method = RequestMethod.POST)
    @ResponseBody
	public String importEquipmentList(@RequestParam("file") MultipartFile file) {
	    String msg = equipmentManager.importEquipmentList(file);
		return StringUtils.isNotBlank(msg) ? msg : "true";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "print/{id}")
	@ResponseBody
	public String print(@PathVariable("id") String id,RedirectAttributes redirectAttributes, HttpServletRequest request) {
		//equipmentManager.deleteEquipment(Collections3.extractToList(id.split(",")));
		//TODO
		return "true" ;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "printAll")
	@ResponseBody
	public String printAll(RedirectAttributes redirectAttributes, HttpServletRequest request) {
		//TODO
		//equipmentManager.deleteEquipment(Collections3.extractToList(id.split(",")));
		return "true" ;
	}

	@RequestMapping(value = "generateQrcodefile", method = RequestMethod.POST)
	@ResponseBody
	public String generateQrcodefile(@RequestBody List<String> idList) {
		try {
			String fileName = System.currentTimeMillis() + "";
			if (equipmentManager.generateQrcodefile(idList, fileName)) {
				return fileName;
			} else {
				return "";
			}
		} catch (Exception e) {
			return "";
		}
	}

	@RequestMapping(value = "downloadQrcodefile/{fileName}", method = RequestMethod.GET)
	public void downloadQrcode(@PathVariable("fileName") String fileName, HttpServletResponse response) {
		// 读到流中
		InputStream inStream = null;// 文件的存放路径
		try {
			inStream = new FileInputStream(equipmentManager.getQrcodePath(fileName));
			String downloadFileName = URLEncoder.encode(equipmentManager.getQrcodeFileName("二维码"),"UTF-8");
			// 设置输出的格式
			response.reset();
			response.setContentType("bin");
			response.addHeader("Content-Disposition", "attachment; filename=\"" + downloadFileName + "\"");
			byte[] b = new byte[100];
			int len;
			while ((len = inStream.read(b)) > 0) {
				response.getOutputStream().write(b, 0, len);
			}
			// 循环取出流中的数据
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (inStream != null) {
				try {
					inStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@RequestMapping(value = "resultForm/{id}")
	public String resultForm(@PathVariable("id")String id, Model model) {
		Equipment equipment = equipmentManager.getEquipment(id);
		model.addAttribute("equipment", equipment);
		return "bsxf/resultForm";
	}

	@RequestMapping(value = "submitResult" , method = RequestMethod.POST)
	public String submitResult(@Valid @ModelAttribute("equipment") Equipment equipment, Model model) {
		// TODO 巡检员密码判断
		System.out.println(equipment.getId());
		System.out.println(equipment.getUserPassword());
		if (equipmentManager.updateRunStatus(equipment)) {
			model.addAttribute("submitResult", "提交成功");
		} else {
			model.addAttribute("submitResult", "提交失败，请重试");
		}
		return "bsxf/submitResult";

	}
}
