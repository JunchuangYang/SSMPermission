package com.itheima.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author LiZongXiao
 * @create 2020/5/16 23:59
 * 日期工具类
 */
public class DateUtils {

    public static final String DATE_YYYY_MM_DD = "yyyy-MM-dd HH:mm";

    /**
     * 日期转换成字符串
     * @param date
     * @param dateType
     * @return
     */
    public static String datetoString(Date date,String dateType){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateType);
        String format = simpleDateFormat.format(date);
        return format;
    }
}
