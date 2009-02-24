package com.sells.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.lang.StringUtils;

public class DateUtils {

  /**
   * 將 Calendar 轉換成字串
   * @param calendar
   * @return
   */
  public static String toString(Calendar calendar){
    return toString(calendar,"yyyy/MM/dd HH:mm:ss");
  }
  
  /**
   * 將 Calendar 轉換成字串
   * @param calendar,dFormat 輸出格式，預設格式yyyy/MM/dd HH:mm:ss
   * @return
   */
  public static String toString(Calendar calendar,String dFormat){
    if ( calendar != null ) {
      if (dFormat.length() == 0 || dFormat == null ) {
        dFormat = "yyyy/MM/dd HH:mm:ss" ;
      }
      SimpleDateFormat formatter = new SimpleDateFormat (dFormat);
      return formatter.format(new java.util.Date()).toString();
    } else {
      return "";
    }
  }
  /**
   * 抓取今天日期
   * @param dFormat 輸出格式，預設格式yyyy/MM/dd HH:mm:ss
   * @return
   * 抓取今天日期
   */
  public static String getToday(String dFormat){
    if (dFormat.length() == 0 || dFormat == null ) {
      dFormat = "yyyy/MM/dd HH:mm:ss" ;
    }
    SimpleDateFormat formatter = new SimpleDateFormat (dFormat);
    return formatter.format(new java.util.Date()).toString();
  }

  /**
   * 抓取今天日期
   * @return
   * 抓取今天日期，預設 yyyyMMddHHmmss
   */
  public static String getToday(){
    return getToday("yyyyMMddHHmmss");
  }

  /**
   * 取得今天加 d 天的日期
   * @param d 幾天
   * @param dFormat 輸出格式
   * @return
   * 取得今天加 d 天的日期
   */
  public static String getTodayAddDays(int d,String dFormat) {
    Calendar calendar = new GregorianCalendar(1900,1,1);
    calendar.setTime(new java.util.Date());
    return getTodayAddDays(calendar,d,dFormat);
  }
  
  /**
   * 取得今天加 d 天的日期
   * @param startday
   * @param d
   * @param dFormat 輸出格式
   * @return
   * 取得 startday 加 d 天的日期
   */
  public static String getTodayAddDays(String startday , int d , String dFormat) {
    Calendar calendar = new GregorianCalendar(Integer.parseInt(startday.substring(0,4)),
        Integer.parseInt(startday.substring(4,6))-1,
        Integer.parseInt(startday.substring(6,8)));
    return getTodayAddDays(calendar,d,dFormat);
  }

  /**
   * 取得今天加 d 天的日期
   * @param Calendar startday 
   * @param d
   * @param dFormat 輸出格式
   * @return
   * 取得 startday 加 d 天的日期
   */
  public static String getTodayAddDays(Calendar startday , int d , String dFormat) {
    SimpleDateFormat formatter = new SimpleDateFormat (dFormat);
    Calendar calendar = new GregorianCalendar(startday.get(Calendar.YEAR),
        startday.get(Calendar.MONTH),
        startday.get(Calendar.DATE)+d);
    return formatter.format(calendar.getTime());
  }

  /**
   * 取得今天加 d 天的日期
   * @param Date startday
   * @param d
   * @param dFormat 輸出格式
   * @return 
   * 取得 startday 加 d 天的日期
   */
  public static String getTodayAddDays(Date startday , int d , String dFormat) {
    Calendar calendarNow = new GregorianCalendar();
    calendarNow.setTime(startday);

    return getTodayAddDays(calendarNow,d,dFormat);
  }

  /**
   * 取得日期相差天數
   * @param String startday
   * @param String endday
   * @return 天數
   * 取得日期相差天數
   */
  public static int getDiffDays(String startday, String endday) {
    Calendar calendarStart = new GregorianCalendar(Integer.parseInt(startday.substring(0,4)),
        Integer.parseInt(startday.substring(4,6))-1,
        Integer.parseInt(startday.substring(6,8)));

    Calendar calendarEnd = new GregorianCalendar(Integer.parseInt(endday.substring(0,4)),
        Integer.parseInt(endday.substring(4,6))-1,
        Integer.parseInt(endday.substring(6,8)));

    int _iDiffDays = Integer.parseInt(""+
        (calendarEnd.getTime().getTime()-calendarStart.getTime().getTime()) / 86400000);
    return _iDiffDays;
  }
  
  /**
   * 驗証是不是日期格式
   * @param date
   * @param prefix
   * @return
   */
  public static boolean isDate(String date,String prefix) {
    boolean check = false ;
    if ( StringUtils.isNotEmpty(prefix)) {
      if (date.length() == 10 ) {
        //去判斷日期是否正確
        try {
          String[] aDate = date.split( prefix ) ;
          check = getTodayAddDays(aDate[0]+aDate[1]+aDate[2],0,"yyyy"+prefix+"MM"+prefix+"dd").equals(date);
        } catch(Exception e) {}
      }
    } else {
      //去判斷日期是否正確
      check = getTodayAddDays(date,0,"yyyy"+prefix+"MM"+prefix+"dd").equals(date);
    }
    return check ;
  }
  
}
