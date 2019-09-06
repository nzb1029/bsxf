package org.bsxf.utils;

import java.awt.Dimension;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.util.StringTokenizer;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;

import com.ckfinder.connector.configuration.IConfiguration;
import com.ckfinder.connector.data.AfterFileUploadEventArgs;
import com.ckfinder.connector.data.EventArgs;
import com.ckfinder.connector.data.IEventHandler;
import com.ckfinder.connector.data.PluginInfo;
import com.ckfinder.connector.data.PluginParam;
import com.ckfinder.connector.errors.ConnectorException;
import com.ckfinder.connector.utils.ImageUtils;

public class ProductImgResizeCommand implements IEventHandler {

	private PluginInfo pluginInfo;

	public ProductImgResizeCommand(PluginInfo info) {
		this.pluginInfo = info;
	}

	private String[] parseValue(String value) {
		StringTokenizer st = new StringTokenizer(value, "x");
		String[] res = new String[2];
		res[0] = st.nextToken();
		res[1] = st.nextToken();
		return res;
	}

	@Override
	public boolean runEventHandler(EventArgs args, IConfiguration configuration) throws ConnectorException {
		AfterFileUploadEventArgs ae = (AfterFileUploadEventArgs) args;
		String fileName = ae.getFile().getName();
		if (ae.getFile().getPath().indexOf(File.separator + "product" + File.separator) > -1) {

			try {
				String fileDir = PropertiesUtils.getFileDir();
				for (PluginParam param : pluginInfo.getParams()) {
					String[] params = parseValue(param.getValue());
					File dir = new File(fileDir + File.separator + param.getValue() + File.separator + "product");
					if (!dir.exists()) {
						dir.getParentFile().mkdir();
						dir.mkdir();
					}
					File descFile = new File(dir.getPath() + File.separator + fileName);
					Dimension d = createThumbDimension(ae.getFile(), Integer.valueOf(params[0]), Integer
							.valueOf(params[1]));
					ImageUtils.createResizedImage(ae.getFile(), descFile, Double.valueOf(d.getWidth()).intValue(),
							Double.valueOf(d.getHeight()).intValue(), configuration.getImgQuality());

				}

			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}

	private Dimension createThumbDimension(final File file, final int maxWidth, final int maxHeight) {
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

	public static void main(String[] args) {
		String fn = "sss.jpg";
		int n = StringUtils.lastIndexOf(fn, ".");
		String prefix = fn.substring(0, n);
		String subfix = fn.substring(n);
		//String fnl = StringUtils.substringBeforeLast(fn, ".");
		File f = new File("D:/app/product/triumph_big2.jpg");
		System.out.println(f.getPath());
		System.out.println(File.separator + "product" + File.separator);
		;
		System.out.println(f.mkdir());
	}
}
