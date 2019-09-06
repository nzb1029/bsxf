package org.bsxf.common.entity.sys;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.bsxf.common.entity.IdEntity;


public class Dictionary extends IdEntity {
	 /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;
	/**
	 * 字典名称
	 * */
	private String name;
	/**
	 * 字典值
	 * */
	private String val;

	private String defaultFlg = "n";

	private String status = "enabled";

	private Integer sort = 0;
	//扩展字段
	private String extFiled;

	private String typeCode;

	private Dictionary parent;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDefaultFlg() {
		return defaultFlg;
	}

	public void setDefaultFlg(String defaultFlg) {
		this.defaultFlg = defaultFlg;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getExtFiled() {
		return extFiled;
	}

	public void setExtFiled(String extFiled) {
		this.extFiled = extFiled;
	}

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}

	public Dictionary getParent() {
		return parent;
	}

	public void setParent(Dictionary parent) {
		this.parent = parent;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
