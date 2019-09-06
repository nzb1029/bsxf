package org.bsxf.common.entity.akl;

import java.util.Date;

import org.bsxf.common.entity.IdEntity;
import org.bsxf.utils.Description;

public class BlockTrack extends IdEntity {
	
    /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;

	@Description(description = "创建时间")
	private Date createTime;
	@Description(description = "地块信息")
	private Block block;
	@Description(description = "作物发展阶段")
	private String zwfz;
	@Description(description = "病虫害预警")
	private String bchyj;
	@Description(description = "病虫防治方案")
	private String bcfzfa;
	@Description(description = "预计收获时间")
	private String yjshsj;
	@Description(description = "本周工作建议")
	private String bzgzjy;
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Block getBlock() {
		return block;
	}
	public void setBlock(Block block) {
		this.block = block;
	}
	public String getZwfz() {
		return zwfz;
	}
	public void setZwfz(String zwfz) {
		this.zwfz = zwfz;
	}
	public String getBchyj() {
		return bchyj;
	}
	public void setBchyj(String bchyj) {
		this.bchyj = bchyj;
	}
	public String getBcfzfa() {
		return bcfzfa;
	}
	public void setBcfzfa(String bcfzfa) {
		this.bcfzfa = bcfzfa;
	}
	public String getYjshsj() {
		return yjshsj;
	}
	public void setYjshsj(String yjshsj) {
		this.yjshsj = yjshsj;
	}
	public String getBzgzjy() {
		return bzgzjy;
	}
	public void setBzgzjy(String bzgzjy) {
		this.bzgzjy = bzgzjy;
	}

}
