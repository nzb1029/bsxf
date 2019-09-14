/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.bsxf.security;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authc.credential.PasswordService;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.bsxf.common.entity.account.Permission;
import org.bsxf.common.entity.account.Role;
import org.bsxf.common.entity.account.User;
import org.bsxf.common.entity.akl.Block;
import org.bsxf.common.service.AccountManager;
import org.bsxf.common.service.PermissionManager;
import org.bsxf.common.web.SessionKey;
import org.bsxf.utils.DateUtil;
import org.bsxf.utils.EhcacheManager;
import org.bsxf.utils.EncryptUtils;
import org.bsxf.utils.PropertiesUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springside.queue.QueuesHolder;
import org.springside.utils.Collections3;
import org.springside.utils.Identities;

import com.google.common.collect.Lists;

/**
 * shiro安全过滤扩展类
 * 
 
 */
public class ShiroDbRealm extends AuthorizingRealm {

	//public static final int INTERATIONS = 1024;
	public static final int INTERATIONS = 1;
	//private static final int SALT_SIZE = 8;
	private static final String ALGORITHM = "MD5";
	private static Logger logger = LoggerFactory.getLogger(ShiroDbRealm.class);
	protected AccountManager accountManager;

	protected PasswordService passwordService;

	protected PermissionManager permissionManager;

	/*private boolean checkPasswd(String passwd, User user) {
		String saltl = user.getSalt();
		String upasswd = user.getPassword();
		byte[] salt = Encodes.decodeHex(saltl);
		byte[] hashPassword = Digests.sha1(passwd.getBytes(), salt, ShiroDbRealm.INTERATIONS);
		String password = Encodes.encodeHex(hashPassword);
		if (upasswd.equals(password))
			return true;
		return false;
	}*/

	public boolean checkPassword(String password, String userId) {
		User user = accountManager.getUser(userId);
		if (StringUtils.isNotBlank(password)
				&& user != null) {
			return checkPasswdMd5(password, user);
		}
		return false;
	}
	
	/**
	 * md5加密方式
	 * @param passwd
	 * @param user
	 * @return
	 */
	private boolean checkPasswdMd5(String passwd, User user) {
		
		String password = EncryptUtils.md5(passwd);
		if (user.getPassword().equals(password))
			return true;
		return false;
	}

	/**
	 * 认证回调函数,登录时调用.
	 */
	@SuppressWarnings("unchecked")
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {

		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		User user = accountManager.findUserByLoginNameOrEmailOrMobile(token.getUsername());
		if (user != null) {
			if (user.getStatus().equals("disabled") || user.getIsLock() == 1) {
				throw new DisabledAccountException();
			}
			char[] passwd = token.getPassword();
			boolean cp = checkPasswdMd5(new String(passwd), user);
			ShiroUser shiroUser = new ShiroUser(user.getLoginName(), user.getName());
			if (cp) {
				shiroUser.setId(user.getId());
				shiroUser.setEmail(user.getEmail());
				List<Role> roleList = user.getRoleList();
				Set<String> widList = new HashSet<String>();
				shiroUser.setPassword(user.getPassword());
				shiroUser.setRoleList(roleList);
				shiroUser.setIp(token.getHost());
				shiroUser.setUserType(user.getUserType());
//				//如果登陆用户是农场主，则加载其所有的地块
//				if("1".equals(user.getUserType())){
//					List<Block> blockList = user.getBlockList() ;
//					if(blockList != null && blockList.size() > 0){
//						shiroUser.setBlockId(blockList.get(0).getId());
//						shiroUser.setBlockList(user.getBlockList());	
//					}
//				}
				//shiroUser.setAddPower(genratePowerString(user));
				//设置部件
				if (user.getId().equals("1")) {
					List<String> ws = Collections3.extractToList(PropertiesUtils.getWidgets(), "val");
					shiroUser.setWidList(ws);
					List<Permission> plist = permissionManager.getAllPermission();
					for (Permission p : plist) {
						shiroUser.getPermission().put(p.getVal(), "true");
					}
				} else {
					shiroUser.setRoleList(roleList);
					for (Role r : roleList) {
						////设置权限
						if (StringUtils.isNotBlank(r.getPermissions())) {
							String[] pary = r.getPermissions().split(",");
							for (String p : pary)
								shiroUser.getPermission().put(p, "true");
							//widList.addAll(Arrays.asList(r.getWidgets().split(",")));
						}
					}
					shiroUser.setWidList(Arrays.asList(widList.toArray(new String[widList.size()])));
				}
				//存储登录时间
				Map<String, String> logMap = new HashMap<String, String>();
				logMap.put("id", Identities.uuid2());
				logMap.put("user_id", user.getId());
				logMap.put("ip", token.getHost());
				logMap.put("session_id", SecurityUtils.getSubject().getSession().getId().toString());
				logMap.put("log_type", "0");
				logMap.put("log_time", DateUtil.formatDateToString(new Date()));

				//存储登录人信息，保持在线人列表
				try {
					QueuesHolder.getQueue("loginWriter").put(logMap);
					//System.out.println(QueuesHolder.getQueueLength("loginWriter"));
					EhcacheManager.putLogin(user);
				} catch (Exception e) {
					e.printStackTrace();
				}
				//删除失败次数session
				SecurityUtils.getSubject().getSession().removeAttribute(SessionKey.LOGIN_FAILED_COUNT);
			}
			return new SimpleAuthenticationInfo(shiroUser, user.getPassword(), getName());

		} else {
			return null;
		}

	}

	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		ShiroUser shiroUser = (ShiroUser) principals.fromRealm(getName()).iterator().next();
		User user = accountManager.findUserByLoginName(shiroUser.loginName);
		if (user != null) {
			shiroUser.setRoleList(user.getRoleList());
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			//admin加入所有权限字符
			if (user.getId().equals("1")) {
				List<Permission> plist = permissionManager.getAllPermission();
				List<String> perList = Collections3.extractToList(plist, "val");
				info.addStringPermissions(perList);

			}
			//admin也需要加入角色， 
			for (Role role : user.getRoleList()) {
				//基于Role的权限信息
				if (role.getStatus().equals("enabled")) {
					info.addRole(role.getRoleName());
					//role.getPermissionList()=user:view,user:edit
					if (!user.getId().equals("1") && role.getPermList() != null)
						info.addStringPermissions(role.getPermList());
				}

				//user:view,user:edit
			}
			return info;
		} else {
			return null;
		}
	}

	/**
	 * 更新用户授权信息缓存.
	 */
	public void clearCachedAuthorizationInfo(String principal) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(new ShiroUser(principal, null), getName());
		clearCachedAuthorizationInfo(principals);
	}

	public HashPassword encrypt(String plainText) {
		HashPassword result = new HashPassword();
		//byte[] salt = Digests.generateSalt(SALT_SIZE);
		//result.salt = Encodes.encodeHex(salt);

		//byte[] hashPassword = Digests.sha1(plainText.getBytes(), salt, INTERATIONS);
		result.password = EncryptUtils.md5(plainText);
		return result;

	}

	@PostConstruct
	public void initCredentialsMatcher() {
		HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(ALGORITHM);
		matcher.setHashIterations(INTERATIONS);

		setCredentialsMatcher(matcher);
	}

	public void setAccountManager(AccountManager accountManager) {
		this.accountManager = accountManager;
	}

	public static class HashPassword {
		//public String salt;
		public String password;
	}

	/**
	 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
	 */
	public static class ShiroUser implements Serializable {
		private static final long serialVersionUID = -1373760761780840081L;
		public String loginName;
		public String name;
		//小组件
		private List<String> widList;
		//权限集合
		private Map<String, String> permission = new HashMap<String, String>();
		private String id;
		private String email;
		public String password;
		private List<Role> roleList = Lists.newArrayList(); //有序的关联对象集合
		private String ip;
		private String userType;
//		private List<Block> blockList = Lists.newArrayList();//地块列表
//		private String blockId ;//选中的地块
//		
//		public String getBlockId() {
//			return blockId;
//		}
//
//		public void setBlockId(String blockId) {
//			this.blockId = blockId;
//		}

		public String getUserType() {
			return userType;
		}

		public void setUserType(String userType) {
			this.userType = userType;
		}
//		public List<Block> getBlockList() {
//			return blockList;
//		}
//
//		public void setBlockList(List<Block> blockList) {
//			this.blockList = blockList;
//		}

		public ShiroUser(String loginName, String name) {
			this.loginName = loginName;
			this.name = name;
		}

		public String getName() {
			return name;
		}

		/**
		 * 本函数输出将作为默认的<shiro:principal/>输出.
		 */
		@Override
		public String toString() {
			return loginName;
		}

		/**
		 * 重载equals,只计算loginName;
		 */
		@Override
		public int hashCode() {
			return HashCodeBuilder.reflectionHashCode(this, "loginName");
		}

		/**
		 * 重载equals,只比较loginName
		 */
		@Override
		public boolean equals(Object obj) {
			return EqualsBuilder.reflectionEquals(this, obj, "loginName");
		}

		public List<String> getWidList() {
			return widList;
		}

		public void setWidList(List<String> widList) {
			this.widList = widList;
		}

		public Map<String, String> getPermission() {
			return permission;
		}

		public void setPermission(Map<String, String> permission) {
			this.permission = permission;
		}

		public String getLoginName() {
			return loginName;
		}

		public void setLoginName(String loginName) {
			this.loginName = loginName;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public List<Role> getRoleList() {
			return roleList;
		}

		public void setRoleList(List<Role> roleList) {
			this.roleList = roleList;
		}


		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}


		public String getIp() {
			return ip;
		}

		public void setIp(String ip) {
			this.ip = ip;
		}

	}

	public void setPermissionManager(PermissionManager permissionManager) {
		this.permissionManager = permissionManager;
	}
}
