package org.bsxf.web;

import java.util.Collections;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.mapper.JsonMapper;

/**
 * 输出JsonP格式的Mashup 服务端, 支持被跨域调用.
 * 
 * @author calvin
 */
@Controller
public class MashupServerController {

	private static final String DEFAULT_JQUERY_JSONP_CALLBACK_PARM_NAME = "callback";

	private JsonMapper mapper = new JsonMapper();

	@RequestMapping("/web/mashup")
	@ResponseBody
	public String execute(@RequestParam(DEFAULT_JQUERY_JSONP_CALLBACK_PARM_NAME) String callbackName) {

		//设置需要被格式化为JSON字符串的内容.
		Map<String, String> map = Collections.singletonMap("content", "<p>Hello World!</p>");

		//渲染返回结果.
		return mapper.toJsonP(callbackName, map);
	}
}
