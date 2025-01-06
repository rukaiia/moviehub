package com.example.movie.common;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;

public class DateUtils {
    public static Date convertToDate(LocalDateTime localDateTime) {
        return Timestamp.valueOf(localDateTime);
    }
}

