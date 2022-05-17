package com.sky.exercise;

import org.apache.poi.hssf.usermodel.*;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Test2 {
    public static void main(String[] args) throws IOException {
        // TODO Auto-generated method stub
        // 1.创建一个workbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        // 2.在workbook中添加一个sheet，对应Excel中的一个sheet
        HSSFSheet sheet = wb.createSheet("sheet1");
        // 3.在sheet中添加表头第0行，老版本poi对excel行数列数有限制short
        HSSFRow row = sheet.createRow((int) 0);
        // 4.创建单元格，设置值表头，设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        // 居中格式
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        // 设置表头
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("STORERKEY");
        cell.setCellStyle(style);

        cell = row.createCell(1);
        cell.setCellValue("学号");
        cell.setCellStyle(style);

        cell = row.createCell(2);
        cell.setCellValue("姓名");
        cell.setCellStyle(style);

        cell = row.createCell(3);
        cell.setCellValue("年龄");
        cell.setCellStyle(style);

        cell = row.createCell(4);
        cell.setCellValue("性别");
        cell.setCellStyle(style);

        List<DataBean> dataset = new ArrayList<DataBean>();
        dataset.add(new DataBean("10001", "张三", "21", "男"));
        dataset.add(new DataBean("20002", "李四", "22", "女"));
        dataset.add(new DataBean("30003", "王五", "23", "男"));

        // 循环将数据写入Excel
        for (int i = 0; i < dataset.size(); i++) {
            row = sheet.createRow((int) i + 1);
            DataBean list = dataset.get(i);
            // 创建单元格，设置值
            row.createCell(0).setCellValue(list.getData1());
            row.createCell(1).setCellValue(list.getData2());
            row.createCell(2).setCellValue(list.getData3());
            row.createCell(3).setCellValue(list.getData4());
            row.createCell(4).setCellValue(list.getData4());
        }
    /*
    Date d = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
    */

        String fileName = "查询学生信息";
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        wb.write(os);
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        FileOutputStream out = new FileOutputStream("e:/student2.xls");

        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;

        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            // Simple read/write loop.
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
        return;
    }
}












