package org.bsxf.utils;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.usermodel.DateUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ExcelUtil {
//    private static Logger logger = LoggerFactory.getLogger(ExcelUtil.class);

    private static FormulaEvaluator evaluator;
    private static final String OFFICE_EXCEL_XLS = ".xls";
    private static final String OFFICE_EXCEL_XLSX = ".xlsx";

    public static List<Map<String, Object>> getData(File file, String sheetName) {
//        logger.info("解析Excel开始；文件名[{}] sheet-name[{}]", file.getName(), sheetName);
        Workbook workbook = getWorkbook(file);
        Sheet sheet = getSheet(workbook, sheetName);
        Integer firstRowNum = sheet.getFirstRowNum();
        Integer lastRowNum = sheet.getLastRowNum();
        List<Map<String, Object>> dataMapList = new ArrayList<>(lastRowNum);
        Map<Integer, String> titleMap = getTitleMap(sheet.getRow(firstRowNum));
        for (int rowNum = firstRowNum + 1; rowNum <= lastRowNum; rowNum++) {
            dataMapList.add(getDataMap(sheet.getRow(rowNum), titleMap));
        }
        //logger.info("解析Excel结束；数据 {}", dataMapList);
        System.out.println("解析Excel结束；数据 {}"+dataMapList);
        return dataMapList;
    }

    /**
     * 根据文件对象获取Workbook对象
     * @param file 文件对象
     */
    private static Workbook getWorkbook(File file) {
        String fileName = file.getName();
        String suffix = FileUtils.getFileNameExt(fileName);
        if (!OFFICE_EXCEL_XLS.equals(suffix) && !OFFICE_EXCEL_XLSX.equals(suffix)) {
            //logger.error("文件不为excel文件");
            throw new RuntimeException("文件不为excel文件");
        }
        FileInputStream inputStream = null;
        Workbook workbook = null;
        try {
            inputStream = new FileInputStream(file);
            workbook = WorkbookFactory.create(inputStream);
            evaluator = workbook.getCreationHelper().createFormulaEvaluator();
            return workbook;
        } catch (Exception e) {
            //logger.error("解析Excel文件失败，失败报错：", e);
            throw new RuntimeException("解析Excel文件失败");
        } finally {
            try {
                if (workbook != null) {
                    workbook.close();
                }
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                //logger.error("对象关闭失败，失败报错：", e);
            }
        }
    }

    /**
     * 根据sheetName获取Sheet对象
     */
    private static Sheet getSheet(Workbook workbook, String sheetName) {
        Sheet sheet = workbook.getSheet(sheetName);
        if (sheet == null) {
            //logger.warn("未找到对应sheet，默认使用excel中的第一个sheet");
            sheet = workbook.getSheetAt(0);
        }
        return sheet;
    }

    private static Object getObject(Cell cell) {
        CellType cellType = cell.getCellTypeEnum();
        switch (cellType) {
            case STRING:
                return cell.getStringCellValue();
            case BOOLEAN:
                return cell.getBooleanCellValue();
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    return cell.getDateCellValue();
                } else {
                    return cell.getNumericCellValue();
                }
            case FORMULA:
                return evaluator.evaluateInCell(cell);
        }
        return "";
    }

    private static Map<Integer, String> getTitleMap(Row row) {
        Map<Integer, String> titleMap = new HashMap<>();
        if (row != null) {
            for (int colNum = row.getFirstCellNum(); colNum < row.getLastCellNum(); colNum++) {
                Cell cell = row.getCell(colNum);
                if (cell != null) {
                    Object obj = getObject(cell);
                    String titleStr = obj == null ? "" : obj.toString();
                    //logger.info("[title][{}, {}][{}] {}", new Object[] {cell.getRowIndex(), cell.getColumnIndex(),
                    //        cell.getCellTypeEnum(), titleStr});
                    titleMap.put(colNum, titleStr.toLowerCase());
                }
            }
        }
        return titleMap;
    }

    private static Map<String, Object> getDataMap(Row row, Map<Integer, String> titleMap) {
        Map<String, Object> dataMap = new HashMap<>();
        if (row != null) {
            for (int colNum = row.getFirstCellNum(); colNum <= row.getLastCellNum(); colNum++) {
                Cell cell = row.getCell(colNum);
                if (cell != null) {
                    Object obj = getObject(cell);
                    //logger.info("[data][{}, {}][{}] {}", new Object[] {cell.getRowIndex(), cell.getColumnIndex(),
                    //        cell.getCellTypeEnum(), obj.toString()});
                    if (obj != null && StringUtils.isNotBlank(titleMap.get(colNum))) {
                        dataMap.put(titleMap.get(colNum), obj);
                    }
                }
            }
        }
        return dataMap;
    }

    public static void main(String... args) {
        String path = "D:\\test - 副本.xlsx";
        File file =new File(path);
        ExcelUtil.getData(file, "Sheet1");
    }
}
