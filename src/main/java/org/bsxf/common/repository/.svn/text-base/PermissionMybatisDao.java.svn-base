package org.bsxf.common.repository;

import java.util.List;
import java.util.Map;

import org.bsxf.common.entity.account.Permission;
import org.bsxf.utils.Page;
import org.springframework.stereotype.Component;

/***
 * mybatis自动扫描此目录，无需再写实现�?
 * */
@Component
public interface PermissionMybatisDao {
	public Permission getPermission(String id);

	public void updatePermissionToRole(Map pars);

	public List<Permission> getAllPermission();

	public void updatePermission(Permission entity);

	public void savePermission(Permission entity);

	public void deletePermission(List<String> ids);

	public void disabledPermission(List<String> ids);

	public List<Permission> findPermissionByFilter(Page page);

	public int findPermissionCountByFilter(Page page);
}
