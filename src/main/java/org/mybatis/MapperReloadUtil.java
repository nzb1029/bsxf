package org.mybatis;

import java.lang.reflect.Field;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.builder.xml.XMLMapperBuilder;
import org.apache.ibatis.executor.ErrorContext;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.core.NestedIOException;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springside.web.SpringContextHolder;

public class MapperReloadUtil {
	private static void clearMap(Class<?> classConfig, Configuration configuration, String fieldName) throws Exception {
		Field field = classConfig.getDeclaredField(fieldName);
		field.setAccessible(true);
		Map mapConfig = (Map) field.get(configuration);
		mapConfig.clear();
	}

	private static void clearSet(Class<?> classConfig, Configuration configuration, String fieldName) throws Exception {
		Field field = classConfig.getDeclaredField(fieldName);
		field.setAccessible(true);
		Set setConfig = (Set) field.get(configuration);
		setConfig.clear();
	}

	private static void removeConfig(Configuration configuration) throws Exception {
		Class<?> classConfig = configuration.getClass();
		clearMap(classConfig, configuration, "mappedStatements");
		clearMap(classConfig, configuration, "caches");
		clearMap(classConfig, configuration, "resultMaps");
		clearMap(classConfig, configuration, "parameterMaps");
		clearMap(classConfig, configuration, "keyGenerators");
		clearMap(classConfig, configuration, "sqlFragments");

		clearSet(classConfig, configuration, "loadedResources");

	}

	private final static ResourcePatternResolver resourcePatternResolver = new PathMatchingResourcePatternResolver();
	private final static String mapperPath = "classpath:/mapper/**/*Mapper.xml";

	public static void reloadXML() throws Exception {
		SqlSessionFactory factory = SpringContextHolder.getBean(SqlSessionFactory.class);
		Configuration configuration = factory.getConfiguration();
		// 移除加载项
		removeConfig(configuration);
		// 重新扫描加载
		Resource[] resources = resourcePatternResolver.getResources(mapperPath);
		//Resource[] resources = getResource(basePackage, XML_RESOURCE_PATTERN);
		if (resources != null) {
			for (int i = 0; i < resources.length; i++) {
				if (resources[i] == null) {
					continue;
				}
				try {
					XMLMapperBuilder xmlMapperBuilder = new XMLMapperBuilder(resources[i].getInputStream(),
							configuration, resources[i].toString(), configuration.getSqlFragments());
					xmlMapperBuilder.parse();
				} catch (Exception e) {
					throw new NestedIOException("Failed to parse mapping resource: '" + resources[i] + "'", e);
				} finally {
					ErrorContext.instance().reset();
				}
			}
		}

	}
}
