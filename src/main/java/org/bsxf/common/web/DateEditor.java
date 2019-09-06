package org.bsxf.common.web;

import java.beans.PropertyEditorSupport;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

public class DateEditor extends PropertyEditorSupport {
	String format = "yyyy-MM-dd";
	String formatII = "yyyy-MM-dd hh:mm:ss";
	DateFormat df = new SimpleDateFormat(format);
	DateFormat dfII = new SimpleDateFormat(format);

	@Override
	public void setAsText(String dateStr) throws IllegalArgumentException {
		Date d = this.parseToDate(dateStr);
		this.setValue(d);
	}

	private Date parseToDate(String date) {
		if (StringUtils.isBlank(date))
			return null;

		Date d = null;
		try {
			if (date.trim().length() == 10)
				d = df.parse(date);
			else
				d = dfII.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return d;
	}
}
