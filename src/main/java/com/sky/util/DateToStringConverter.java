package com.sky.util;

import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Create by xww
 * 2021/9/30
 **/
public class DateToStringConverter implements Converter<Date,String> {
    @Override
    public String convert(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String str = sdf.format(date);
        return str;
    }
}
