package org.bsxf.common.entity.bsxf;

import java.util.Date;

import org.bsxf.common.entity.IdEntity;
import org.bsxf.common.entity.account.User;
import org.bsxf.utils.Description;

public class Equipment extends IdEntity {
    /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;
	
	@Description(description = "设备类型:现在就灭火器一个")
	private String equipmentTypeId ;
	@Description(description = "灭火器类别：1: 4Kg干粉")
	private String subTypeId ;
	private String equipmentTypeName ;
	private String subTypeName ;
	@Description(description = "设备名称")
	private String name;
	@Description(description = "设备编号")
	private String eno;
	@Description(description = "区域")
	private String area;
	@Description(description = "位置")
	private String location;
	@Description(description = "详细描述")
	private String comments;
	@Description(description = "有效状态（删除时更改）：enabled; disabled")
	private String status="enabled";
	@Description(description = "状态：1-正常工作；2-运行异常")
	private String runStatus="1";
	private String runStatusDes;
	@Description(description = "有效起期")
	private Date effDate;
	@Description(description = "有效止期")
	private Date expDate;
	@Description(description = "巡检频率:1-每月一次；2-半月1次；3-10天每次；4-每周一次")
	private int checkFreq;
	private String checkFreqDes;
	@Description(description = "每月剩余巡检次数,在下个月时会将这个字段复制到lastremainNum字段，这个字段重置")
	private int remainNum;
	@Description(description = "上月剩余巡检次数(正常为0)")
	private int lastRemainNum;
	@Description(description = "巡检负责人")
	private User checkUser;
	@Description(description = "经度")
	private String pointx;
	@Description(description = "纬度")
	private String pointy;

	public String getRunStatusDes() {
		return runStatusDes;
	}
	public void setRunStatusDes(String runStatusDes) {
		this.runStatusDes = runStatusDes;
	}
	public String getCheckFreqDes() {
		return checkFreqDes;
	}
	public void setCheckFreqDes(String checkFreqDes) {
		this.checkFreqDes = checkFreqDes;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getPointx() {
		return pointx;
	}
	public void setPointx(String pointx) {
		this.pointx = pointx;
	}
	public String getPointy() {
		return pointy;
	}
	public void setPointy(String pointy) {
		this.pointy = pointy;
	}
	public String getEquipmentTypeId() {
		return equipmentTypeId;
	}
	public void setEquipmentTypeId(String equipmentTypeId) {
		this.equipmentTypeId = equipmentTypeId;
	}
	public String getSubTypeId() {
		return subTypeId;
	}
	public void setSubTypeId(String subTypeId) {
		this.subTypeId = subTypeId;
	}
	public String getEquipmentTypeName() {
		return equipmentTypeName;
	}
	public void setEquipmentTypeName(String equipmentTypeName) {
		this.equipmentTypeName = equipmentTypeName;
	}
	public String getSubTypeName() {
		return subTypeName;
	}
	public void setSubTypeName(String subTypeName) {
		this.subTypeName = subTypeName;
	}
	public String getEno() {
		return eno;
	}
	public void setEno(String eno) {
		this.eno = eno;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
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
	public Date getEffDate() {
		return effDate;
	}
	public void setEffDate(Date effDate) {
		this.effDate = effDate;
	}
	public Date getExpDate() {
		return expDate;
	}
	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}
	public int getCheckFreq() {
		return checkFreq;
	}
	public void setCheckFreq(int checkFreq) {
		this.checkFreq = checkFreq;
	}
	public int getRemainNum() {
		return remainNum;
	}
	public void setRemainNum(int remainNum) {
		this.remainNum = remainNum;
	}
	public int getLastRemainNum() {
		return lastRemainNum;
	}
	public void setLastRemainNum(int lastRemainNum) {
		this.lastRemainNum = lastRemainNum;
	}
	public User getCheckUser() {
		return checkUser;
	}
	public void setCheckUser(User checkUser) {
		this.checkUser = checkUser;
	}
}
