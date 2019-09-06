package org.bsxf.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.entity.account.Permission;
import org.bsxf.common.repository.PermissionMybatisDao;
import org.bsxf.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.utils.Identities;

/**
 * @类名称：PermissionManager   
 * @类描述：权限管理类   
 * @作者：Administrator   
 * @创建时间：2014-10-24 上午09:59:49   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 上午09:59:49   
 * @修改备注：   
 * @版权：
 * @version
*/
@Component
@Transactional
public class PermissionManager {
	@Autowired
	private PermissionMybatisDao permissionDao;

	@Transactional(readOnly = true)
	public Permission getPermission(String id) {
		return permissionDao.getPermission(id);
	}

	@Transactional(readOnly = true)
	public List<Permission> getAllPermission() {
		return permissionDao.getAllPermission();
	}

	/**
	 * @方法名: saveOrUpdate
	 * @描述: 保存或者更新权限
	 * @参数 @param entity
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	public String saveOrUpdate(Permission entity) {

		String id = "";
		if (StringUtils.isNotBlank(entity.getId())) {
			//更新已经选了这个权限的角色
			Permission old = permissionDao.getPermission(entity.getId());
			Map pars = new HashMap();
			pars.put("oval", old.getVal());
			pars.put("nval", entity.getVal());
			permissionDao.updatePermissionToRole(pars);
			permissionDao.updatePermission(entity);
			id = entity.getId();
		} else {
			id = Identities.uuid2();
			entity.setId(id);
			permissionDao.savePermission(entity);
		}
		return id;

	}

	/**
	 * @方法名: deletePermission
	 * @描述: 删除权限
	 * @参数 @param ids
	 * @返回类型 void    
	 * @throws
	 */
	public void deletePermission(List<String> ids) {
		permissionDao.deletePermission(ids);
	}

	/**
	 * @方法名: disabledPermission
	 * @描述: 禁用权限
	 * @参数 @param ids
	 * @返回类型 void    
	 * @throws
	 */
	public void disabledPermission(List<String> ids) {
		permissionDao.disabledPermission(ids);
	}

	/**
	 * @方法名: findPermissionByPage
	 * @描述: 分页查找权限
	 * @参数 @param page
	 * @参数 @return
	 * @返回类型 Page<Permission>    
	 * @throws
	 */
	@Transactional(readOnly = true)
	public Page<Permission> findPermissionByPage(Page<Permission> page) {
		int count = permissionDao.findPermissionCountByFilter(page);
		List<Permission> cmps = permissionDao.findPermissionByFilter(page);
		page.setTotalCount(count);
		page.setResult(cmps);
		return page;
	}

}
