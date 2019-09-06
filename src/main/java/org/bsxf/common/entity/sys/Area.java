package org.bsxf.common.entity.sys;

import org.bsxf.common.entity.IdEntity;
public class Area extends IdEntity {

	 /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;
	
	private String name;

	private String parentId;

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
