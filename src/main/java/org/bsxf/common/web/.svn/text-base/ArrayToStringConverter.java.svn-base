package org.bsxf.common.web;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.convert.converter.Converter;

/**
 * spring页面属性到对象属性绑定是，有数组转换成字符串，处理checkbox
 * */
public class ArrayToStringConverter implements Converter<String[], String> {

	@Override
	public String convert(String[] list) {
		String f = StringUtils.join(list, ",");
		System.out.println("出现数组属性，判断为checkbox多选，转换成String','隔开" + f);
		return f;
	}
}
