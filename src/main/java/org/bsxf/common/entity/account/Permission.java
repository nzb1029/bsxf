package org.bsxf.common.entity.account;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.bsxf.common.entity.IdEntity;

public class Permission extends IdEntity {

	 /**  描述   (@author: 宁宗彬) */      
	 private static final long serialVersionUID = 1L;
	/**
	 * @变量 val : 数值
	 */
	private String val;

	/**
	 * @变量 name : 名称
	 */
	private String name;

	/**
	 * @变量 menu : 菜单
	 */
	private Menu menu;

	/**
	 * @变量 status : 状态
	 */
	private String status = "enabled";

	/**
	 * 构造函数
	 * @类名：Permission.java 
	 * @描述：Permission实体类构造函数 
	 * 
	 */
	public Permission() {
	}

	/**
	 * 构造函数
	 * @类名：Permission.java 
	 * @描述：Permission实体类构造函数 
	 * @param name
	 * @param val
	 */
	public Permission(String name, String val) {
		this.name = name;
		this.val = val;
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
