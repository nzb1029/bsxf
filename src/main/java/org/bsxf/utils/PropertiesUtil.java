package org.bsxf.utils;

import java.io.File;
import java.util.Arrays;
import java.util.Comparator;

import org.springside.utils.PropertiesLoader;


/**
 * Properties Util函数.
 * 
 */
public class PropertiesUtil {

	private static PropertiesLoader propertiesLoader;


	 static {
		try {
			propertiesLoader = new PropertiesLoader("healthConfig.properties");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String get(String key) {
		return propertiesLoader.getProperty(key, "");
	}

	/**
	 * 按照最后修改时间对文件进行升序排序
	 */
	public static File[] getFileList(String str){
		File file = new File(str);
		File[] fileList = file.listFiles();
		Arrays.sort(fileList,new PropertiesUtil.CompratorByLastModifiedAsc());
		return fileList ;
	}
	
	/**
	 * 按照最后修改时间对文件进行降序排序
	 */
	public static File[] getFileListDesc(String str){
		File file = new File(str);
		File[] fileList = file.listFiles();
		Arrays.sort(fileList,new PropertiesUtil.CompratorByLastModifiedDesc());
		return fileList ;
	}
	/**
	 * 按照最后修改时间降序排列，
	 * 然后取第一个，即最新的文件
	 */
	public static File getLastyFile(String str){
		File[] fileList = getFileListDesc(str);
		if(fileList.length > 0){
			return fileList[0];
		}else{
			return null ;
		}
	}
	//按照最后修改时间对文件进行升序排序
	static   class CompratorByLastModifiedAsc implements Comparator<File> {  
        public int compare(File f1, File f2) {  
            long diff = f1.lastModified() - f2.lastModified();  
            if (diff > 0) {  
                return 1;  
            } else if (diff == 0) {  
                return 0;  
            } else {  
                return -1;  
            }  
        }  
   }
	
	//按照最后修改时间对文件进行降序排序
	static   class CompratorByLastModifiedDesc implements Comparator<File> {  
        public int compare(File f1, File f2) {  
            long diff = f1.lastModified() - f2.lastModified();  
            if (diff > 0) {  
                return -1;  
            } else if (diff == 0) {  
                return 0;  
            } else {  
                return 1;  
            }  
        }  
   }
}
