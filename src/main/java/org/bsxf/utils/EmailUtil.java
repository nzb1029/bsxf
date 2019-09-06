package org.bsxf.utils;

import java.util.Date;

import org.bsxf.common.entity.sys.EmailConfig;
import org.bsxf.common.entity.sys.EmialSend;
import org.bsxf.common.service.sys.EmialSendManager;
import org.bsxf.email.SimpleMailService;
import org.springside.web.SpringContextHolder;

public class EmailUtil {
	
	
	/**
	 * 及时发送简单邮件
	 * */
	public   static boolean sendSimpleEmailByNow(String subject, String message, String to){
		SimpleMailService simpleMailService=SpringContextHolder.getBean(SimpleMailService.class);
		boolean f=simpleMailService.sendMail(subject, message, to);
		EmailConfig c=EhcacheManager.getEmailConfig();
		EmialSend emialSend=new EmialSend();
		emialSend.setHost(c.getHost());
		emialSend.setUsername(c.getUsername());
		emialSend.setPort(c.getPort());
		emialSend.setPassword(c.getPassword());
		emialSend.setSubject(subject);
		emialSend.setMessage(message);
		emialSend.setToemail(to);
		if(f)
			emialSend.setFsend("1");
		else 
			emialSend.setFsend("2");
		emialSend.setSendTime(new Date());
		EmialSendManager sendManager =	SpringContextHolder.getBean(EmialSendManager.class);
		sendManager.saveOrUpdate(emialSend);
		return f;
	}
}
