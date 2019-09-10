package org.bsxf.schedule;

import java.util.Date;

import org.bsxf.common.service.bsxf.EquipmentManager;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springside.web.SpringContextHolder;

public class XJNumberBackupQuartz extends QuartzJobBean {

	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		System.out.print("XJNumberBackupQuartz==========执行了==============="+new Date());
		EquipmentManager eqManager = SpringContextHolder.getBean(EquipmentManager.class);
		eqManager.updateRemainNum();
	}

}
