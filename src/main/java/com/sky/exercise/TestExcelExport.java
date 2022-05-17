package com.sky.exercise;



import com.sky.domain.Employee;
import com.sky.domain.Student;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Workbook;
import sun.misc.CEFormatException;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

public class TestExcelExport {
    public static void main(String[] args) throws IOException {
        File file = new File("e:/student.xls");
        if(!file.exists()){//创建一个file对象，如果文件不存在，创建指定文件
            file.createNewFile();
        }
        //创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = workbook.createSheet("sheet1");
        //在sheet中添加表头第0行
        HSSFRow row = sheet.createRow((int) 0);
        //创建单元格，设置值表头，设置表头居中
        HSSFCellStyle style = workbook.createCellStyle();
        //居中格式
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        //设置表头
        HSSFCell cell = null;
//        cell.setCellValue("STORERKEY");
//        cell.setCellStyle(style);

        cell = row.createCell(1);
        cell.setCellValue("id");
        cell.setCellStyle(style);

        cell = row.createCell(2);
        cell.setCellValue("姓名");
        cell.setCellStyle(style);

        cell = row.createCell(3);
        cell.setCellValue("年龄");
        cell.setCellStyle(style);

        ArrayList<Student> students = new ArrayList<>();
        students.add(new Student(1,"张三",21));
        students.add(new Student(2,"李四",23));
        students.add(new Student(3,"王五",25));
        //将单元格添加到sheet页中
        for (int i = 0; i < students.size(); i++) {
            row = sheet.createRow((int) i + 1);
            Student student = students.get(i);
            row.createCell(0).setCellValue(student.getId());
            row.createCell(1).setCellValue(student.getName());
            row.createCell(2).setCellValue(student.getAge());

        }
        //将工作薄关闭资源
        FileOutputStream outputStream = new FileOutputStream(file);
        try {
            workbook.write(outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            workbook.close();
        }

    }
}
