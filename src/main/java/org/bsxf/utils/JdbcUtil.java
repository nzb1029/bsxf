package org.bsxf.utils;

import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSourceUtils;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

public class JdbcUtil implements ApplicationContextAware, DisposableBean {
	protected static NamedParameterJdbcOperations jdbcTemplate;
	protected static TransactionTemplate transactionTemplate;
	protected static DataSource dataSource;
	private static ApplicationContext applicationContext = null;
	private static Logger logger = LoggerFactory.getLogger(JdbcUtil.class);

	public static void executeUpdate(String sql, final Map<String, Object> parsMap) {
		final String bsql = sql.trim();
		//SqlParameterSource params=
		transactionTemplate.execute(new TransactionCallbackWithoutResult() {
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {
				try {
					String[] sqls = StringUtils.split(bsql, ";");
					for (int i = 0; i < sqls.length; i++)
						if (StringUtils.isNotBlank(sqls[i]))
							jdbcTemplate.update(sqls[i], parsMap);
					//if (logger.isDebugEnabled()) {
					logger.debug("execute sql: {}", bsql);
					//}
				} catch (DataAccessException e) {
					status.setRollbackOnly();
					logger.error("数据库执行sql异常:", e);
				}
			}
		});

	}

	public static List<Map<String, Object>> executeQuery(String sql, final Map<String, Object> parsMap) {
		final String bsql = sql.trim();
		List<Map<String, Object>> dList = jdbcTemplate.queryForList(bsql, parsMap);
		return dList;

	}

	public static Object executeSql(String sql) {
		final String bsql = sql.trim();
		if (StringUtils.startsWithIgnoreCase(bsql, "select")) {
			//List<Map<String, Object>> dList = jdbcTemplate.queryForList(bsql, new HashMap<String, Object>());
			return executeQuery(sql, new HashMap<String, Object>());
		} else {

			executeUpdate(sql, new HashMap<String, Object>());
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public static void updateBatch(String sql, List<Map<String, Object>> paramList) {
		try {
			//分析事件列表, 转换为jdbc批处理参数.
			final String bsql = sql.trim();
			int i = 0;
			Map[] paramMapArray = new HashMap[paramList.size()];
			for (Map event : paramList) {
				paramMapArray[i++] = event;
			}
			final SqlParameterSource[] batchParams = SqlParameterSourceUtils.createBatch(paramMapArray);

			//执行批量插入,如果失败调用失败处理函数.
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					try {
						jdbcTemplate.batchUpdate(bsql, batchParams);
						//if (logger.isDebugEnabled()) {
						logger.debug("saved event: {}", bsql);
						//}
					} catch (DataAccessException e) {
						status.setRollbackOnly();
						logger.error("数据库执行sql异常:", e);
					}
				}
			});

			//清除已完成的Buffer
		} catch (Exception e) {
			logger.error("批量提交任务时发生错误.", e);
		}
	}

	/**
	 *  getColumns的返回也是将所有的字段放到一个类似的内存中的表，
	 *  而COLUMN_NAME就是字段的名字，TYPE_NAME就是数据类型，
	 *  比如"int","int unsigned"等等，COLUMN_SIZE返回整数，
	 *  就是字段的长度，比如定义的int(8)的字段，返回就是8，最后NULLABLE，
	 *  返回1就表示可以是Null,而0就表示Not Null。
	 * */
	public static List<Map> getTables(String dbname) throws Exception {

		java.sql.Connection conn = null;
		try {
			conn = dataSource.getConnection();
			DatabaseMetaData dm = conn.getMetaData();
			ResultSet tableRet = dm.getTables(null, "%", "%", new String[] { "TABLE" });
			List<Map> tables = new ArrayList<Map>();
			while (tableRet.next()) {
				String tbname = tableRet.getString("TABLE_NAME");
				ResultSet colRet = dm.getColumns(null, "%", tbname, "%");
				Map<String, Object> tMap = new LinkedHashMap<String, Object>();
				Map<String, Object> cMap = new LinkedHashMap<String, Object>();
				tMap.put("tbname", tbname);

				List a = new ArrayList<String>();
				tMap.put("cMap", a);
				tables.add(tMap);
				while (colRet.next()) {
					String columnName = colRet.getString("COLUMN_NAME");
					String columnType = colRet.getString("TYPE_NAME");
					/*int datasize = colRet.getInt("COLUMN_SIZE");
					int digits = colRet.getInt("DECIMAL_DIGITS");
					int nullable = colRet.getInt("NULLABLE");*/
					a.add(columnName);
					cMap.put("cName", columnName);
					cMap.put("cType", columnType);
				}
			}
			return tables;
		} catch (Exception e) {
			logger.error("查询数据库表错误:" + e);
		} finally {
			if (conn != null)
				conn.close();
		}
		return null;
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		JdbcUtil.applicationContext = applicationContext; //NOSONAR
		dataSource = (DataSource) applicationContext.getBean("dataSource");
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
		PlatformTransactionManager defaultTransactionManager = (PlatformTransactionManager) applicationContext
				.getBean("transactionManager");
		transactionTemplate = new TransactionTemplate(defaultTransactionManager);

	}

	@Override
	public void destroy() throws Exception {
		applicationContext = null;
	}
}
