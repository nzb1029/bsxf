package org.bsxf.schedule;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.entity.sys.EmailConfig;
import org.bsxf.common.service.bsxf.EquipmentManager;
import org.bsxf.utils.EhcacheManager;
import org.bsxf.utils.EmailUtil;
import org.bsxf.utils.PropertiesUtils;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springside.web.SpringContextHolder;

public class XJEmailNoticeQuartz extends QuartzJobBean {

	private static String subject = PropertiesUtils.get("email_subject");
	private static String userName = PropertiesUtils.get("email_userName");
	private static String to =  PropertiesUtils.get("email_to");
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		
		System.out.print("XJEmailNoticeQuartz==========执行了==============="+new Date());
		EmailConfig config = EhcacheManager.getEmailConfig();
		EquipmentManager eqManager = SpringContextHolder.getBean(EquipmentManager.class);
	    List<Equipment> elist = eqManager.getRemainEquipments();
	    if(CollectionUtils.isNotEmpty(elist)){
	    	EmailUtil.sendMineEmailByNow(subject,elist,to,userName,"1");
	    }
	}

}
