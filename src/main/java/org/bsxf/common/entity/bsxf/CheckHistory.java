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
	
	
	public String getRunStatusDes() {
		return runStatusDes;
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
