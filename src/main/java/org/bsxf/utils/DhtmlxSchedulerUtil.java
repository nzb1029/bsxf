package org.bsxf.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

import org.springside.mapper.JaxbMapper;

public class DhtmlxSchedulerUtil {
	/**
	 * scheduler数据转xml以给它显示用
	 * 
	 * */
	public static void main(String[] args) {
		Map e = new HashMap();
		e.put("id", "id");
		e.put("start_date", "start_date");
		e.put("end_date", "end_date");
		e.put("text", "text");
		List<Map> l = new ArrayList<Map>();
		l.add(e);
		System.out.println(schedulerDataToXml(l));

	}

	public static String schedulerDataToXml(List<Map> schlist) {
		List<event> seList = new ArrayList<event>();
		for (Map s : schlist) {
			event se = new event();
			se.setId(s.get("id").toString());
			se.setStart_date(s.get("start_date").toString());
			se.setEnd_date(s.get("end_date").toString());
			se.setText(s.get("text").toString());
			seList.add(se);
		}
		return JaxbMapper.toXml(seList, "data", event.class);
	}

	@XmlRootElement
	//指定子节点的顺序
	@XmlType(propOrder = { "start_date", "end_date", "text" })
	public static class event {

		private String id;
		private String start_date;
		private String end_date;
		private String text;

		@XmlAttribute
		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getStart_date() {
			return start_date;
		}

		public void setStart_date(String start_date) {
			this.start_date = start_date;
		}

		public String getEnd_date() {
			return end_date;
		}

		public void setEnd_date(String end_date) {
			this.end_date = end_date;
		}

		public String getText() {
			return text;
		}

		public void setText(String text) {
			this.text = text;
		}
	}
}
