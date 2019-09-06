package org.bsxf.common.entity.akl;

import java.util.Date;

import org.bsxf.common.entity.IdEntity;
import org.bsxf.common.entity.account.User;
import org.bsxf.common.entity.sys.Area;
import org.bsxf.utils.Description;

public class Block extends IdEntity {
    /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;
	
	@Description(description = "地块名称")
	private String name ;
	@Description(description = "创建时间")
	private Date createTime;
	@Description(description = "创建人")
	private User createUser;
	@Description(description = "状态:是否有效")
	private String status="enabled";
	@Description(description = "经度")
	private String pointx;
	@Description(description = "纬度")
	private String pointy;
	@Description(description = "地址省")
	private Area provice;
	@Description(description = "地址市")
	private Area city ;
	@Description(description = "详细地址")
	private String address;
	@Description(description = "归属用户")
	private User user;
	@Description(description = "地块生产潜力")
	private String blockProduct;
	@Description(description = "限制因素")
	private String blockLimit;
	@Description(description = "适合种植的品种;多个以逗号隔开")
	private String suitPlant;
	@Description(description = "监测站点")
	private String monitorSite;
	
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getBlockProduct() {
		return blockProduct;
	}
	public void setBlockProduct(String blockProduct) {
		this.blockProduct = blockProduct;
	}
	public String getBlockLimit() {
		return blockLimit;
	}
	public void setBlockLimit(String blockLimit) {
		this.blockLimit = blockLimit;
	}
	public String getSuitPlant() {
		return suitPlant;
	}
	public void setSuitPlant(String suitPlant) {
		this.suitPlant = suitPlant;
	}
	public Area getProvice() {
		return provice;
	}
	public void setProvice(Area provice) {
		this.provice = provice;
	}
	public Area getCity() {
		return city;
	}
	public void setCity(Area city) {
		this.city = city;
	}
	public String getMonitorSite() {
		return monitorSite;
	}
	public void setMonitorSite(String monitorSite) {
		this.monitorSite = monitorSite;
	}

	
}
