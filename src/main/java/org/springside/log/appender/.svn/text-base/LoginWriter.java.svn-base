package org.springside.log.appender;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PreDestroy;
import javax.annotation.Resource;
import javax.sql.DataSource;

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

/**
 * @类名称：LoginWriter   
 * @类描述：日志操作   
 * @作者：Administrator   
 * @创建时间：2014-10-24 上午10:31:00   
 * @修改人：Administrator   
 * @修改时间：2014-10-24 上午10:31:00   
 * @修改备注：   
 * @版权：
 * @version
*/
public class LoginWriter extends BlockingConsumer {
	protected List<Map<String, String>> eventsBuffer = Lists.newArrayList();
	protected int batchSize = 1;
	protected NamedParameterJdbcOperations jdbcTemplate;
	protected TransactionTemplate transactionTemplate;
	protected String sql = "insert into ss_user_log (id,user_id,ip,log_time,log_type,session_id,log_count) values(:id,:user_id,:ip,:log_time,:log_type,:session_id,:log_count)";

	@Resource
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}

	/**
	 * @方法名: setDefaultTransactionManager
	 * @描述: 根据注入的aklTransactionManager创建transactionTemplate
	 * @参数 @param defaultTransactionManager
	 * @返回类型 void    
	 * @throws
	 */
	@Resource(name = "transactionManager")
	public void setDefaultTransactionManager(PlatformTransactionManager defaultTransactionManager) {
		transactionTemplate = new TransactionTemplate(defaultTransactionManager);
	}

	@PreDestroy
	@Override
	protected void clean() {
		if (!eventsBuffer.isEmpty()) {
			updateBatch();
		}
		logger.debug("cleaned task {}", this);

	}

	public void updateBatch() {
		try {
			//分析事件列表, 转换为jdbc批处理参数.
			int i = 0;

			Map[] paramMapArray = new HashMap[eventsBuffer.size()];
			for (Map<String, String> event : eventsBuffer) {
				String csql = "select count(1) from ss_user_log where log_type='0' and user_id='"
						+ event.get("user_id").toString() + "'";

				int log_count = jdbcTemplate.queryForInt(csql, new HashMap()) + 1;
				if (event.get("log_type").toString().equals("0"))
					event.put("log_count", log_count + "");
				else
					event.put("log_count", null);
				paramMapArray[i++] = (event);
			}
			final SqlParameterSource[] batchParams = SqlParameterSourceUtils.createBatch(paramMapArray);

			//执行批量插入,如果失败调用失败处理函数.
			transactionTemplate.execute(new TransactionCallbackWithoutResult() {
				@Override
				protected void doInTransactionWithoutResult(TransactionStatus status) {
					try {
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
