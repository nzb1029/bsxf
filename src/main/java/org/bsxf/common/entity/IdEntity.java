package org.bsxf.common.entity;

import java.io.Serializable;
import java.util.Date;

import org.bsxf.common.entity.account.User;
import org.bsxf.utils.Description;

public abstract class IdEntity implements Serializable {
	/**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;
	@Description(description = "主键")
	protected String id;
	@Description(description = "创建时间")
	protected Date createTime;
	@Description(description = "最后修改时间")
	protected Date lastUpdateTime;
	@Description(description = "创建人")
	protected User createUser;
	@Description(description = "最后修改人")
	protected User lastUpdateUser;
	@Description(description = "扩展字段")
	protected String field01;
	@Description(description = "扩展字段")
	protected String field02;
	@Description(description = "扩展字段")
	protected String field03;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getField01() {
		return field01;
	}

	public void setField01(String field01) {
		this.field01 = field01;
	}

	public String getField02() {
		return field02;
	}

	public void setField02(String field02) {
		this.field02 = field02;
	}

	public String getField03() {
		return field03;
	}

	public void setField03(String field03) {
		this.field03 = field03;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	public User getLastUpdateUser() {
		return lastUpdateUser;
	}

	public void setLastUpdateUser(User lastUpdateUser) {
		this.lastUpdateUser = lastUpdateUser;
	}
	
}
