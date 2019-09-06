package org.bsxf.common.repository.akl;

import java.util.List;
import java.util.Map;

import org.bsxf.common.entity.akl.BlockParam;
import org.bsxf.utils.Page;
import org.springframework.stereotype.Component;

/***
 * mybatis自动扫描此目录，无需再写实现
 * */
@Component
public interface BlockParamMybatisDao {
	public BlockParam getBlockParam(String id);
	
	public BlockParam getBlockParamByBlockId(String id);

	public List<BlockParam> getAllBlockParam();

	public void updateBlockParam(BlockParam entity);

	public void saveBlockParam(BlockParam entity);

	public void deleteBlockParam(List<String> ids);

	public List<BlockParam> findBlockParamByFilter(Page page);

	public int findBlockParamCountByFilter(Page page);

}
