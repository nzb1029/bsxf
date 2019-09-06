package org.bsxf.utils;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class FreeMarkerUtil
{
  public static void main(String[] args)
  {
    String s = "民族宗教信息阅办单发出单位${name}编    号${yNos}号日    期${yy}年${mm}月${dd}日拟办建议${todoIdea}领导批示吴  涛何  鸣张慧东${title}——${ftitle}${content}此处显示附件（图片）";
    Map m = new HashMap();
    m.put("name", "aa");
  }

  public static String rendereString(String templateString, Map<String, ?> model)
  {
    try {
      StringWriter result = new StringWriter();
      Template t = new Template("name", new StringReader(templateString), new Configuration());
      t.process(model, result);
      return result.toString();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "";
  }

  public static String renderTemplate(Template template, Object model)
  {
    try
    {
      StringWriter result = new StringWriter();
      template.process(model, result);
      return result.toString();
    } catch (Exception e) {
      e.printStackTrace();
    }

    return "";
  }

  public static Configuration buildConfiguration(String directory) throws IOException {
    Configuration cfg = new Configuration();
    Resource path = new DefaultResourceLoader().getResource(directory);
    cfg.setDirectoryForTemplateLoading(path.getFile());
    cfg.setDefaultEncoding("UTF-8");
    return cfg;
  }
}