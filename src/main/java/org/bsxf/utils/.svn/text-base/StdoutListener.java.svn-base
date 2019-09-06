package org.bsxf.utils;

import java.io.PrintStream;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.impl.LogFactoryImpl;

/**
 * 将system.out.print的信息转移到日志文件，方便分析
 * */
public class StdoutListener implements ServletContextListener {
	//private static Logger logger = LoggerFactory.getLogger(ShiroDbRealm.class);

	public void contextDestroyed(ServletContextEvent event) {
	}

	private void log(Object info) {
		LogFactoryImpl.getLog(getClass()).info(info);
	}

	public void contextInitialized(ServletContextEvent event) {
		PrintStream printStream = new PrintStream(System.out) {
			public void println(boolean x) {
				log(Boolean.valueOf(x));
			}

			public void println(char x) {
				log(Character.valueOf(x));
			}

			public void println(char[] x) {
				log(x == null ? null : new String(x));
			}

			public void println(double x) {
				log(Double.valueOf(x));
			}

			public void println(float x) {
				log(Float.valueOf(x));
			}

			public void println(int x) {
				log(Integer.valueOf(x));
			}

			public void println(long x) {
				log(x);
			}

			public void println(Object x) {
				log(x);
			}

			public void println(String x) {
				log(x);
			}
		};
		System.setOut(printStream);
		System.setErr(printStream);
	}

}
