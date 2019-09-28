package org.bsxf.schedule;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.bsxf.common.entity.bsxf.Equipment;
import org.bsxf.common.service.bsxf.EquipmentManager;
import org.bsxf.utils.DateUtil;
import org.bsxf.utils.EmailUtil;
import org.bsxf.utils.PropertiesUtils;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springside.web.SpringContextHolder;

public class EquipmentEmailNoticeQuartz extends QuartzJobBean {

	private static String subject = PropertiesUtils.get("email_subject_vaild");
	private static String userName = PropertiesUtils.get("email_userName");
	private static String to =  PropertiesUtils.get("email_to");
	private static Integer days =  Integer.parseInt(PropertiesUtils.get("days"));
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		
		System.out.print("EquipmentEmailNoticeQuartz==========执行了==============="+new Date());
		EquipmentManager eqManager = SpringContextHolder.getBean(EquipmentManager.class);
	    List<Equipment> alllist = eqManager.getAllEquipment();
	    List<Equipment> elist = new ArrayList<Equipment>();
	    Date now = new Date();
	    for (Equipment equipment : alllist) {
			if((equipment.getExpDate() !=null && Math.abs(DateUtil.betweenDays(equipment.getExpDate(),now)) <= days) ||
			   (equipment.getExpDate2() !=null && Math.abs(DateUtil.betweenDays(equipment.getExpDate2(),now)) <= days) ||
			   (equipment.getExpDate3() !=null && Math.abs(DateUtil.betweenDays(equipment.getExpDate3(),now)) <= days)){
				elist.add(equipment);
			}
		}
	    if(CollectionUtils.isNotEmpty(elist)){
	    	EmailUtil.sendMineEmailByNow(subject,elist,to,userName,"2");
	    }
//		eqManager.updateKLEquipmentMTG();
	}

}
