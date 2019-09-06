package org.bsxf.common.entity.account;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.bsxf.common.entity.IdEntity;
import org.bsxf.common.entity.akl.Block;
import org.springside.utils.Collections3;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;

/**
 * 
 * @类名称：User   
 * @类描述：用户实体类 
 * @作者：Administrator   
 * @创建时间：2014-10-22 上午10:55:04   
 * @修改人：Administrator   
 * @修改时间：2014-10-22 上午10:55:04   
 * @修改备注：   
 * @版权：
 * @version
 */

public class User extends IdEntity {
	 /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;
	/**
	 * @变量 loginName : 登录名
	 */
	private String loginName;
	/**
	 * @变量 password : 密码
	 */
	private String password;
	/**
	 * @变量 name : 姓名
	 */
	private String name;
	/**
	 * @变量 email : email
	 */
	private String email;
	/**
	 * @变量 status : 状态
	 */
	private String status = "enabled";
	/**
	 * @变量 roleList : 角色表
	 */
	private List<Role> roleList = Lists.newArrayList(); //有序的关联对象集�?
	
	/**
	 * @变量 roles : 角色
	 */
	private String roles;
	/**
	 * @变量 createTime : 创建时间
	 */
	private Date createTime;
	/**
	 * @变量 isLock : 锁定状态
	 */
	private Integer isLock = 0;
	/**
	 * @变量 lockTime : 锁定时间
	 */
	private String lockTime;
	/**
	 * @变量 phoneNo : 手机号
	 */
	private String phoneNo;
	/**
	 * @变量 cardNo : 身份证
	 */
	private String cardNo;
	/**
	 * @变量 expDate : 用户过期时间
	 */
	private Date expDate;
	/**
	 * @变量 userType : 用户类型
	 */
	private String userType;
	/**
	 * @变量 plainPassword : 页面显示的密码
	 */
	private String plainPassword;
	
	private String userTypeName;
	
	/**
	 * @变量 roleList : 角色表
	 */
	private List<Block> blockList = Lists.newArrayList(); 
	
	/**
	 * 
	 * 构造函数
	 * @类名：User.java 
	 * @描述： 
	 * 
	 */
	public User() {

	}

	/**
	 * 构造函数
	 * @类名：User.java 
	 * @描述： 
	 * @param id
	 */
	public User(String id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}
	
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	@JsonIgnore
	public String getRoleNames() {
		return Collections3.extractToString(roleList, "name", ", ");
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getIsLock() {
		return isLock;
	}

	public void setIsLock(Integer isLock) {
		this.isLock = isLock;
	}

	public String getLockTime() {
		return lockTime;
	}

	public void setLockTime(String lockTime) {
		this.lockTime = lockTime;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public Date getExpDate() {
		return expDate;
	}

	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getPlainPassword() {
		return plainPassword;
	}

	public void setPlainPassword(String plainPassword) {
		this.plainPassword = plainPassword;
	}

	public String getUserTypeName() {
		return userTypeName;
	}

	public void setUserTypeName(String userTypeName) {
		this.userTypeName = userTypeName;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public List<Block> getBlockList() {
		return blockList;
	}

	public void setBlockList(List<Block> blockList) {
		this.blockList = blockList;
	}
	
	
}