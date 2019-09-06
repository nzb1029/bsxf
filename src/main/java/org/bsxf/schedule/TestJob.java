package org.bsxf.schedule;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class TestJob extends QuartzJobBean {
	public TestJob() {
		//System.out.println("...初始化");
	}

	private ApplicationContext applicationContext;

	/**
	 * 从SchedulerFactoryBean注入的applicationContext.
	 */
	public void setApplicationContext(ApplicationContext applicationContext) {
		this.applicationContext = applicationContext;
		//	StringUtils.replace(text, searchString, replacement)
	}

	@Override
	protected void executeInternal(JobExecutionContext ctx) throws JobExecutionException {
		System.out.println("定时任务执行了" + applicationContext);

	}

}
