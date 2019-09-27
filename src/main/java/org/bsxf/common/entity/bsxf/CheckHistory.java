package org.bsxf.common.entity.bsxf;

import java.util.Date;

import org.bsxf.common.entity.IdEntity;
import org.bsxf.common.entity.account.User;
import org.bsxf.utils.Description;

public class CheckHistory extends IdEntity {
    /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;
	
	private Equipment equipment ;
	@Description(description = "详细描述")
	private String comments;
	@Description(description = "有效状态（删除时更改）：enabled; disabled")
	private String status="enabled";
	@Description(description = "状态：1-正常工作；2-运行异常")
	private String runStatus="1";
	private String runStatusDes;
	@Description(description = "巡检负责人")
	private User checkUser;
	@Description(description = "巡检时间")
	protected Date checkTime;
	
	@Description(description = "扩展字段")
	protected String field04="1";
	@Description(description = "扩展字段")
	protected String field05="1";
	@Description(description = "扩展字段")
	protected String field06="1";
	@Description(description = "扩展字段")
	protected String field07="1";
	@Description(description = "扩展字段")
	protected String field08="1";
	@Description(description = "扩展字段")
	protected String field09="1";
	@Description(description = "扩展字段")
	protected String field10="1";
	@Description(description = "扩展字段")
	protected String field11="1";
	@Description(description = "扩展字段")
	protected String field12="1";
	@Description(description = "扩展字段")
	protected String field13="1";
	@Description(description = "扩展字段")
	protected String field14="1";
	
	public String getRunStatusDes() {
		return runStatusDes;
	}
	public String getField04() {
		return field04;
	}
	public void setField04(String field04) {
		this.field04 = field04;
	}
	public String getField05() {
		return field05;
	}
	public void setField05(String field05) {
		this.field05 = field05;
	}
	public String getField06() {
		return field06;
	}
	public void setField06(String field06) {
		this.field06 = field06;
	}
	public String getField07() {
		return field07;
	}
	public void setField07(String field07) {
		this.field07 = field07;
	}
	public String getField08() {
		return field08;
	}
	public void setField08(String field08) {
		this.field08 = field08;
	}
	public String getField09() {
		return field09;
	}
	public void setField09(String field09) {
		this.field09 = field09;
	}
	public String getField10() {
		return field10;
	}
	public void setField10(String field10) {
		this.field10 = field10;
	}
	public String getField11() {
		return field11;
	}
	public void setField11(String field11) {
		this.field11 = field11;
	}
	public String getField12() {
		return field12;
	}
	public void setField12(String field12) {
		this.field12 = field12;
	}
	public String getField13() {
		return field13;
	}
	public void setField13(String field13) {
		this.field13 = field13;
	}
	public String getField14() {
		return field14;
	}
	public void setField14(String field14) {
		this.field14 = field14;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public void setRunStatusDes(String runStatusDes) {
		this.runStatusDes = runStatusDes;
	}
	public Equipment getEquipment() {
		return equipment;
	}
	public void setEquipment(Equipment equipment) {
		this.equipment = equipment;
	}
	public Date getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public User getCreateUser() {
		return createUser;
	}
	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getRunStatus() {
		return runStatus;
	}
	public void setRunStatus(String runStatus) {
		this.runStatus = runStatus;
	}
	public User getCheckUser() {
		return checkUser;
	}
	public void setCheckUser(User checkUser) {
		this.checkUser = checkUser;
	}
	
}
