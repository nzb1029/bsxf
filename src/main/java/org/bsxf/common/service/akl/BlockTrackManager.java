package org.bsxf.common.service.akl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.akl.Block;
import org.bsxf.common.entity.akl.BlockTrack;
import org.bsxf.common.repository.akl.BlockTrackMybatisDao;
import org.bsxf.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Identities;

@Component
@Transactional
public class BlockTrackManager {
	@Autowired
	private BlockTrackMybatisDao blockTrackDao;

	@Transactional(readOnly = true)
	public BlockTrack getBlockTrack(String id) {
		return blockTrackDao.getBlockTrack(id);
	}

	@Transactional(readOnly = true)
	public List<BlockTrack> getAllBlockTrack() {
		return blockTrackDao.getAllBlockTrack();
	}

	public String saveOrUpdate(BlockTrack entity) {

		String id = "";
		if (StringUtils.isNotBlank(entity.getId())) {
			blockTrackDao.updateBlockTrack(entity);
			id = entity.getId();
		} else {
			id = Identities.uuid2();
			entity.setId(id);
			entity.setCreateTime(new Date());
			blockTrackDao.saveBlockTrack(entity);
		}
		return id;

	}

	public void deleteBlockTrack(List<String> ids) {
		blockTrackDao.deleteBlockTrack(ids);
	}

	@Transactional(readOnly = true)
	public Page<BlockTrack> findBlockTrackByPage(Page<BlockTrack> page) {
		int count = blockTrackDao.findBlockTrackCountByFilter(page);
		List<BlockTrack> cmps = blockTrackDao.findBlockTrackByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}

	public List<BlockTrack> getTrackListByBlockId(String blockId) {
		// TODO Auto-generated method stub
		return blockTrackDao.getTrackListByBlockId(blockId);
	}
}
