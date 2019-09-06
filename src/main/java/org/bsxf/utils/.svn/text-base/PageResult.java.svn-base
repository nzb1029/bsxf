package org.bsxf.utils;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;

public class PageResult<T> {

	private List<T> result = Lists.newArrayList();
	private Integer total;
	protected int pageNo = 1;
	protected int pageSize = -1;

	public PageResult() {
	}

	public PageResult(Page page) {
		setResult(page.getResult());
		setTotal(Integer.valueOf(page.getTotalCount() + ""));
		setPageNo(page.getPageNo());
		setPageSize(page.getPageSize());
	}

	public List<T> getResult() {
		return result;
	}

	public void setResult(List<T> result) {
		this.result = result;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@JsonIgnore
	public long getTotalPages() {
		if (total < 0) {
			return -1;
		}

		long count = total / pageSize;
		if (total % pageSize > 0) {
			count++;
		}
		return count;
	}

	@JsonIgnore
	/**
	 * 是否还有下一页.
	 */
	public boolean isHasNext() {
		return (pageNo + 1 <= getTotalPages());
	}

	@JsonIgnore
	/**
	 * 取得下页的页号, 序号从1开始.
	 * 当前页为尾页时仍返回尾页序号.
	 */
	public int getNextPage() {
		if (isHasNext()) {
			return pageNo + 1;
		} else {
			return pageNo;
		}
	}

	@JsonIgnore
	/**
	 * 是否还有上一页.
	 */
	public boolean isHasPre() {
		return (pageNo - 1 >= 1);
	}

	@JsonIgnore
	/**
	 * 取得上页的页号, 序号从1开始.
	 * 当前页为首页时返回首页序号.
	 */
	public int getPrePage() {
		if (isHasPre()) {
			return pageNo - 1;
		} else {
			return pageNo;
		}
	}
}
