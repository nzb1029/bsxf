package org.bsxf.common.repository.akl;

import java.util.List;

import org.bsxf.common.entity.akl.Attachment;
import org.bsxf.utils.Page;
import org.springframework.stereotype.Component;

/***
 * mybatis自动扫描此目录，无需再写实现
 * */
@Component
public interface AttachmentMybatisDao {
	public Attachment getAttachment(String id);

	public List<Attachment> getAllAttachment();

	public void updateAttachment(Attachment entity);

	public void saveAttachment(Attachment entity);

	public void deleteAttachment(List<String> ids);
	
	public void deleteAttachmentWhen(Attachment entity);

	public List<Attachment> findAttachmentByFilter(Page page);

	public int findAttachmentCountByFilter(Page page);

}
