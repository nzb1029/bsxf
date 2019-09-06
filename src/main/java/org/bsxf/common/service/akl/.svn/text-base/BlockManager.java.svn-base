package org.bsxf.common.service.akl;

import java.util.Date;
import java.util.List;

import org.bsxf.common.entity.akl.Block;
import org.bsxf.common.repository.akl.BlockMybatisDao;
import org.bsxf.utils.Page;
import org.bsxf.web.LtSecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@Transactional
public class BlockManager {
	@Autowired
	private BlockMybatisDao blockDao;

	@Transactional(readOnly = true)
	public Block getBlock(String id) {
		return blockDao.getBlock(id);
	}

	@Transactional(readOnly = true)
	public List<Block> getAllBlock() {
		return blockDao.getAllBlock();
	}

	public String saveOrUpdate(Block entity) {
        //Block 比较特殊，进页面时就生成了主键，所以这里要改一下。
		String id = "";
		if (this.getBlock(entity.getId()) != null) {
			blockDao.updateBlock(entity);
			id = entity.getId();
		} else {
			entity.setCreateTime(new Date());
			entity.setCreateUser(LtSecurityUtils.getLoginUser());
			
			blockDao.saveBlock(entity);
		}
		return id;

	}

	public void deleteBlock(List<String> ids) {
		blockDao.deleteBlock(ids);
	}

	public void disabledBlock(List<String> ids) {
		blockDao.disabledBlock(ids);
	}

	@Transactional(readOnly = true)
	public Page<Block> findBlockByPage(Page<Block> page) {
		int count = blockDao.findBlockCountByFilter(page);
		List<Block> cmps = blockDao.findBlockByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}
}
