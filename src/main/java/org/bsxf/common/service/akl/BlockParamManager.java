package org.bsxf.common.service.akl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.akl.Block;
import org.bsxf.common.entity.akl.BlockParam;
import org.bsxf.common.repository.akl.BlockMybatisDao;
import org.bsxf.common.repository.akl.BlockParamMybatisDao;
import org.bsxf.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Identities;

@Component
@Transactional
public class BlockParamManager {
	@Autowired
	private BlockParamMybatisDao blockParamDao;
	@Autowired
	private BlockMybatisDao blockDao;

	@Transactional(readOnly = true)
	public BlockParam getBlockParam(String id) {
		return blockParamDao.getBlockParam(id);
	}

	@Transactional(readOnly = true)
	public BlockParam getBlockParamByBlockId(String id) {
		return blockParamDao.getBlockParamByBlockId(id);
	}

	@Transactional(readOnly = true)
	public List<BlockParam> getAllBlockParam() {
		return blockParamDao.getAllBlockParam();
	}

	public String saveOrUpdate(BlockParam entity) {

		String id = "";
		if (StringUtils.isNotBlank(entity.getId())) {
			blockParamDao.updateBlockParam(entity);
			Block block = blockDao.getBlock(entity.getBlock().getId());
			block.setSuitPlant(entity.getBlock().getSuitPlant());
			blockDao.updateBlock(block);
			id = entity.getId();
		} else {
			id = Identities.uuid2();
			entity.setId(id);
			blockParamDao.saveBlockParam(entity);
			Block block = blockDao.getBlock(entity.getBlock().getId());
			block.setSuitPlant(entity.getBlock().getSuitPlant());
			blockDao.updateBlock(block);
		}
		return id;

	}

	public void deleteBlockParam(List<String> ids) {
		blockParamDao.deleteBlockParam(ids);
	}

	@Transactional(readOnly = true)
	public Page<BlockParam> findBlockParamByPage(Page<BlockParam> page) {
		int count = blockParamDao.findBlockParamCountByFilter(page);
		List<BlockParam> cmps = blockParamDao.findBlockParamByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}
}
