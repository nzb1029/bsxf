package org.bsxf.common.entity.account;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.bsxf.common.entity.IdEntity;

import com.google.common.collect.Lists;

public class Menu extends IdEntity {
	
    /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;
	/**
	 * @变量 menuName : 菜单名称
	 */
	private String menuName;
	/**
	 * @变量 parentId : 父菜单ID
	 */
	private String parentId;
	/**
	 * @变量 link : 链接
	 */
	private String link;
	/**
	 * @变量 menuList : 菜单集合
	 */
	private List<Menu> menuList = Lists.newArrayList(); //有序的关联对象集合
	/**
	 * @变量 sortNo : 排序
	 */
	private Integer sortNo = 0;
	/**
	 * @变量 status : 状态
	 */
	private String status = "enabled";
	/**
	 * @变量 open : 给树用
	 */
	private String open;
	

	public Integer getSortNo() {
		return sortNo;
	}

	public void setSortNo(Integer sortNo) {
		this.sortNo = sortNo;
	}

	private Integer level = 0;
	private boolean isLeaf = false;
	private boolean expanded = false;

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public boolean getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	public boolean isExpanded() {
		return expanded;
	}

	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}
	
	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public List<Menu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
