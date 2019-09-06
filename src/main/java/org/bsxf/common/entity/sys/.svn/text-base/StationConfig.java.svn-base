package org.bsxf.common.entity.sys;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.bsxf.common.entity.IdEntity;

public class StationConfig extends IdEntity {
	 /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;
	//是否需要验证码
	private String authCode = "Y";
	private String authData = "Y";
	//站点名称
	private String name;
	//站点名称
	private String ename;
	private String companyName;
	private String companyAddress;
	private String companyTel;

	private String smsName;//短信账号
	private String smsPasswd;//短信密钥

	private Integer failCount = 0;

	private String intro;
	//中心坐标点
	private String pointx;
	private String pointy;

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public String getName() {
		return name;
	}

	public void setEname(String name) {
		this.ename = name;
	}

	public String getEname() {
		return ename;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public String getSmsName() {
		return smsName;
	}

	public void setSmsName(String smsName) {
		this.smsName = smsName;
	}

	public String getSmsPasswd() {
		return smsPasswd;
	}

	public void setSmsPasswd(String smsPasswd) {
		this.smsPasswd = smsPasswd;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public String getCompanyTel() {
		return companyTel;
	}

	public void setCompanyTel(String companyTel) {
		this.companyTel = companyTel;
	}

	public Integer getFailCount() {
		return failCount;
	}

	public void setFailCount(Integer failCount) {
		this.failCount = failCount;
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

	public String getAuthData() {
		return authData;
	}

	public void setAuthData(String authData) {
		this.authData = authData;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}
}
