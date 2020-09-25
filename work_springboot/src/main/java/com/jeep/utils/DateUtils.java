package com.jeep.utils;

import java.text.SimpleDateFormat;

public class DateUtils {
    public static String toSqlDate(java.util.Date utilDate){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = simpleDateFormat.format(utilDate);
        return format;
    }
}
