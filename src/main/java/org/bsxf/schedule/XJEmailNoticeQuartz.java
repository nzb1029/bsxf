package org.bsxf.schedule;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.entity.sys.EmailConfig;
import org.bsxf.common.service.bsxf.EquipmentManager;
import org.bsxf.utils.EhcacheManager;
import org.bsxf.utils.EmailUtil;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springside.web.SpringContextHolder;

public class XJEmailNoticeQuartz extends QuartzJobBean {

	private static String subject = "【系统通知】尚未提交巡检提醒";
	private static String userName = "蒋老师";
	private static String to = "binnz_java@163.com";
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		
		System.out.print("XJEmailNoticeQuartz==========执行了==============="+new Date());
		EmailConfig config =	EhcacheManager.getEmailConfig();
		EquipmentManager eqManager = SpringContextHolder.getBean(EquipmentManager.class);
	    List<Equipment> elist = eqManager.getRemainEquipments();
	    if(CollectionUtils.isNotEmpty(elist)){
	    	EmailUtil.sendMineEmailByNow(subject,elist,to,userName);
	    }
		
		
		
//		eqManager.updateKLEquipmentMTG();
	}

}
