package org.bsxf.common.web;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.mybatis.MapperReloadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping(value = "/static")
public class StaticController {
	@RequestMapping(value = { "fileList" })
	public String list(Model model, HttpServletRequest request) {
		String path = request.getParameter("path");
		String cpath = request.getSession().getServletContext().getRealPath("/");
		if (StringUtils.isNotBlank(path))
			cpath = path;
		String[] plist = StringUtils.split(cpath, File.separator);
		List<Map<String, Object>> flist = new ArrayList<Map<String, Object>>();
		List<String> k = new ArrayList<String>();
		for (String p : plist) {
			k.add(p);
			Map<String, Object> tmap = new HashMap<String, Object>();
			tmap.put("path", StringUtils.join(k, File.separator));
			tmap.put("name", p);
			flist.add(tmap);
		}
		model.addAttribute("plist", flist);
		try {
			model.addAttribute("path", URLEncoder.encode(cpath, "UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "static/fileList";
	}

	@RequestMapping(value = { "loadFile" })
	@ResponseBody
	public List<Map<String, Object>> loadFile(Model model, HttpServletRequest request) {
		List<Map<String, Object>> flist = new ArrayList<Map<String, Object>>();
		String path = request.getParameter("path");
		String npath = request.getParameter("npath");
		if (StringUtils.isNotBlank(npath))
			path = npath;
		File f = new File(path);
		File[] fs = f.listFiles();
		if (fs != null && fs.length > 0) {
			for (int i = 0; i < fs.length; i++) {
				File file = fs[i];
				Map<String, Object> tmap = new HashMap<String, Object>();
				tmap.put("id", System.currentTimeMillis() + "_" + i);
				tmap.put("parentId", "0");
				tmap.put("name", file.getName());

				try {
					tmap.put("npath", URLEncoder.encode(file.getAbsolutePath(), "UTF-8"));

					if (file.isFile()) {
						tmap.put("isParent ", "false");
						tmap.put("url", request.getContextPath() + "/static-content?fullpath="
								+ URLEncoder.encode(file.getAbsolutePath(), "UTF-8") + "&download=true");
					} else {
						tmap.put("url", request.getContextPath() + "/static/fileList/?path="
								+ URLEncoder.encode(file.getAbsolutePath(), "UTF-8"));
						tmap.put("isParent", "true");
					}
					tmap.put("target", "_self");
				} catch (Exception e) {
					e.printStackTrace();
				}
				flist.add(tmap);
			}
		}
		return flist;
	}

	@RequestMapping(value = { "addupload" })
	public String addupload(Model model, HttpServletRequest request) {
		return "static/addupload";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = { "uploadfile" }, method = RequestMethod.POST)
	@ResponseBody
	public String uploadfile(HttpServletRequest request, ModelMap model) {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 获得文件：     

		Iterator<String> it = multipartRequest.getFileNames();
		while (it.hasNext()) {
			MultipartFile file = multipartRequest.getFile(it.next());
			System.out.println("ffffffffffffffffff" + file.getOriginalFilename());
			System.out.println("ffffffffffffffffffmodule:" + request.getParameter("module"));
		}
		/*	DiskFileItemFactory fac = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(fac);
			upload.setHeaderEncoding("utf-8");
			List<FileItem> fileList = null;
			try {
				fileList = upload.parseRequest(request);

			} catch (FileUploadException ex) {
				ex.printStackTrace();
				return "false";
			}
			Iterator<FileItem> it = fileList.iterator();
			String name = "";
			System.out.println(it.hasNext());
			while (it.hasNext()) {
				FileItem item = it.next();
				if (!item.isFormField()) {
					name = item.getName();
					long size = item.getSize();
					String type = item.getContentType();
					if (name == null || name.trim().equals("")) {
						continue;
					}
					System.out.println(name);
				}
			}*/

		return "static/addupload";
	}

	@RequestMapping(value = { "reloadMapper" })
	@ResponseBody
	public String reloadMapper() {
		try {
			MapperReloadUtil.reloadXML();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "true";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = { "uploadAppFile" }, method = RequestMethod.POST)
	@ResponseBody
	public String uploadAppFile(HttpServletRequest request, ModelMap model) {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Iterator<String> it = multipartRequest.getFileNames();
		while (it.hasNext()) {
			MultipartFile file = multipartRequest.getFile(it.next());
			try {
				String path = request.getParameter("fpath");
				path = path.replace("/", File.separator);
				path = path.replace("\\", File.separator);
				String realPath = request.getSession().getServletContext().getRealPath("/");// System.getProperty("realPath");

				//System.out.println("上传文件：" + realPath + path);
				File f = new File(realPath + path);
				if (!f.exists()) {
					f.getParentFile().mkdirs();
					f.createNewFile();
				} else {
					//System.out.println("文件已存在，覆盖");
				}
				FileUtils.writeByteArrayToFile(f, IOUtils.toByteArray(file.getInputStream()));
				if (f.getAbsolutePath().endsWith("Mapper.xml")) {
					//System.out.println("Mapper.xml有变动，重新加载");
					try {
						MapperReloadUtil.reloadXML();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
				return e.getMessage();
			}

		}
		return "true";
	}
}
