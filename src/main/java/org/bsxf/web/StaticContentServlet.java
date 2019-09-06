package org.bsxf.web;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.util.zip.GZIPOutputStream;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.bsxf.utils.PropertiesUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springside.web.Servlets;

/**
 * 本地静态内容展示与下载的Servlet.
 * 
 * 演示文件高效读取,客户端缓存控制及Gzip压缩传输.
 * 可使用org.springside.examples.showcase.cache包下的Ehcache或本地Map缓存静态内容基本信息(未演示).
 *  
 * 演示访问地址为：
 * static-content?contentPath=static/img/logo.jpg
 * static-content?contentPath=static/img/logo.jpg&download=true
 * 
 * @author calvin
 */
public class StaticContentServlet extends HttpServlet {

	private static final long serialVersionUID = -1855617048198368534L;

	/** 需要被Gzip压缩的Mime类型. */
	private static final String[] GZIP_MIME_TYPES = { "text/html", "text/xml", "text/plain", "text/css",
			"text/javascript", "application/xml", "application/xhtml+xml", "application/x-javascript" };

	/** 需要被Gzip压缩的最小文件大小. */
	private static final int GZIP_MINI_LENGTH = 512;

	private MimetypesFileTypeMap mimetypesFileTypeMap;

	private ApplicationContext applicationContext;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取得参数
		
		String contentPath = URLDecoder.decode(request.getParameter("contentPath"), "UTF-8");  
		String source = request.getParameter("source");
		String fullpath = request.getParameter("fullpath");
		if (StringUtils.isBlank(contentPath) && StringUtils.isBlank(fullpath)) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "contentPath parameter is required.");
			return;
		}
		//获取请求内容的基本信息.
		ContentInfo contentInfo = null;
		if (StringUtils.isNotBlank(contentPath))
			contentInfo = getContentInfo(contentPath);
		if (StringUtils.isNotBlank(fullpath)) {
			//System.out.println("fullpath:" + fullpath);
			contentInfo = getFillPathContentInfo(fullpath);
		}
		//System.out.println(contentInfo.file);
		if (StringUtils.isNotBlank(contentPath) && contentPath.endsWith("logo.png") && !contentInfo.file.exists()) {//logo图片不存在，返回默认图片
			contentInfo = getWebappContentInfo("static/img/logo.png");
		}
		if (StringUtils.isNotBlank(contentPath) &&(contentPath.startsWith("etype/ok/") || contentPath.startsWith("null/ok.gif"))
				&& !contentInfo.file.exists()) {//logo图片不存在，返回默认图片
			contentInfo = getWebappContentInfo("static/img/alert.gif");
		}
		if (!contentInfo.file.exists()) {
			String defPath = request.getParameter("defPath");
			if (StringUtils.isNotBlank(defPath))
				contentInfo = getWebappContentInfo(defPath);
			else
				return;
		}
		if (!contentInfo.file.exists())
			return;

		//根据Etag或ModifiedSince Header判断客户端的缓存文件是否有效, 如仍有效则设置返回码为304,直接返回.
		if (!Servlets.checkIfModifiedSince(request, response, contentInfo.lastModified)
				|| !Servlets.checkIfNoneMatchEtag(request, response, contentInfo.etag)) {
			return;
		}

		//设置Etag/过期时间
		Servlets.setExpiresHeader(response, Servlets.ONE_YEAR_SECONDS);
		Servlets.setLastModifiedHeader(response, contentInfo.lastModified);
		Servlets.setEtag(response, contentInfo.etag);

		//设置MIME类型
		response.setContentType(contentInfo.mimeType);

		//设置弹出下载文件请求窗口的Header
		if (request.getParameter("download") != null) {
			Servlets.setFileDownloadHeader(response, contentInfo.fileName);
		} else if (request.getParameter("pdf") != null) {
			response.setContentType("application/pdf");
		}

		//构造OutputStream
		OutputStream output;
		if (checkAccetptGzip(request) && contentInfo.needGzip) {
			//使用压缩传输的outputstream, 使用http1.1 trunked编码不设置content-length.
			output = buildGzipOutputStream(response);
		} else {
			//使用普通outputstream, 设置content-length.
			response.setContentLength(contentInfo.length);
			output = response.getOutputStream();
		}

		//高效读取文件内容并输出,然后关闭input file
		if (contentInfo.file.isFile())
			FileUtils.copyFile(contentInfo.file, output);
		output.flush();
	}

	/**
	 * 检查浏览器客户端是否支持gzip编码.
	 */
	private static boolean checkAccetptGzip(HttpServletRequest request) {
		//Http1.1 header
		String acceptEncoding = request.getHeader("Accept-Encoding");

		return StringUtils.contains(acceptEncoding, "gzip");
	}

	/**
	 * 设置Gzip Header并返回GZIPOutputStream.
	 */
	private OutputStream buildGzipOutputStream(HttpServletResponse response) throws IOException {
		response.setHeader("Content-Encoding", "gzip");
		response.setHeader("Vary", "Accept-Encoding");
		return new GZIPOutputStream(response.getOutputStream());
	}

	/**
	 * 初始化.
	 */
	@Override
	public void init() throws ServletException {
		//保存applicationContext以备后用，纯演示.
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());

		//初始化mimeTypes, 默认缺少css的定义,添加之.
		mimetypesFileTypeMap = new MimetypesFileTypeMap();
		mimetypesFileTypeMap.addMimeTypes("text/css css");
	}

	/**
	 * 创建Content基本信息.
	 */
	private ContentInfo getWebappContentInfo(String contentPath) {
		System.out.println("contentPath:" + contentPath);
		ContentInfo contentInfo = new ContentInfo();
		if (!StringUtils.startsWith(contentPath, "/")) {
			contentPath = "/" + contentPath;
		}
		String realFilePath = getServletContext().getRealPath(contentPath);
		//String realFilePath = PropertiesUtils.getFileDir() + contentPath;//getServletContext().getRealPath(contentPath);
		File file = new File(realFilePath);
		System.out.println(realFilePath);
		contentInfo.file = file;
		contentInfo.contentPath = contentPath;
		contentInfo.fileName = file.getName();
		contentInfo.length = (int) file.length();

		contentInfo.lastModified = file.lastModified();
		contentInfo.etag = "W/\"" + contentInfo.lastModified + "\"";

		contentInfo.mimeType = mimetypesFileTypeMap.getContentType(contentInfo.fileName);

		if (contentInfo.length >= GZIP_MINI_LENGTH && ArrayUtils.contains(GZIP_MIME_TYPES, contentInfo.mimeType)) {
			contentInfo.needGzip = true;
		} else {
			contentInfo.needGzip = false;
		}

		return contentInfo;
	}

	/**
	 * 创建Content基本信息.
	 */
	private ContentInfo getFillPathContentInfo(String contentPath) {
		ContentInfo contentInfo = new ContentInfo();
		if (!StringUtils.startsWith(contentPath, "/")) {
			//	contentPath = "/" + contentPath;
		}
		System.out.println(contentPath);
		String realFilePath = contentPath;//getServletContext().getRealPath(contentPath);
		//String realFilePath = PropertiesUtils.getFileDir() + contentPath;//getServletContext().getRealPath(contentPath);
		File file = new File(realFilePath);

		contentInfo.file = file;
		contentInfo.contentPath = contentPath;
		contentInfo.fileName = file.getName();
		contentInfo.length = (int) file.length();

		contentInfo.lastModified = file.lastModified();
		contentInfo.etag = "W/\"" + contentInfo.lastModified + "\"";

		contentInfo.mimeType = mimetypesFileTypeMap.getContentType(contentInfo.fileName);

		if (contentInfo.length >= GZIP_MINI_LENGTH && ArrayUtils.contains(GZIP_MIME_TYPES, contentInfo.mimeType)) {
			contentInfo.needGzip = true;
		} else {
			contentInfo.needGzip = false;
		}

		return contentInfo;
	}

	/**
	 * 创建Content基本信息.
	 */
	private ContentInfo getContentInfo(String contentPath) {
		ContentInfo contentInfo = new ContentInfo();
		if (!StringUtils.startsWith(contentPath, "/")) {
			contentPath = "/" + contentPath;
		}
		String realFilePath = PropertiesUtils.getFileDir() + contentPath;//getServletContext().getRealPath(contentPath);
		File file = new File(realFilePath);

		contentInfo.file = file;
		contentInfo.contentPath = contentPath;
		contentInfo.fileName = file.getName();
		contentInfo.length = (int) file.length();

		contentInfo.lastModified = file.lastModified();
		contentInfo.etag = "W/\"" + contentInfo.lastModified + "\"";

		contentInfo.mimeType = mimetypesFileTypeMap.getContentType(contentInfo.fileName);

		if (contentInfo.length >= GZIP_MINI_LENGTH && ArrayUtils.contains(GZIP_MIME_TYPES, contentInfo.mimeType)) {
			contentInfo.needGzip = true;
		} else {
			contentInfo.needGzip = false;
		}

		return contentInfo;
	}

	/**
	 * 定义Content的基本信息.
	 */
	static class ContentInfo {
		protected String contentPath;
		protected File file;
		protected String fileName;
		protected int length;
		protected String mimeType;
		protected long lastModified;
		protected String etag;
		protected boolean needGzip;
	}
}
