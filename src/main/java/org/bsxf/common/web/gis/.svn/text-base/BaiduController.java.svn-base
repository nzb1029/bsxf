package org.bsxf.common.web.gis;

import javax.servlet.http.HttpServletRequest;

import org.bsxf.common.service.SystemManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @类名称：BaiduController   
 * @类描述：百度gis业务控制类   
 * @作者：Administrator   
 * @创建时间：2014-10-24 下午01:35:07   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 下午01:35:07   
 * @修改备注：   
 * @版权：
 * @version
*/
@Controller
@RequestMapping(value = "/baidu")
public class BaiduController {
	@Autowired
	private SystemManager sysManager;

	/**
	 * @方法名: addpoint
	 * @描述: 对象绑定百度坐标的方法，根据已有坐标在页面可直接定位
	 * @参数 @param request
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "addpoint" })
	public String addpoint(HttpServletRequest request, Model model) {
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		model.addAttribute("x", x);
		model.addAttribute("y", y);
		return "gis/baidu/addpoint";
	}

	/**
	 * @方法名: dingwei
	 * @描述: 加载设备坐标定位百度地图
	 * @参数 @param request
	 * @参数 @param model
	 * @参数 @return
	 * @返回类型 String    
	 * @throws
	 */
	@RequestMapping(value = { "dingwei" })
	public String dingwei(HttpServletRequest request, Model model) {
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		String id = request.getParameter("id");
		String eName = request.getParameter("eName");
	//	Equipment eq = equipmentManager.getEquipment(id);
		model.addAttribute("x", x);
		model.addAttribute("y", y);
		model.addAttribute("id", id);
	//	System.out.println(eq);
	//	model.addAttribute("equipment", eq);
		return "gis/baidu/dingwei";
	}

}
