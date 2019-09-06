package org.bsxf.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

/**
 * MD5的算法在RFC1321 中定义 在RFC 1321中，给出了Test suite用来检验你的实现是否正确： MD5 ("") = d41d8cd98f00b204e9800998ecf8427e MD5 ("a") =
 * 0cc175b9c0f1b6a831c399e269772661 MD5 ("abc") = 900150983cd24fb0d6963f7d28e17f72 MD5 ("message digest") =
 * f96b697d7cb7938d525a2f31aaf161d0 MD5 ("abcdefghijklmnopqrstuvwxyz") = c3fcd3d76192e4007dfb496cca67e13b
 * 
 * @author haogj
 * 
 *         传入参数：一个字节数组 传出参数：字节数组的 MD5 结果字符串
 */
public class MD5Crypt {

	// Character set allowed for the salt string
	private static final String SALTCHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	// Character set of the encrypted password: A-Za-z0-9./
	private static final String itoa64 = "./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	private static final char hexDigits[] = { // 用来将字节转换成 16 进制表示的字符
	'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	public static String getMD5(byte[] source) {
		String s = null;

		try {
			java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			md.update(source);
			byte tmp[] = md.digest(); // MD5 的计算结果是一个 128 位的长整数，
			// 用字节表示就是 16 个字节
			char str[] = new char[16 * 2]; // 每个字节用 16 进制表示的话，使用两个字符，
			// 所以表示成 16 进制需要 32 个字符
			int k = 0; // 表示转换结果中对应的字符位置
			for (int i = 0; i < 16; i++) { // 从第一个字节开始，对 MD5 的每一个字节
				// 转换成 16 进制字符的转换
				byte byte0 = tmp[i]; // 取第 i 个字节
				str[k++] = hexDigits[byte0 >>> 4 & 0xf]; // 取字节中高 4 位的数字转换,
				// >>> 为逻辑右移，将符号位一起右移
				str[k++] = hexDigits[byte0 & 0xf]; // 取字节中低 4 位的数字转换
			}
			s = new String(str); // 换后的结果转换为字符串

		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}

	/**
	 * LINUX/BSD MD5Crypt function
	 * 
	 * @return The encrypted password as an MD5 hash
	 * @param password
	 *            Password to be encrypted
	 */
	public static final String crypt(String password) {
		StringBuffer salt = new StringBuffer();
		Random rnd = new Random();
		// build a random 8 chars salt
		while (salt.length() < 8) {
			int index = (int) (rnd.nextFloat() * SALTCHARS.length());
			salt.append(SALTCHARS.substring(index, index + 1));
		}
		// crypt
		return crypt(password, salt.toString(), "$1$");
	}

	/**
	 * LINUX/BSD MD5Crypt function
	 * 
	 * @return The encrypted password as an MD5 hash
	 * @param salt
	 *            Random string used to initialize the MD5 engine
	 * @param password
	 *            Password to be encrypted
	 */
	public static final String crypt(String password, String salt) {
		return crypt(password, salt, "$1$");
	}

	/**
	 * Linux/BSD MD5Crypt function
	 * 
	 * @throws java.lang.Exception
	 * @return The encrypted password as an MD5 hash
	 * @param magic
	 *            $1$ for Linux/BSB, $apr1$ for Apache crypt
	 * @param salt
	 *            8 byte permutation string
	 * @param password
	 *            user password
	 */
	public static final String crypt(String password, String salt, String magic) {
		byte finalState[];
		long l;
		/**
		 * Two MD5 hashes are used
		 */
		MessageDigest ctx, ctx1;
		try {
			ctx = MessageDigest.getInstance("md5");
			ctx1 = MessageDigest.getInstance("md5");
		} catch (NoSuchAlgorithmException ex) {
			System.err.println(ex);
			return null;
		}

		/* Refine the Salt first */
		/* If it starts with the magic string, then skip that */
		if (salt.startsWith(magic)) {
			salt = salt.substring(magic.length());
		}

		/* It stops at the first '$', max 8 chars */
		if (salt.indexOf('$') != -1) {
			salt = salt.substring(0, salt.indexOf('$'));
		}

		if (salt.length() > 8) {
			salt = salt.substring(0, 8);
		}

		/**
		 * Transformation set #1: The password first, since that is what is most unknown Magic string Raw salt
		 */
		ctx.update(password.getBytes());
		ctx.update(magic.getBytes());
		ctx.update(salt.getBytes());

		/* Then just as many characters of the MD5(pw,salt,pw) */
		ctx1.update(password.getBytes());
		ctx1.update(salt.getBytes());
		ctx1.update(password.getBytes());
		finalState = ctx1.digest(); // ctx1.Final();

		for (int pl = password.length(); pl > 0; pl -= 16) {
			ctx.update(finalState, 0, pl > 16 ? 16 : pl);
		}

		/**
		 * the original code claimed that finalState was being cleared to keep dangerous bits out of memory, but doing
		 * this is also required in order to get the right output.
		 */
		clearbits(finalState);

		/* Then something really weird... */
		for (int i = password.length(); i != 0; i >>>= 1) {
			if ((i & 1) != 0) {
				ctx.update(finalState, 0, 1);
			} else {
				ctx.update(password.getBytes(), 0, 1);
			}
		}
		finalState = ctx.digest();
		/**
		 * and now, just to make sure things don't run too fast On a 60 Mhz Pentium this takes 34 msec, so you would
		 * need 30 seconds to build a 1000 entry dictionary... (The above timings from the C version)
		 */
		for (int i = 0; i < 1000; i++) {
			try {
				ctx1 = MessageDigest.getInstance("md5");
			} catch (NoSuchAlgorithmException e0) {
				return null;
			}
			if ((i & 1) != 0) {
				ctx1.update(password.getBytes());
			} else {
				ctx1.update(finalState, 0, 16);
			}
			if ((i % 3) != 0) {
				ctx1.update(salt.getBytes());
			}
			if ((i % 7) != 0) {
				ctx1.update(password.getBytes());
			}
			if ((i & 1) != 0) {
				ctx1.update(finalState, 0, 16);
			} else {
				ctx1.update(password.getBytes());
			}
			finalState = ctx1.digest(); // Final();
		}

		/* Now make the output string */
		StringBuffer result = new StringBuffer();
		result.append(magic);
		result.append(salt);
		result.append("$");

		/**
		 * Build a 22 byte output string from the set: A-Za-z0-9./
		 */
		l = (bytes2u(finalState[0]) << 16) | (bytes2u(finalState[6]) << 8) | bytes2u(finalState[12]);
		result.append(to64(l, 4));

		l = (bytes2u(finalState[1]) << 16) | (bytes2u(finalState[7]) << 8) | bytes2u(finalState[13]);
		result.append(to64(l, 4));

		l = (bytes2u(finalState[2]) << 16) | (bytes2u(finalState[8]) << 8) | bytes2u(finalState[14]);
		result.append(to64(l, 4));

		l = (bytes2u(finalState[3]) << 16) | (bytes2u(finalState[9]) << 8) | bytes2u(finalState[15]);
		result.append(to64(l, 4));

		l = (bytes2u(finalState[4]) << 16) | (bytes2u(finalState[10]) << 8) | bytes2u(finalState[5]);
		result.append(to64(l, 4));

		l = bytes2u(finalState[11]);
		result.append(to64(l, 2));

		/* Don't leave anything around in vm they could use. */
		clearbits(finalState);

		return result.toString();
	}

	private static final void clearbits(byte bits[]) {
		for (int i = 0; i < bits.length; i++) {
			bits[i] = 0;
		}
	}

	/**
	 * convert an encoded unsigned byte value into a int with the unsigned value.
	 */
	static private final int bytes2u(byte inp) {
		return (int) inp & 0xff;
	}

	/**
	 * Function to return a string from the set: A-Za-z0-9./
	 * 
	 * @return A string of size (size) from the set A-Za-z0-9./
	 * @param size
	 *            Length of the string
	 * @param v
	 *            value to be converted
	 */
	private static final String to64(long v, int size) {
		StringBuffer result = new StringBuffer();
		while (--size >= 0) {
			result.append(itoa64.charAt((int) (v & 0x3f)));
			v >>>= 6;
		}
		return result.toString();
	}

	//解密
	public static String JM(String inStr) {
		String pass = null;
		try {
			pass = URLDecoder.decode(inStr, "utf-8");
		} catch (UnsupportedEncodingException e) {
			pass = inStr;
		}
		char[] a = pass.toCharArray();
		if (a.length % 3 != 0)
			return pass;
		char[] des = new char[a.length / 3];
		for (int i = 1, j = 0; i < a.length; i += 3) {
			des[j++] = (char) (a[i] ^ 't');
		}
		return new String(des);

	}

	// 加密
	public static String KL(String inStr, long type) {
		String s = new String(MD5Crypt.getMD5(String.valueOf(type).getBytes()));
		char[] a = inStr.toCharArray();
		char[] des = new char[a.length * 3];
		for (int i = 0, j = 0, k = 0; i < a.length; i++) {
			des[j++] = s.charAt(k++);
			des[j++] = (char) (a[i] ^ 't');
			des[j++] = s.charAt(k++);

		}
		String k = new String(des);
		try {
			return URLEncoder.encode(k, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return k;
		}
	}

}
