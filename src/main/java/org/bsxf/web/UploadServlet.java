package org.bsxf.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.akl.Attachment;
import org.bsxf.common.service.akl.AttachmentManager;
import org.bsxf.utils.PropertiesUtils;
import org.json.simple.JSONObject;
import org.springside.web.SpringContextHolder;

/**
 *附件上传下载处理类
 */
public class UploadServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private AttachmentManager attachmentManager = SpringContextHolder.getBean(AttachmentManager.class);

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	private String getSubPath(String blockId, String fileType, String field01) {
		return org.bsxf.utils.FileUtils.getSubPath(blockId, fileType, field01);
	}

	/**
	 *上传处理方法
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fileType =   req.getParameter("fileType");//附件类型
		String fileName = req.getParameter("fileName");//文件名称
		String fullpath = req.getParameter("fullpath");//文件地址
		String businessId =  req.getParameter("businessId");//关联地块Id ,也是文件夹路径
		String field01 = req.getParameter("field01");//种子id
		//System.out.println(".........++++++" + fullpath);
		DiskFileItemFactory fac = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fac);
		upload.setHeaderEncoding("utf-8");
		List<FileItem> fileList = null;
		try {
			fileList = upload.parseRequest(req);

		} catch (FileUploadException ex) {
			return;
		}
		Iterator<FileItem> it = fileList.iterator();
		String name = "";
		while (it.hasNext()) {
			FileItem item = it.next();
			if (!item.isFormField()) {
				name = item.getName();
				if (name == null || name.trim().equals("")) {
					continue;
				}
				if (StringUtils.isNotBlank(fileName))
					name = fileName;
				else {
					if (StringUtils.isNotBlank(fullpath))
						name = getFinalFileName(businessId, name);
					else
						name = getFinalFileName(PropertiesUtils.getFileDir() + this.getSubPath(businessId, fileType, field01), name);
				}
				if("1".equals(fileType) || "3".equals(fileType)){
					File fileModule = new File(PropertiesUtils.getFileDir() + this.getSubPath(businessId, fileType, field01));
					if (fileModule.exists()) {
						File[] files = fileModule.listFiles();
						for (File delfile : files) {
							if (!delfile.isFile())
								continue ;
							if (delfile.exists()) 
								delfile.delete();
						}
					}
				}
				saveFile(item.getInputStream(), this.getSubPath(businessId, fileType, field01), name, fullpath);
				insertAttachment(fileType,name,this.getSubPath(businessId, fileType, field01),businessId,field01);
			}
		}
		PrintWriter out = resp.getWriter();
		if ("1".equals(fileType)) {
			// 巡检图片上传返回结果需要为json
			Map<String, Object> map =  new HashMap<String, Object>();
			map.put("chunkIndex", "0");
			out.write(JSONObject.toJSONString(map));
		} else {
			out.write(name);
		}
		out.flush();
		out.close();
	}

	public void insertAttachment(String fileType, String fileName,String fullpath, String businessId,String field01) {
		Attachment attach = new Attachment();
		attach.setFilename(fileName);
		attach.setFileType(fileType);
		attach.setFilepath(fullpath);
		attach.setField01(field01);
		attach.setBusinessId(businessId);
		attachmentManager.saveOrUpdate(attach);
		
	}

	/**
	 * 保存页面上传的品牌的LOGO
	 * */
	public String saveFile(InputStream inputStream, String module, String fname, String fullpath) {
		try {
			/*if (subfix.indexOf(".") < 0)
				subfix = "." + subfix;*/
			File fileModule = new File(PropertiesUtils.getFileDir() + module);
			if (StringUtils.isNotBlank(fullpath))
				fileModule = new File(module);
			if (!fileModule.exists())
				fileModule.mkdir();
			//String fileName = getFinalFileName(PropertiesUtils.getFileDir() + "/" + module, fname);
			File f = new File(fileModule.getPath(), fname);
			FileUtils.copyInputStreamToFile(inputStream, f);
			inputStream.close();
			return fname;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private String getFinalFileName(final String path, final String name) {
		File file = new File(path, name);
		String newFileName = name;
		int number = 0;
		while (true) {
			if (file.exists()) {
				number++;
				StringBuilder sb = new StringBuilder();
				sb.append(getFileNameWithoutExtension(name));
				sb.append("(" + number + ").");
				sb.append(getFileExtension(name));
				newFileName = sb.toString();
				file = new File(path, newFileName);
				//this.errorCode = Constants.Errors.CKFINDER_CONNECTOR_ERROR_UPLOADED_FILE_RENAMED;
			} else {
				return newFileName;
			}
		}
	}

	private String getFileNameWithoutExtension(final String fileName) {
		if (fileName == null || fileName.lastIndexOf(".") == -1) {
			return null;
		}
		return fileName.substring(0, fileName.lastIndexOf("."));
	}

	private String getFileExtension(final String fileName) {
		if (fileName == null || fileName.lastIndexOf(".") == -1 || fileName.lastIndexOf(".") == fileName.length() - 1) {
			return null;
		}
		return fileName.substring(fileName.lastIndexOf(".") + 1);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
