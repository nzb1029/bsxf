package org.bsxf.utils;

import org.apache.commons.lang3.StringUtils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Random;

/**
 * 提供各种对文件系统进行操作的工具. <br>
 * 在应用程序中，经常需要对文件系统进行操作，例如复制、移动、删除文件，查找文件的路径，对文件进行写操作等， 类FileUtils提供了与此相关的各种工具。
 */
public class FileUtils {
	private static final File POOL_FILE = getUniqueFile(FileUtils.class,
			".deletefiles");

	private static ArrayList deleteFilesPool;
	static {
		try {
			initPool();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 读出以前未删除的文件列表
	 * 
	 * @throws Exception
	 * @throws IOException
	 */
	private static void initPool() {
		if (POOL_FILE.exists() && POOL_FILE.canRead()) {
			try {
				ObjectInputStream in = new ObjectInputStream(
						new FileInputStream(POOL_FILE));
				deleteFilesPool = (ArrayList) in.readObject();
				in.close();
			} catch (Exception e) {
				deleteFilesPool = new ArrayList();
			}
		} else {
			deleteFilesPool = new ArrayList();
		}

	}

	/**
	 * 构造方法，禁止实例化
	 */
	private FileUtils() {
	}

	/**
	 * 复制文件. <br>
	 * <br>
	 * <b>示例: </b>
	 * 
	 * <pre>
	 * FileUtils.copyFile(&quot;/home/app/config.xml&quot;, &quot;/home/appbak/config_bak.xml&quot;)
	 * </pre>
	 * 
	 * @param fromFile
	 *            源文件，包括完整的绝对路径和文件名
	 * @param toFile
	 *            目标文件，包括完整的绝对路径和文件名，目标路径必须已经存在，该方法不负责创建新的目录
	 * @throws IOException
	 *             抛出IOException
	 */
	public static void copyFile(String fromFile, String toFile)
			throws IOException {
		FileInputStream in = new FileInputStream(fromFile);
		FileOutputStream out = new FileOutputStream(toFile);
		byte b[] = new byte[1024];
		int len;
		while ((len = in.read(b)) != -1) {
			out.write(b, 0, len);
		}
		out.close();
		in.close();
	}

	/**
	 * 得到短文件名. <br>
	 * <br>
	 * <b>示例: </b> <br>
	 * FileUtils.getShortFileName("/home/app/config.xml") 返回 "config.xml"
	 * FileUtils.getShortFileName("C:\\test\\config.xml") 返回 "config.xml"</br>
	 * 
	 * @param fileName
	 *            文件名
	 * @return 短文件名
	 */
	public static String getShortFileName(String fileName) {
		String shortFileName = "";
		int pos = fileName.lastIndexOf('\\');
		if (pos == -1) {
			pos = fileName.lastIndexOf('/');
		}
		if (pos > -1) {
			shortFileName = fileName.substring(pos + 1);
		} else {
			shortFileName = fileName;
		}
		return shortFileName;
	}

	/**
	 * 得到不带扩展名的短文件名. <br>
	 * <br>
	 * <b>示例: </b> <br>
	 * FileUtils.getShortFileNameWithoutExt("/home/app/config.xml") 返回 "config"<br>
	 * FileUtils.getShortFileNameWithoutExt("C:\\test\\config.xml") 返回
	 * "config"</br>
	 * 
	 * @param fileName
	 *            文件名
	 * @return 短文件名
	 */
	public static String getShortFileNameWithoutExt(String fileName) {
		String shortFileName = getShortFileName(fileName);
		shortFileName = getFileNameWithoutExt(shortFileName);
		return shortFileName;
	}

	/**
	 * 得到文件内容
	 * 
	 * @param fileName
	 *            文件名称
	 * @return 文件内容
	 * @throws Exception
	 */
	public static String read(String fileName) throws Exception {
		String fileContent = "";
		fileContent = read(new FileInputStream(fileName));
		return fileContent;
	}

	/**
	 * 得到文件内容
	 * 
	 * @param file
	 *            文件
	 * @return 文件内容
	 * @throws Exception
	 */
	public static String read(File file) throws Exception {
		String fileContent = "";
		fileContent = read(new FileInputStream(file));
		return fileContent;
	}

	/**
	 * 得到输入流的内容
	 * 
	 * @param is
	 *            输入流
	 * @return 字符串
	 * @throws Exception
	 */
	public static String read(InputStream is) throws Exception {
		byte[] result = readBytes(is);
		return new String(result);
	}

	/**
	 * 以byte数组方式得到输入流的内容
	 * 
	 * @param fileName
	 *            文件名称
	 * @return byte数组
	 * @throws Exception
	 */
	public static byte[] readBytes(String fileName) throws Exception {
		return readBytes(new FileInputStream(fileName));
	}

	/**
	 * 以byte数组方式得到输入流的内容
	 * 
	 * @param file
	 *            文件
	 * @return byte数组
	 * @throws Exception
	 */
	public static byte[] readBytes(File file) throws Exception {
		return readBytes(new FileInputStream(file));
	}

	/**
	 * 以byte数组方式得到输入流的内容
	 * 
	 * @param is
	 *            输入流
	 * @return byte数组
	 * @throws Exception
	 */
	public static byte[] readBytes(InputStream is) throws Exception {
		if (is == null || is.available() < 1) {
			return new byte[0];
		}
		byte[] buff = new byte[8192];
		byte[] result = new byte[is.available()];
		int nch;
		BufferedInputStream in = new BufferedInputStream(is);
		int pos = 0;
		while ((nch = in.read(buff, 0, buff.length)) != -1) {
			System.arraycopy(buff, 0, result, pos, nch);
			pos += nch;
		}
		in.close();
		return result;
	}

	/**
	 * 写文件
	 * 
	 * @param content
	 *            文件内容
	 * @param file
	 *            文件对象
	 * @throws IOException
	 */
	public static void write(String content, File file) throws IOException {
		write(content.getBytes(), file);
	}

	/**
	 * 写文件
	 * 
	 * @param content
	 *            文件内容
	 * @param file
	 *            文件名
	 * @throws IOException
	 */
	public static void write(String content, String file) throws IOException {
		write(content, new File(file));
	}

	/**
	 * 写文件
	 * 
	 * @param bytes
	 *            文件内容
	 * @param file
	 *            文件名
	 * @throws IOException
	 */
	public static void write(byte[] bytes, String file) throws IOException {
		write(bytes, new File(file));
	}

	/**
	 * 写文件
	 * 
	 * @param bytes
	 *            文件内容
	 * @param file
	 *            文件
	 * @throws IOException
	 */
	public static void write(byte[] bytes, File file) throws IOException {
		FileOutputStream out = new FileOutputStream(file);
		out.write(bytes);
		out.flush();
		out.close();
	}

	/**
	 * 返回不带扩展名的文件名
	 * 
	 * @param fileName
	 *            原始文件名
	 * @return 不带扩展名的文件名
	 */
	public static String getFileNameWithoutExt(String fileName) {
		String shortFileName = fileName;
		if (fileName.indexOf('.') > -1) {
			shortFileName = fileName.substring(0, fileName.lastIndexOf('.'));
		}
		return shortFileName;
	}

	/**
	 * 返回文件扩展名,带“.”
	 * 
	 * @param fileName
	 *            原始文件名
	 * @return 文件扩展名
	 */
	public static String getFileNameExt(String fileName) {
		String fileExt = "";
		if (fileName.indexOf('.') > -1) {
			fileExt = fileName.substring(fileName.lastIndexOf('.'));
		}
		return fileExt;
	}

	/**
	 * 得到唯一文件
	 * 
	 * @param fileName
	 *            原始文件名
	 * @return
	 */
	public synchronized static File getUniqueFile(File repository,
			String fileName) {
		String shortFileName = getShortFileName(fileName);
		String tempFileName = getFileNameWithoutExt(shortFileName);
		File file = new File(repository, shortFileName);
		String fileExt = getFileNameExt(shortFileName);
		while (file.exists()) {
			file = new File(repository, tempFileName + "-"
					+ Math.abs(new Random().nextInt()) + fileExt);
		}
		return file;
	}

	/**
	 * 删除文件方法，如果删除不掉，将该文件加入删除池，下次进行调用时将尝试删除池中的文件
	 * 
	 * @param fileName
	 *            fileName
	 */
	public static void deleteFile(String fileName) {
		File file = new File(fileName);
		if (file.exists()) {
			deleteFile(file);
		}
	}

	/**
	 * 删除文件方法，如果删除不掉，将该文件加入删除池，下次进行调用时将尝试删除池中的文件
	 * 
	 * @param file
	 *            file
	 */
	public static void deleteFile(File file) {
		file.delete();// 尝试删除文件
		if (file.exists()) {
			deleteFilesPool.add(file);
		}
		checkDeletePool();
	}

	/**
	 * 检查池，删除池中文件，如果删除成功则同时从池中移除。
	 */
	private static void checkDeletePool() {
		File file;
		for (int i = deleteFilesPool.size() - 1; i >= 0; i--) {
			file = (File) deleteFilesPool.get(i);
			file.delete();
			if (file.exists() == false) {
				deleteFilesPool.remove(i);
			}
		}
		try {
			ObjectOutputStream out = new ObjectOutputStream(
					new FileOutputStream(POOL_FILE));
			out.writeObject(deleteFilesPool);
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 得到唯一文件。一个类处在某个位置的class或jar包中，根据此位置得到此类对应的文件。<br>
	 * 不同位置的类得到的文件是不一样的。
	 * 
	 * @param cl
	 *            类
	 * @param extension
	 *            带点的文件扩展名
	 * @return
	 */
	public static File getUniqueFile(Class cl, String extension) {
		int key = 0;
		URL url = cl.getResource(getClassNameWithoutPackage(cl) + ".class");
		if (url != null) {
			key = url.getPath().hashCode();
		}
		File propFile = new File(System.getProperty("java.io.tmpdir"),
				getClassNameWithoutPackage(cl) + key + extension);
		return propFile;
	}

	private static String getClassNameWithoutPackage(Class cl) {
		String className = cl.getName();
		int pos = className.lastIndexOf('.') + 1;
		if (pos == -1)
			pos = 0;
		String name = className.substring(pos);
		return name;
	}

	/**
	 * 删除文件夹（不管是否文件夹为空）<br>
	 * 注意：非原子操作，删除文件夹失败时，并不能保证没有文件被删除。 * <br>
	 * <b>示例: </b> <br>
	 * FileUtils.deleteFolder("/home/tmp") 删除成功返回true.<br>
	 * FileUtils.deleteFolder("C:\\test") 删除成功返回true.</br>
	 * 
	 * @param delFolder
	 *            待删除的文件夹
	 * @return 如果删除成功则返回true，否则返回false
	 */
	public static boolean deleteFolder(File delFolder) {
		// 目录是否已删除
		boolean hasDeleted = true;
		// 得到该文件夹下的所有文件夹和文件数组
		File[] allFiles = delFolder.listFiles();

		for (int i = 0; i < allFiles.length; i++) {
			// 为true时操作
			if (hasDeleted) {
				if (allFiles[i].isDirectory()) {
					// 如果为文件夹,则递归调用删除文件夹的方法
					hasDeleted = deleteFolder(allFiles[i]);
				} else if (allFiles[i].isFile()) {
					try {// 删除文件
						if (!allFiles[i].delete()) {
							// 删除失败,返回false
							hasDeleted = false;
						}
					} catch (Exception e) {
						// 异常,返回false
						hasDeleted = false;
					}
				}
			} else {
				// 为false,跳出循环
				break;
			}
		}
		if (hasDeleted) {
			// 该文件夹已为空文件夹,删除它
			delFolder.delete();
		}
		return hasDeleted;
	}

	/**
	 * 得到Java类所在的实际位置。一个类处在某个位置的class或jar包中，根据此位置得到此类对应的文件。<br>
	 * 不同位置的类得到的文件是不一样的。
	 * 
	 * @param cl
	 *            类
	 * @return 类在系统中的实际文件名
	 */
	public static String getRealPathName(Class cl) {

		URL url = cl.getResource(getClassNameWithoutPackage(cl) + ".class");
		if (url != null) {
			return url.getPath();
		}
		return null;
	}

	/**
	 * 获取上传文件子路径
	 */
	public static String getSubPath(String blockId, String fileType, String field01) {
		String path = "";
		if (StringUtils.isNotBlank(blockId))
			path = path + File.separator + blockId;
		if (StringUtils.isNotBlank(fileType))
			path = path + File.separator + fileType;
		if (StringUtils.isNotBlank(field01))
			path = path + File.separator + field01;
		return path;
	}
}