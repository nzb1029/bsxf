package org.bsxf.schedule;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springside.web.SpringContextHolder;

public class XJNumberBackupQuartz extends QuartzJobBean {

	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
//		EquipmentManager eqManager = SpringContextHolder.getBean(EquipmentManager.class);
//		eqManager.updateKLEquipmentMTG();
		System.out.print("XJEmailNoticeQuartz");
	}

}
