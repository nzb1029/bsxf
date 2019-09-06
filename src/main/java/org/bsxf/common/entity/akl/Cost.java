package org.bsxf.common.entity.akl;

import java.util.Date;

import org.bsxf.common.entity.IdEntity;
import org.bsxf.utils.Description;

public class Cost extends IdEntity {
	
    /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;

	@Description(description = "地块信息")
	private Block block;
	@Description(description = "时间")
	private Date time;
	@Description(description = "碳酸氢铵单价")
	private double tsUnitPrice;
	@Description(description = "碳酸氢铵：传统使用量(吨)")
	private double tsNormalUse;
	@Description(description = "碳酸氢铵：爱科农使用量(吨)")
	private double tsAKLUse;
	@Description(description = "复合肥单价")
	private double fhfUnitPrice;
	@Description(description = "复合肥：传统使用量(吨)")
	private double fhfNormalUse;
	@Description(description = "复合肥：爱科农使用量(吨)")
	private double fhfAKLUse;
	@Description(description = "传统 每公顷成本（传统 碳酸单价*数量+传统复合肥单价*使用量）")
	private double normalCost;
	@Description(description = "爱科农 每公顷成本（爱科农 碳酸单价*数量+爱科农复合肥单价*使用量）")
	private double aKLCost;
	
	public Block getBlock() {
		return block;
	}
	public void setBlock(Block block) {
		this.block = block;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public double getTsUnitPrice() {
		return tsUnitPrice;
	}
	public void setTsUnitPrice(double tsUnitPrice) {
		this.tsUnitPrice = tsUnitPrice;
	}
	public double getTsNormalUse() {
		return tsNormalUse;
	}
	public void setTsNormalUse(double tsNormalUse) {
		this.tsNormalUse = tsNormalUse;
	}
	public double getTsAKLUse() {
		return tsAKLUse;
	}
	public void setTsAKLUse(double tsAKLUse) {
		this.tsAKLUse = tsAKLUse;
	}
	public double getFhfUnitPrice() {
		return fhfUnitPrice;
	}
	public void setFhfUnitPrice(double fhfUnitPrice) {
		this.fhfUnitPrice = fhfUnitPrice;
	}
	public double getFhfNormalUse() {
		return fhfNormalUse;
	}
	public void setFhfNormalUse(double fhfNormalUse) {
		this.fhfNormalUse = fhfNormalUse;
	}
	public double getFhfAKLUse() {
		return fhfAKLUse;
	}
	public void setFhfAKLUse(double fhfAKLUse) {
		this.fhfAKLUse = fhfAKLUse;
	}
	public double getNormalCost() {
		return normalCost;
	}
	public void setNormalCost(double normalCost) {
		this.normalCost = normalCost;
	}
	public double getaKLCost() {
		return aKLCost;
	}
	public void setaKLCost(double aKLCost) {
		this.aKLCost = aKLCost;
	}
}
