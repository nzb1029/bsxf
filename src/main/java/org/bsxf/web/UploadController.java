package org.bsxf.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.akl.Attachment;
import org.bsxf.common.repository.akl.AttachmentMybatisDao;
import org.bsxf.utils.FileUtils;
import org.bsxf.utils.Page;
import org.bsxf.utils.PropertiesUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/upload")
public class UploadController {
	
	@Autowired
	private AttachmentMybatisDao attachmentDao;
	
	private Logger logger = LoggerFactory.getLogger("DBLogExample");

	@RequestMapping(value = { "toupload" })
	public String toupload(HttpServletRequest request) {
		return "upload/upload";
	}

	@RequestMapping(value = { "importXls" })
	public String importXls(HttpServletRequest request, Model model) {
		model.addAttribute("url", request.getParameter("url"));
		model.addAttribute("tempFileName", request.getParameter("tempFileName"));
		return "web/import";
	}

	@RequestMapping(value = { "importTemplete" })
	public String importTemplete(HttpServletRequest request, Model model) {
		return "web/importTemplete";
	}

	@RequestMapping(value = { "uploaddemo" })
	public String uploadDemo(HttpServletRequest request) {

		return "upload/upload-demo";
	}
	
	/**
	 * 获取上传文件子路径
	 */
	private String getSubPath(String blockId, String fileType, String field01) {
		return FileUtils.getSubPath(blockId, fileType, field01);
	}

	@RequestMapping(value = { "getFileList" })
	@ResponseBody
	public List<Map<String, String>> getFileList(HttpServletRequest request) {
		String fileType =   request.getParameter("fileType");//附件类型
		String fullpath = request.getParameter("fullpath");//文件地址
		String businessId =  request.getParameter("businessId");//业务ID
		String field01 = request.getParameter("field01");//种子id
		List<Map<String, String>> flist = new ArrayList<Map<String, String>>();
		if (StringUtils.isNotBlank(businessId)) {
			//文件夹路径

			File fileModule = new File(PropertiesUtils.getFileDir() + this.getSubPath(businessId, fileType, field01));
			if (StringUtils.isNotBlank(fullpath)) {
				fileModule = new File(this.getSubPath(businessId, fileType, field01));
			}

			if (fileModule.exists()) {
				File[] files = fileModule.listFiles();
				for (File f : files) {
					if (!f.isFile())
						continue;
					Map<String, String> fileMap = new HashMap<String, String>();
					fileMap.put("name", f.getName());
					fileMap.put("size", f.length() + "");
					if (f.getName().lastIndexOf(".") != -1)
						fileMap.put("type", f.getName().substring(f.getName().lastIndexOf(".")));
					else
						fileMap.put("type", "");
					flist.add(fileMap);
				}
			}
		}

		return flist;
	}
	
	@RequestMapping(value = { "getFileListYG" })
	@ResponseBody
	public List<Map<String, String>> getFileListYG(HttpServletRequest request) {
		String fileType =   request.getParameter("fileType");//附件类型
		String fullpath = request.getParameter("fullpath");//文件地址
		String businessId =  request.getParameter("businessId");//关联地块Id ,也是文件夹路径
		String field01 = request.getParameter("field01");//种子id
		List<Map<String, String>> flist = new ArrayList<Map<String, String>>();
		if (StringUtils.isNotBlank(businessId)) {
			//文件夹路径

			File fileModule = new File(PropertiesUtils.getFileDir() + this.getSubPath(businessId, fileType, field01));
			if (StringUtils.isNotBlank(fullpath)) {
				fileModule = new File(this.getSubPath(businessId, fileType, field01));
			}
			
			Page page = new Page();
			page.setPageNo(1);
			page.setPageSize(200);
			page.setOrder("s.filename","asc");
			Map<String, Object> filters = new TreeMap<String, Object>();
			filters.put("businessId", businessId);
			filters.put("fileType", fileType);
			page.getFilters().putAll(filters);
			List<Attachment> attachmentList = attachmentDao.findAttachmentByFilter(page);
			
			if (fileModule.exists()) {
				for (int i = 0; i < attachmentList.size(); i++) {
					Attachment attachment = attachmentList.get(i) ;
					File file = new File(PropertiesUtils.getFileDir() + this.getSubPath(businessId, fileType, field01) + File.separator + attachment.getFilename());
					if (!file.isFile())
						continue;
					Map<String, String> fileMap = new HashMap<String, String>();
					fileMap.put("name", attachment.getFilename());
					if (attachment.getFilename().lastIndexOf(".") != -1)
						fileMap.put("type", attachment.getFilename().substring(attachment.getFilename().lastIndexOf(".")));
					else
						fileMap.put("type", "");
					flist.add(fileMap);
				}
			}
		}

		return flist;
	}

	@RequestMapping(value = { "deleteFile" })
	@ResponseBody
	public String deleteFile(HttpServletRequest request) throws Exception {
		String businessId = request.getParameter("businessId");
		String fname =request.getParameter("fname");  
		String fullpath = request.getParameter("fullpath");
		String fileType =   request.getParameter("fileType");//附件类型
		String field01 = request.getParameter("field01");//种子id
		
		if (StringUtils.isNotBlank(businessId)) {
			//文件夹路径
			File delfile = new File(PropertiesUtils.getFileDir() + this.getSubPath(businessId, fileType, field01) +  File.separator + fname);
			if (StringUtils.isNotBlank(fullpath))
				delfile = new File(businessId + "/" + fname);
			if (delfile.exists()) {
				delfile.delete();
				deleteDB(businessId,fileType,field01,fname);
				logger.info(LtSecurityUtils.getLoginUser().getLoginName() + "删除文件[" + delfile.getAbsolutePath() + "]");
			} else
				return "1";//文件不存在

		} else
			return "2";//文件夹不能为空

		return "0";//删除生成
	}
	
	private void deleteDB(String businessId, String fileType, String field01, String fname) {
		Attachment entity = new Attachment();
		entity.setBusinessId(businessId);
		entity.setFileType(fileType);
		entity.setField01(field01);
		entity.setFilename(fname);
		attachmentDao.deleteAttachmentWhen(entity);
	}

	@RequestMapping(value = { "deleteMutiFile" })
	@ResponseBody
	public String deleteMutiFile(HttpServletRequest request) {
		String businessId = request.getParameter("businessId");
		String fileType =   request.getParameter("fileType");//附件类型
		String field01 = request.getParameter("field01");//种子id
		if (StringUtils.isNotBlank(businessId)) {
			//文件夹路径
			File fileModule = new File(PropertiesUtils.getFileDir() + this.getSubPath(businessId, fileType, field01));
			if (fileModule.exists()) {
				File[] files = fileModule.listFiles();
				for (File delfile : files) {
					if (!delfile.isFile())
						continue ;
					if (delfile.exists()) 
						delfile.delete();
					 else
						return "1";//文件不存在
				}
			}
		} else
			return "2";//文件夹不能为空

		return "0";//删除生成
	}

	//@RequestMapping(value = { "upload" }, method = RequestMethod.GET)
	public String uploadGet(HttpServletRequest request) {
		return "";
	}

	/*	@ResponseBody
		@RequestMapping(value = { "upload" })
		public String upload(HttpServletRequest request) {

			if (true) {
				return "1";
			}

			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			//  获得第1张图片（根据前台的name名称得到上传的文件）  
			String module = request.getParameter("module");
			System.out.println("..........." + module);
			Iterator<String> it = multipartRequest.getFileNames();
			while (it.hasNext()) {
				String fileName = it.next();
				MultipartFile uploadFile = multipartRequest.getFile(fileName);
				try {
					if (StringUtils.isNotBlank(uploadFile.getOriginalFilename())) {
						saveFile(uploadFile.getInputStream(), module, StringUtils.substringAfterLast(uploadFile
								.getOriginalFilename(), "."));
						//brand.setLogoPath(fileName);
					}
				} catch (Exception e) {
					throw new RuntimeException("保存文件出错", e);
				}
			}
			return "1";
		}

		*//**
																																				 * 保存页面上传的品牌的LOGO
																																				 * */
	/*
		public String saveFile(InputStream inputStream, String module, String subfix) {
			try {
				if (subfix.indexOf(".") < 0)
					subfix = "." + subfix;
				File fileModule = new File(PropertiesUtils.getFileDir() + "/" + module);
				if (!fileModule.exists())
					fileModule.mkdir();
				String fileName = "/" + module + "/" + System.currentTimeMillis() + subfix;
				File f = new File(PropertiesUtils.getFileDir() + fileName);
				FileUtils.copyInputStreamToFile(inputStream, f);
				inputStream.close();
				return fileName;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}*/

}
