package org.bsxf.web.tag;

import java.beans.PropertyEditor;

import org.springframework.util.ObjectUtils;
import org.springframework.web.util.HtmlUtils;

public class ValueFormatter {
	public static String getDisplayString(Object value, boolean htmlEscape) {
		String displayValue = ObjectUtils.getDisplayString(value);
		return htmlEscape ? HtmlUtils.htmlEscape(displayValue) : displayValue;
	}

	public static String getDisplayString(Object value, PropertyEditor propertyEditor, boolean htmlEscape) {
		if ((propertyEditor != null) && (!(value instanceof String))) {
			try {
				propertyEditor.setValue(value);
				String text = propertyEditor.getAsText();
				if (text != null) {
					return getDisplayString(text, htmlEscape);
				}
			} catch (Throwable ex) {
			}
		}
		return getDisplayString(value, htmlEscape);
	}
}
