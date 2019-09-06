package org.bsxf.utils;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface Description {
	/**
	 * 字段意思，在js,和页面会自动生成
	 * */
	public String description() default "no description";

	/**
	 * 标示页面显示的类型[text,select,radio,checkbox,fck,upload]
	 * */
	public String pageType() default "text";

	/**
	 * 字典字段时，标示的字典码
	 * */
	public String typeCode() default "0001";

	/**
	 * 是否必填项
	 * */
	public String req() default "false";

	/**
	 * 字段是否做回收站显示列,是的时候写数据库字段名
	 * */
	public String recycle() default "false";
}
