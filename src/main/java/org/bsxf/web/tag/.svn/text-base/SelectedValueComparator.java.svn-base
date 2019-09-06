package org.bsxf.web.tag;

import java.beans.PropertyEditor;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.enums.LabeledEnum;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.support.BindStatus;

public class SelectedValueComparator {
	public static boolean isSelected(BindStatus bindStatus, Object candidateValue) {
		if (bindStatus == null) {
			return candidateValue == null;
		}

		Object boundValue = bindStatus.getValue();
		if (ObjectUtils.nullSafeEquals(boundValue, candidateValue)) {
			return true;
		}
		Object actualValue = bindStatus.getActualValue();
		if ((actualValue != null) && (actualValue != boundValue)
				&& (ObjectUtils.nullSafeEquals(actualValue, candidateValue))) {
			return true;
		}
		if (actualValue != null) {
			boundValue = actualValue;
		} else if (boundValue == null) {
			return false;
		}
		//对val处理转换成数组System.out.println(".++++++bindStatus:" + boundValue);
		if (boundValue instanceof String) {
			if (boundValue.toString().indexOf(",") != -1)
				boundValue = StringUtils.split(boundValue.toString(), ",");
		}
		boolean selected = false;
		if (boundValue.getClass().isArray()) {
			selected = collectionCompare(CollectionUtils.arrayToList(boundValue), candidateValue, bindStatus);
		} else if ((boundValue instanceof Collection)) {
			selected = collectionCompare((Collection) boundValue, candidateValue, bindStatus);
		} else if ((boundValue instanceof Map)) {
			selected = mapCompare((Map) boundValue, candidateValue, bindStatus);
		}
		if (!selected) {
			selected = exhaustiveCompare(boundValue, candidateValue, bindStatus.getEditor(), null);
		}
		return selected;
	}

	private static boolean collectionCompare(Collection boundCollection, Object candidateValue, BindStatus bindStatus) {
		try {
			if (boundCollection.contains(candidateValue)) {
				return true;
			}
		} catch (ClassCastException ex) {
		}
		return exhaustiveCollectionCompare(boundCollection, candidateValue, bindStatus);
	}

	private static boolean mapCompare(Map boundMap, Object candidateValue, BindStatus bindStatus) {
		try {
			if (boundMap.containsKey(candidateValue)) {
				return true;
			}
		} catch (ClassCastException ex) {
		}
		return exhaustiveCollectionCompare(boundMap.keySet(), candidateValue, bindStatus);
	}

	private static boolean exhaustiveCollectionCompare(Collection collection, Object candidateValue,
			BindStatus bindStatus) {
		Map convertedValueCache = new HashMap(1);
		PropertyEditor editor = null;
		boolean candidateIsString = candidateValue instanceof String;
		if (!candidateIsString) {
			editor = bindStatus.findEditor(candidateValue.getClass());
		}
		for (Iterator i$ = collection.iterator(); i$.hasNext();) {
			Object element = i$.next();
			if ((editor == null) && (element != null) && (candidateIsString)) {
				editor = bindStatus.findEditor(element.getClass());
			}
			if (exhaustiveCompare(element, candidateValue, editor, convertedValueCache)) {
				return true;
			}
		}
		return false;
	}

	private static boolean exhaustiveCompare(Object boundValue, Object candidate, PropertyEditor editor,
			Map<PropertyEditor, Object> convertedValueCache) {
		String candidateDisplayString = ValueFormatter.getDisplayString(candidate, editor, false);
		if ((boundValue instanceof LabeledEnum)) {
			LabeledEnum labeledEnum = (LabeledEnum) boundValue;
			String enumCodeAsString = ObjectUtils.getDisplayString(labeledEnum.getCode());
			if (enumCodeAsString.equals(candidateDisplayString)) {
				return true;
			}
			String enumLabelAsString = ObjectUtils.getDisplayString(labeledEnum.getLabel());
			if (enumLabelAsString.equals(candidateDisplayString)) {
				return true;
			}
		} else if (boundValue.getClass().isEnum()) {
			Enum boundEnum = (Enum) boundValue;
			String enumCodeAsString = ObjectUtils.getDisplayString(boundEnum.name());
			if (enumCodeAsString.equals(candidateDisplayString)) {
				return true;
			}
			String enumLabelAsString = ObjectUtils.getDisplayString(boundEnum.toString());
			if (enumLabelAsString.equals(candidateDisplayString))
				return true;
		} else {
			if (ObjectUtils.getDisplayString(boundValue).equals(candidateDisplayString)) {
				return true;
			}
			if ((editor != null) && ((candidate instanceof String))) {
				String candidateAsString = (String) candidate;
				Object candidateAsValue;
				//	Object candidateAsValue;
				if ((convertedValueCache != null) && (convertedValueCache.containsKey(editor))) {
					candidateAsValue = convertedValueCache.get(editor);
				} else {
					editor.setAsText(candidateAsString);
					candidateAsValue = editor.getValue();
					if (convertedValueCache != null) {
						convertedValueCache.put(editor, candidateAsValue);
					}
				}
				if (ObjectUtils.nullSafeEquals(boundValue, candidateAsValue))
					return true;
			}
		}
		return false;
	}
}
