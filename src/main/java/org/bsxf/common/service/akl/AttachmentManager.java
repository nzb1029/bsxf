package org.bsxf.common.service.akl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.akl.Attachment;
import org.bsxf.common.repository.akl.AttachmentMybatisDao;
import org.bsxf.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Identities;

@Component
@Transactional
public class AttachmentManager {
	@Autowired
	private AttachmentMybatisDao attachmentDao;

	@Transactional(readOnly = true)
	public Attachment getAttachment(String id) {
		return attachmentDao.getAttachment(id);
	}

	@Transactional(readOnly = true)
	public List<Attachment> getAllAttachment() {
		return attachmentDao.getAllAttachment();
	}

	public String saveOrUpdate(Attachment entity) {

		String id = "";
		if (StringUtils.isNotBlank(entity.getId())) {
			attachmentDao.updateAttachment(entity);
			id = entity.getId();
		} else {
			id = Identities.uuid2();
			entity.setId(id);
			if(entity.getCreateTime() == null)
				entity.setCreateTime(new Date());
			attachmentDao.saveAttachment(entity);
		}
		return id;

	}

	public void deleteAttachment(List<String> ids) {
		attachmentDao.deleteAttachment(ids);
	}

	@Transactional(readOnly = true)
	public Page<Attachment> findAttachmentByPage(Page<Attachment> page) {
		int count = attachmentDao.findAttachmentCountByFilter(page);
		List<Attachment> cmps = attachmentDao.findAttachmentByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}
}
