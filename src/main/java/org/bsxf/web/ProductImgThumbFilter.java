package org.bsxf.web;

import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.bsxf.utils.PropertiesUtils;

public class ProductImgThumbFilter implements Filter {
	private static final char[] UNSAFE_FILE_NAME_CHARS = { ':', '*', '?', '|', '/' };

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException {
		String command = request.getParameter("command");
		String type = request.getParameter("type");
		if ("FILEUPLOAD".equalsIgnoreCase(command) && type.equals("product")) {
			try {
				HttpServletRequest req = (HttpServletRequest) request;
				HttpServletRequest resp = (HttpServletRequest) response;
				DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
				ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);

				List<FileItem> items = uploadHandler.parseRequest(req);
				for (FileItem item : items) {
					if (!item.isFormField()) {
						//String path = configuration.getTypes().get(this.type).getPath() + this.currentFolder;
						String path = PropertiesUtils.getFileDir();
						String fileName = getFileItemName(item);
						for (char c : UNSAFE_FILE_NAME_CHARS) {
							fileName = fileName.replace(c, '_');
						}
						try {

						} finally {
							item.delete();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	private String getFileItemName(final FileItem item) {
		Pattern p = Pattern.compile("[^\\\\/]+$");
		Matcher m = p.matcher(item.getName());

		return (m.find()) ? m.group(0) : "";
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
