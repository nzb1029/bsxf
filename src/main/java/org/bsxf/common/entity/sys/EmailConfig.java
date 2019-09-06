package org.bsxf.common.entity.sys;

import javax.persistence.Table;

import org.bsxf.common.entity.IdentityII;
import org.bsxf.utils.Description;
@Table(name = "ss_email_config", catalog = "邮箱配置")
public class EmailConfig extends IdentityII{
	@Description(description = "SMTP服务器", req = "true")
	private String host;
	@Description(description = "用户名", req = "true")
	private String username;
	@Description(description = "密码", req = "true")
	private String password;
	@Description(description = "端口", req = "true")
	private String port="25";
	
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
}
