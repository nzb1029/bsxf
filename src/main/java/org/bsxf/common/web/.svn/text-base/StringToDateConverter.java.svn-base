package org.bsxf.common.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.convert.converter.Converter;

/**
 * spring页面属性到对象属性绑定时，处理对象属性是日期类型
 * */
public class StringToDateConverter implements Converter<String, Date> {
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	DateFormat dfII = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Override
	public Date convert(String date) {
		//System.out.println(".....................");
		if (StringUtils.isBlank(date))
			return null;
		Date d = null;
		try {
			if (date.trim().length() == 10)
				d = df.parse(date);
			else if (date.trim().length() == 13)
				d = dfII.parse(date + ":00:00");
			else if (date.trim().length() == 16)
				d = dfII.parse(date + ":00");
			else
				d = dfII.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return d;
	}

}
