package org.bsxf.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.sun.imageio.plugins.common.ImageUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.List;

public class QrcodeUtil {
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

    public static boolean mergeQRCode(List<String> filePathList, String outFilePath) {
        if (CollectionUtils.isEmpty(filePathList) || StringUtils.isBlank(outFilePath)) {
            logger.error("生成二维码失败，参数有误；二维码文件路径 [{}] 文件输出路径 [{}]", new Object[] {filePathList, outFilePath});
            return false;
        }
        try {
            int totalHeight = filePathList.size() * QRCODE_HEIGHT;
            int totalWidth = QRCODE_WIDTH;
            BufferedImage imgNew = new BufferedImage(totalWidth, totalHeight, BufferedImage.TYPE_INT_RGB);
            for (int i = 0; i < filePathList.size(); i++) {
                String filePath = filePathList.get(i);
                File file = new File(filePath);
                BufferedImage img = ImageIO.read(file);
                int[] imgArray = new int[QRCODE_WIDTH * QRCODE_HEIGHT];
                img.getRGB(0, 0, QRCODE_WIDTH, QRCODE_HEIGHT, imgArray, 0, QRCODE_WIDTH);
                imgNew.setRGB(0, i * QRCODE_HEIGHT, QRCODE_WIDTH, QRCODE_HEIGHT, imgArray, 0, QRCODE_WIDTH);
            }
            File outFile = new File(outFilePath);
            ImageIO.write(imgNew, "png", outFile);// 写图片
            return true;
        } catch (Exception e) {
            logger.error("合并二维码失败，报错", e);
            return false;
        }
    }
}
