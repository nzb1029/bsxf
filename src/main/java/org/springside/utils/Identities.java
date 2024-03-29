/**
 * Copyright (c) 2005-2012 springside.org.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package org.springside.utils;

import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;

/**
 * 封装各种生成唯一性ID算法的工具类.
 * 
 * @author calvin
 */
public class Identities {

	private static SecureRandom random = new SecureRandom();

	/**
	 * 封装JDK自带的UUID, 通过Random数字生成, 中间有-分割.
	 */
	public static String uuid() {
		return UUID.randomUUID().toString();
	}

	/**
	 * 封装JDK自带的UUID, 通过Random数字生成, 中间无-分割.
	 */
	public static String uuid2() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	/**
	 * 使用SecureRandom随机生成Long. 
	 */
	public static long randomLong() {
		return Math.abs(random.nextLong());
	}

	/**
	 * 使用SecureRandom随机生成Long. 
	 */
	public static int randomInteger() {
		return Math.abs(random.nextInt());
	}

	private static SimpleDateFormat df = new SimpleDateFormat("yyMMdd");

	/**
	 * 使用SecureRandom随机生成16位订单编号. 
	 */
	public static String randomOrderNo() {
		int orderNo = Math.abs(random.nextInt());
		return StringUtils.rightPad(df.format(new Date()) + orderNo, 16, "0'");
	}

	/**
	 * 基于Base62编码的SecureRandom随机生成bytes.
	 */
	public static String randomBase62(int length) {
		byte[] randomBytes = new byte[length];
		random.nextBytes(randomBytes);
		return Encodes.encodeBase62(randomBytes);
	}

	public static void main(String[] args) {
		System.out.println(randomOrderNo());
		System.out.println(random.nextInt());
	}
}
