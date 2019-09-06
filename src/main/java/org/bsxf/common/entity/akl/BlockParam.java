package org.bsxf.common.entity.akl;

import org.bsxf.common.entity.IdEntity;
import org.bsxf.utils.Description;

public class BlockParam extends IdEntity {
	
    /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;

	@Description(description = "地块信息")
	private Block block;
	@Description(description = "土壤名称")
	private String name;
	@Description(description = "PH值")
	private double ph;
	@Description(description = "PH值等级")
	private String phLevel;
	@Description(description = "氮值")
	private double totalN;
	@Description(description = "氮值等级")
	private String totalNLevel;
	@Description(description = "磷值")
	private double availableP;
	@Description(description = "磷等级")
	private String availablePLevel;
	@Description(description = "钾值")
	private double availableK;
	@Description(description = "钾等级")
	private String availableKLevel;
	@Description(description = "有机质值")
	private double sOM;
	@Description(description = "有机质等级")
	private String sOMLevel;
	public Block getBlock() {
		return block;
	}
	public void setBlock(Block block) {
		this.block = block;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPh() {
		return ph;
	}
	public void setPh(double ph) {
		this.ph = ph;
	}
	public String getPhLevel() {
		return phLevel;
	}
	public void setPhLevel(String phLevel) {
		this.phLevel = phLevel;
	}
	public double getTotalN() {
		return totalN;
	}
	public void setTotalN(double totalN) {
		this.totalN = totalN;
	}
	public String getTotalNLevel() {
		return totalNLevel;
	}
	public void setTotalNLevel(String totalNLevel) {
		this.totalNLevel = totalNLevel;
	}
	public double getAvailableP() {
		return availableP;
	}
	public void setAvailableP(double availableP) {
		this.availableP = availableP;
	}
	public String getAvailablePLevel() {
		return availablePLevel;
	}
	public void setAvailablePLevel(String availablePLevel) {
		this.availablePLevel = availablePLevel;
	}
	public double getAvailableK() {
		return availableK;
	}
	public void setAvailableK(double availableK) {
		this.availableK = availableK;
	}
	public String getAvailableKLevel() {
		return availableKLevel;
	}
	public void setAvailableKLevel(String availableKLevel) {
		this.availableKLevel = availableKLevel;
	}
	public double getsOM() {
		return sOM;
	}
	public void setsOM(double sOM) {
		this.sOM = sOM;
	}
	public String getsOMLevel() {
		return sOMLevel;
	}
	public void setsOMLevel(String sOMLevel) {
		this.sOMLevel = sOMLevel;
	}

}
