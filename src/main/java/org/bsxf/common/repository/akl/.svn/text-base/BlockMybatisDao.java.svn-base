package org.bsxf.common.repository.akl;

import java.util.List;
import java.util.Map;

import org.bsxf.common.entity.akl.Block;
import org.bsxf.utils.Page;
import org.springframework.stereotype.Component;

/***
 * mybatis自动扫描此目录，无需再写实现
 * */
@Component
public interface BlockMybatisDao {
	
	public Block getBlock(String id);

	public List<Block> getAllBlock();

	public void updateBlock(Block entity);

	public void saveBlock(Block entity);

	public void deleteBlock(List<String> ids);

	public void disabledBlock(List<String> ids);

	public List<Block> findBlockByFilter(Page page);

	public int findBlockCountByFilter(Page page);

	public List<Block> getUserBlock(String userId);

}
