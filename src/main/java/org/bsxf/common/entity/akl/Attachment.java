package org.bsxf.common.entity.akl;

import java.util.Date;

import org.bsxf.common.entity.IdEntity;
import org.bsxf.utils.Description;

public class Attachment extends IdEntity {
	
    /**  描述   (@author: 宁宗彬) */      
	private static final long serialVersionUID = 1L;
	
	@Description(description = "业务ID")
	private String businessId;
	@Description(description = "上传时间")
	private Date createTime;
	@Description(description = "附件类型：1.巡检记录提交的图片；2.灭火器对应的二维码；3.设备照片；4.扩展")
	private String fileType;
	@Description(description = "文件名")
	private String filename;
	@Description(description = "文件路径")
	private String filepath;
	
	private String blockId ;
	

	public String getBusinessId() {
		return businessId;
	}
	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getBlockId() {
		return blockId;
	}
	public void setBlockId(String blockId) {
		this.blockId = blockId;
	}
	
}
