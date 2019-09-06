package org.bsxf.common.entity.account;

import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.bsxf.common.entity.IdEntity;

import com.google.common.collect.Lists;

/**
 * @类名称：Role   
 * @类描述：角色实体类   
 * @作者：Administrator   
 * @创建时间：2014-10-22 下午01:56:42   
 * @修改人：Administrator   
 * @修改时间：2014-10-22 下午01:56:42   
 * @修改备注：   
 * @版权：
 * @version
*/

public class Role extends IdEntity {

	 /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;
	/**
	 * @变量 name :	角色名称
	 */
	private String roleName;
	/**
	 * @变量 alias : 别名
	 */
	private String alias;
	/**
	 * @变量 remark : 备注
	 */
	private String remark;
	/**
	 * @变量 menuList : 有序的关联对象集合
	 */
	private List<Menu> menuList = Lists.newArrayList();

	/**
	 * @变量 status : 状态
	 */
	private String status = "enabled";

	/**
	 * @变量 permissions : 权限
	 */
	private String permissions;

	/**
	 * @变量 permList : 权限集合
	 */
	private List<String> permList;
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<Menu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}


	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public String getPermissions() {
		return permissions;
	}

	public void setPermissions(String permissions) {
		this.permissions = permissions;
	}

	/**
	 * 为了页面的操作方便
	 * */
	public List<String> getPermList() {
		if (StringUtils.isBlank(permissions))
			return null;
		return Arrays.asList(permissions.split(","));
	}

	public void setPermList(List<String> permList) {
		this.permissions = StringUtils.join(permList, ",");
	}


	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


	
}
