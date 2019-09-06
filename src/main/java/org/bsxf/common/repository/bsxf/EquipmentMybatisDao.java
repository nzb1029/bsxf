package org.bsxf.common.repository.bsxf;

import java.util.List;

import org.bsxf.common.entity.akl.Block;
import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.utils.Page;
import org.springframework.stereotype.Component;

/***
 * mybatis自动扫描此目录，无需再写实现
 * */
@Component
public interface EquipmentMybatisDao {
	
	public Equipment getEquipment(String id);

	public List<Equipment> getAllEquipment();

	public void updateEquipment(Equipment entity);

	public void saveEquipment(Equipment entity);

	public void deleteEquipment(List<String> ids);

	public void disabledEquipment(List<String> ids);

	public List<Equipment> findEquipmentByFilter(Page page);

	public int findEquipmentCountByFilter(Page page);

	public List<Equipment> getUserEquipment(String userId);

}
