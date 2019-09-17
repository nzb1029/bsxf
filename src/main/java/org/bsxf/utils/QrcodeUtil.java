package org.bsxf.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.sun.imageio.plugins.common.ImageUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.List;

public class QrcodeUtil {
    private static Logger logger = LoggerFactory.getLogger(ImageUtil.class);
    private static final Integer QRCODE_WIDTH = 500;
    private static final Integer QRCODE_HEIGHT = 500;
    private static final Integer FONT_SIZE = 20;

    public static boolean generateQRCodeImage(String text, String desc, String filePath) {
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
            if (StringUtils.isNotBlank(desc)) {
                addDesc(desc, filePath);
            }
            return true;
        } catch (Exception e) {
            logger.error("生成二维码失败，报错", e);
            return false;
        }
    }

    public static boolean mergeQRCode(List<File> fileList, String outFilePath) {
        if (CollectionUtils.isEmpty(fileList) || StringUtils.isBlank(outFilePath)) {
            logger.error("生成二维码失败，参数有误；二维码文件个数 [{}] 文件输出路径 [{}]", new Object[] {fileList.size(), outFilePath});
            return false;
        }
        try {
            int totalHeight = fileList.size() * QRCODE_HEIGHT;
            int totalWidth = QRCODE_WIDTH;
            BufferedImage imgNew = new BufferedImage(totalWidth, totalHeight, BufferedImage.TYPE_INT_RGB);
            for (int i = 0; i < fileList.size(); i++) {
                File file = fileList.get(i);
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

    public static void addDesc(String desc, String filePath) {
        //x开始的位置：（图片宽度-字体大小*字的个数）/2
        int startX = (QRCODE_WIDTH - (FONT_SIZE * desc.length())) / 2;
        //y开始的位置：图片高度-（图片高度-图片宽度）/2
        int startY = QRCODE_WIDTH - FONT_SIZE;

        try {
            File file = new File(filePath);
            Image src = ImageIO.read(file);
            int imageW = src.getWidth(null);
            int imageH = src.getHeight(null);
            BufferedImage image = new BufferedImage(imageW, imageH, BufferedImage.TYPE_INT_RGB);
            Graphics g = image.createGraphics();
            g.drawImage(src, 0, 0, imageW, imageH, null);
            g.setColor(Color.BLACK);
            Font font = new Font("微软雅黑", Font.BOLD, FONT_SIZE);
            g.setFont(font);
            g.drawString(desc, startX, startY);
            g.dispose();

            FileOutputStream out = new FileOutputStream(filePath);
            ImageIO.write(image, "PNG", out);
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            encoder.encode(image);
            out.close();
        } catch (Exception e) {
            System.out.println(e);
            logger.error("添加注释报错，报错", e);
        }
    }
}
