package org.bsxf.schedule;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class TestJobII extends QuartzJobBean {

	private ApplicationContext applicationContext;

	/**
	 * 从SchedulerFactoryBean注入的applicationContext.
	 */
	public void setApplicationContext(ApplicationContext applicationContext) {
		this.applicationContext = applicationContext;
	}

	@Override
	protected void executeInternal(JobExecutionContext ctx) throws JobExecutionException {
		System.out.println("这是新增的定时任务1" + applicationContext);

	}

}
