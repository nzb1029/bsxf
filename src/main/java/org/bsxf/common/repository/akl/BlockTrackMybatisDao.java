package org.bsxf.common.repository.akl;

import java.util.List;

import org.bsxf.common.entity.akl.Block;
import org.bsxf.common.entity.akl.BlockTrack;
import org.bsxf.utils.Page;
import org.springframework.stereotype.Component;

/***
 * mybatis自动扫描此目录，无需再写实现
 * */
@Component
public interface BlockTrackMybatisDao {
	
	public BlockTrack getBlockTrack(String id);

	public List<BlockTrack> getAllBlockTrack();

	public void updateBlockTrack(BlockTrack entity);

	public void saveBlockTrack(BlockTrack entity);

	public void deleteBlockTrack(List<String> ids);

	public List<BlockTrack> findBlockTrackByFilter(Page page);

	public int findBlockTrackCountByFilter(Page page);

	public List<BlockTrack> getTrackListByBlockId(String blockId);

}
