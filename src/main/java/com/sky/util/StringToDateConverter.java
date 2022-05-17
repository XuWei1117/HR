package com.sky.util;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Create by xww
 * 2021/9/14
 **/
//将字符串按照指定的格式(年-月-日,"yyyy-MM-dd")转为java.util.Date
//需要导入类 import org.springframework.core.convert.converter.Converter;
@SuppressWarnings("all")
public class StringToDateConverter implements Converter<String, Date> {
    @Override
    public Date convert(String s) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        if(s != null && !"".equals(s)){
            try {
                date = sdf.parse(s);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return date;
    }
}
