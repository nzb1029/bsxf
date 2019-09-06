package org.bsxf.utils;

import java.awt.Dimension;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;

import com.ckfinder.connector.utils.ImageUtils;

public class ImageResizeUtil {
	private final static float quality = 0.8f;

	/**
	 * 生成缩略图用
	 * */
	public static void resizeImg(String fpath, File sourceImgFile, Integer maxWidth, Integer maxHeight)
			throws Exception {
		File descFile = new File(fpath);
		if (!descFile.exists()) {
			descFile.getParentFile().mkdirs();
			descFile.createNewFile();
		}
		Dimension d = createThumbDimension(sourceImgFile, maxWidth, maxHeight);
		ImageUtils.createResizedImage(sourceImgFile, descFile, Double.valueOf(d.getWidth()).intValue(), Double.valueOf(
				d.getHeight()).intValue(), quality);

	}

	private static Dimension createThumbDimension(final File file, final int maxWidth, final int maxHeight) {
		Dimension dimension = new Dimension();
		try {
			BufferedInputStream bufferedIS = new BufferedInputStream(FileUtils.openInputStream(file));
			bufferedIS.mark(Integer.MAX_VALUE);
			BufferedImage image = ImageIO.read(bufferedIS);

			if (image.getWidth() >= image.getHeight()) {
				if (image.getWidth() >= maxWidth) {
					dimension.width = maxWidth;
					dimension.height = Math.round(((float) maxWidth / image.getWidth()) * image.getHeight());
				} else {
					dimension.height = image.getHeight();
					dimension.width = image.getWidth();
				}
			} else {
				if (image.getHeight() >= maxHeight) {
					dimension.height = maxHeight;
					dimension.width = Math.round((((float) maxHeight / image.getHeight()) * image.getWidth()));
				} else {
					dimension.height = image.getHeight();
					dimension.width = image.getWidth();
				}
			}
		} catch (Exception e) {
		}

		return dimension;
	}
}
