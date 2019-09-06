package org.bsxf.common.web.highCharts;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/highCharts")
public class HighChartController {

	@RequestMapping(value = { "demo1" })
	public String list(Model model) {
		return "highCharts/demo1";
	}
	@RequestMapping(value = { "demo2" })
	public String list2(Model model) {
		return "highCharts/demo2";
	}
	@RequestMapping(value = { "demo3" })
	public String list3(Model model) {
		return "highCharts/demo3";
	}
	@RequestMapping(value = { "generateHighCharts" })
	@ResponseBody
	public List<Map<String, Object>> generateHighCharts(HttpServletRequest request, Model model) {
		Map<String, Object> dataLabels = new HashMap<String, Object>();
		dataLabels.put("enabled", true);
		dataLabels.put("color", "#F0F0F0");
		List<Map<String, Object>> dList = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = new HashMap<String, Object>();
			dList.add(map);
			map.put("type", "line");
			map.put("title", "Demo 实例 -曲线图");
			String [] xAxis =  {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
			map.put("xAxis", xAxis);
			map.put("yTitle", "Temperature (°C)");
			List<Map<String, Object>> dataList = new ArrayList<Map<String,Object>>();
			Map<String, Object> map1 = new HashMap<String, Object>();
			dataList.add(map1);
			map1.put("name", "Tokyo");
			map1.put("dataLabels",dataLabels);
			float [] data = {18.0f, 19.1f, 17.2f,16.1f, 9.1f, 6.1f,4.1f, 2.1f, -11f,7.5f, 8.0f, 9.9f};
			map1.put("data", data);
			Map<String, Object> map2 = new HashMap<String, Object>();
			dataList.add(map2);
			map2.put("name", "中国");
			map2.put("dataLabels",dataLabels);
			float [] data1 = {2f, 4f, 6f,8f, 15f, 20f,25f, 28f, 17f,14f, 9f, 5f};
			map2.put("data", data1);
			Map<String, Object> map3 = new HashMap<String, Object>();
			dataList.add(map3);
			map3.put("name", "美国");
			map3.put("dataLabels",dataLabels);
			float [] data2 = {10f, 11f, 11f,12f, 13f, 11f,10f, 8f, 6f,7f};
			map3.put("data", data2);
			map.put("series",dataList.toArray());
			return dList;
	}
}
