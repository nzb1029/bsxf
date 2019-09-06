package org.springside.log.appender;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSourceUtils;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import org.springside.queue.BlockingConsumer;

import com.google.common.collect.Lists;

public class RecycleWriter extends BlockingConsumer {
	protected List<Map<String, String>> eventsBuffer = Lists.newArrayList();
	protected int batchSize = 10;
	protected NamedParameterJdbcOperations jdbcTemplate;
	protected TransactionTemplate transactionTemplate;
	protected String sql = "insert into ss_recycle (id,tablec,table_name,col,col_name,create_user_id,create_time)"
			+ " values(:id,:tablec,:tableName,:col,:colName,:createUser,:createTime)";

	@Resource
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	/**
	 * 根据注入的aklTransactionManager创建transactionTemplate.
	 */
	@Resource(name = "transactionManager")
	public void setDefaultTransactionManager(PlatformTransactionManager defaultTransactionManager) {
		transactionTemplate = new TransactionTemplate(defaultTransactionManager);
	}

	@Override
	protected void clean() {
		if (!eventsBuffer.isEmpty()) {
			updateBatch();
		}
		logger.debug("cleaned task {}", this);

	}

	public void instore() {
		clean();
	}

	public void updateBatch() {
		try {
			//分析事件列表, 转换为jdbc批处理参数.
			int i = 0;
			Map[] paramMapArray = new HashMap[eventsBuffer.size()];
			for (Map<String, String> event : eventsBuffer) {
				String col = event.get("col") == null ? "" : event.get("col").toString();
				if (StringUtils.isBlank(col)) {
					String sql = "select " + event.get("colName") + " as aa from " + event.get("tablec")
							+ " where id='" + event.get("id") + "'";
					Map cmap = jdbcTemplate.queryForMap(sql, new HashMap());
					event.put("col", cmap.get("aa").toString());
				}
				paramMapArray[i++] = (event);
			}
			final SqlParameterSource[] batchParams = SqlParameterSourceUtils.createBatch(paramMapArray);

			//执行批量插入,如果失败调用失败处理函数.
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					try {
						//System.out.println(sql);
						jdbcTemplate.batchUpdate(sql, batchParams);
						if (logger.isDebugEnabled()) {
							for (Map<String, String> event : eventsBuffer) {
								//logger.debug("saved event: {}", new LoggingEventWrapper(event).convertToString());
							}
						}
					} catch (DataAccessException e) {
						e.printStackTrace();
						status.setRollbackOnly();
					}
				}
			});

			//清除已完成的Buffer
			eventsBuffer.clear();
		} catch (Exception e) {
			logger.error("批量提交任务时发生错误.", e);
		}
	}

	@Override
	protected void processMessage(Object message) {
		Map<String, String> event = (Map<String, String>) message;
		eventsBuffer.add(event);
		if (logger.isDebugEnabled()) {
			logger.debug("get event: {}", message);
		}
		//已到达BufferSize则执行批量插入操作
		if (eventsBuffer.size() >= batchSize) {
			updateBatch();
		}

	}
}
