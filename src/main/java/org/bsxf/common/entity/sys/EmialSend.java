package org.bsxf.common.entity.sys;

import java.util.Date;

import javax.persistence.Table;

import org.bsxf.common.entity.IdentityII;
import org.bsxf.utils.Description;

@Table(name = "ss_email_send", catalog = "邮箱发送记录")
public class EmialSend extends IdentityII{
	@Description(description = "SMTP服务器" )
	private String host;
	@Description(description = "用户名" )
	private String username;
	@Description(description = "密码" )
	private String password;
	@Description(description = "端口" )
	private String port="25";
	@Description(description = "主题" )
	private String subject; 
	@Description(description = "内容" )
	private String message;
	@Description(description = "接收者" )
	private String toemail;
	//0:未发送，1：已发送，2：发送失败
	@Description(description = "是否发送" )
	private String fsend="0";
	@Description(description = "发送时间" )
	private Date sendTime;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	 
	public String getFsend() {
		return fsend;
	}
	public void setFsend(String fsend) {
		this.fsend = fsend;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public String getToemail() {
		return toemail;
	}
	public void setToemail(String toemail) {
		this.toemail = toemail;
	}
}
