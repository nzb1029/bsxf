package org.bsxf.web;

import javax.servlet.http.HttpServletRequest;

import org.bsxf.utils.PropertiesUtils;

import com.ckfinder.connector.configuration.DefaultPathBuilder;

public class PathBuilder extends DefaultPathBuilder {

	@Override
	public String getBaseUrl(HttpServletRequest request) {
		String url = request.getContextPath() + "/static-content?contentPath=";
		return url;
	}

	@Override
	public String getBaseDir(HttpServletRequest arg0) {

		String fileDir = PropertiesUtils.getFileDir();
		return fileDir;
	}
}
