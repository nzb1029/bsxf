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
	@Description(description = "数量")
	private Integer amount;
	@Description(description = "详细描述")
	private String comments;
	@Description(description = "有效状态（删除时更改）：enabled; disabled")
	private String status="enabled";
	@Description(description = "状态：1-正常工作；2-运行异常")
	private String runStatus="1";
	private String runStatusDes;
	@Description(description = "设备1生产日期")
	private Date productionDate;
	@Description(description = "设备1有效起期")
	private Date effDate;
	@Description(description = "设备1有效止期")
	private Date expDate;
	@Description(description = "设备2生产日期")
	private Date productionDate2;
	@Description(description = "设备2有效起期")
	private Date effDate2;
	@Description(description = "设备2有效止期")
	private Date expDate2;
	@Description(description = "设备3生产日期")
	private Date productionDate3;
	@Description(description = "设备3有效起期")
	private Date effDate3;
	@Description(description = "设备3有效止期")
	private Date expDate3;
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

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Date getProductionDate() {
		return productionDate;
	}

	public void setProductionDate(Date productionDate) {
		this.productionDate = productionDate;
	}

	public Date getProductionDate2() {
		return productionDate2;
	}

	public void setProductionDate2(Date productionDate2) {
		this.productionDate2 = productionDate2;
	}

	public Date getEffDate2() {
		return effDate2;
	}

	public void setEffDate2(Date effDate2) {
		this.effDate2 = effDate2;
	}

	public Date getExpDate2() {
		return expDate2;
	}

	public void setExpDate2(Date expDate2) {
		this.expDate2 = expDate2;
	}

	public Date getProductionDate3() {
		return productionDate3;
	}

	public void setProductionDate3(Date productionDate3) {
		this.productionDate3 = productionDate3;
	}

	public Date getEffDate3() {
		return effDate3;
	}

	public void setEffDate3(Date effDate3) {
		this.effDate3 = effDate3;
	}

	public Date getExpDate3() {
		return expDate3;
	}

	public void setExpDate3(Date expDate3) {
		this.expDate3 = expDate3;
	}
}
