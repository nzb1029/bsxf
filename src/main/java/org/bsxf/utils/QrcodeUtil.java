package org.bsxf.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.sun.imageio.plugins.common.ImageUtil;
import org.apache.commons.lang3.StringUtils;
import org.bsxf.common.service.bsxf.EquipmentManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.nio.file.FileSystems;
import java.nio.file.Path;

public class ImageUtil {
    private static Logger logger = LoggerFactory.getLogger(ImageUtil.class);
    private static final Integer QRCODE_WIDTH = 500;
    private static final Integer QRCODE_HEIGHT = 500;

    public static boolean generateQRCodeImage(String text, String filePath) {
        if (StringUtils.isBlank(text) || StringUtils.isBlank(filePath)) {
            logger.error("生成二维码失败，参数有误；二维码数据 [{}] 文件路径 [{}]", new Object[] {text, filePath});
            return false;
        }
        try {
            File file = new File(filePath);
            if (file.exists()) {
                logger.info("二维码已生成；路径：{}", filePath);
                return true;
            }
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            text = new String(text.getBytes("UTF-8"),"ISO-8859-1");
            BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, QRCODE_WIDTH, QRCODE_HEIGHT);
            Path path = FileSystems.getDefault().getPath(filePath);
            MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
            return true;
        } catch (Exception e) {
            logger.error("生成二维码失败，报错", e);
            return false;
        }
    }
}
