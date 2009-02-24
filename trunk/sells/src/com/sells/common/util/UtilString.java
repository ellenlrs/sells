package com.sells.common.util;

import java.text.*;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.Cookie;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;

/**
 * 字串共用函式
 * @author davidelin
 * 
 */
public class UtilString {

  /**
   * 將數值前面補零並轉成字串
   * @param mun
   * @param n
   * @return
   */
  public static String toString(int mun, int n) {
    return toString(String.valueOf(mun), n);
  }

  /**
   * 將數值前面補零並轉成字串
   * @param mun
   * @param n
   * @return
   */
  public static String toString(long mun, int n) {
    return toString(String.valueOf(mun), n);
  }

  /**
   * 將數值前面補零並轉成字串
   * @param toString
   *          將數值前面補零並轉成字串
   */
  public static String toString(String mun, int n) {
    String sFormat = "0" ;
    for (int i=0; i < n-1 ; i++){
      sFormat+="0";
    }
    return numSwitch(mun,sFormat);
  }

  /**
   * 將數值字串格式化
   * @param num
   * @param sFormat
   * @return
   */
  public static String numSwitch(String num, String sFormat) {
    if (!fpIsNull(num).equals("")) {
      try {
        @SuppressWarnings("unused")
        NumberFormat nf = NumberFormat.getInstance(Locale.TAIWAN);
        DecimalFormat df = new DecimalFormat(sFormat);
        return df.format(Long.parseLong(num));
      } catch (java.lang.NumberFormatException e) {
        return num;
      }
    }
    return "0";
  }

  /**
   * 將數值字串格式化
   * @param num
   * @param sFormat
   * @return
   * 將數值字串格式化
   */
  public static String numSwitch(long num, String sFormat) {
    try {
      @SuppressWarnings("unused")
      NumberFormat nf = NumberFormat.getInstance(Locale.TAIWAN);
      DecimalFormat df = new DecimalFormat(sFormat);
      return df.format(num);
    } catch (Exception e) {
      System.out.println("0Switch error !!");
    }
    return "0";
  }

  /**
   * 將物件 null 或 空白 轉成 空字串
   * @param s1
   * @return
   */
  public static String fpIsNull(Object s1) {
    return ObjectUtils.toString(s1);
  }
  
  /**
   * 將字串物件 null 或 空白 轉成 空字串
   * @param s1
   * @return
   */
  public static String fpOrdIsNull(Object s1) {
    return ObjectUtils.toString(s1);
  }

  /**
   * 將字串物件 null 或 空白 轉成 空字串
   * @param s1
   * @return
   */
  public static String fpIsNull(String s1) {
    return StringUtils.defaultString(s1);
  }

  /**
   * 將字串重新編碼使用Big5 
   * @param s 原字串
   * @return
   */
  public static String getString(String s) {
    return getString(s,"Big5");
  }

  /**
   * 將字串重新編碼
   * @param s 原字串
   * @param encode 編碼語系
   * @return
   */
  public static String getString(String s, String encode) {
    s = fpIsNull(s);
    if (s.length() != 0) {
      try {
        return new String(s.getBytes("iso-8859-1"), encode);
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    return "";
  }

  /**
   * 將字串物件以某符號來切割成陣列
   * @param s
   * @param v 切割字元
   * @return
   * 將字串物件以某符號來切割成陣列
   */
  public static String[] split(String s, String v) {
    return s.split(v) ;
  }

  /**
   * 將字串物件加密
   * @param buf
   * @return
   */
  public static String Encode(byte buf[]) {
    StringBuffer sb = new StringBuffer(2 * buf.length);
    for (int i = 0; i < buf.length; i++) {
      int h = (buf[i] & 0xf0) >> 4;
      int l = (buf[i] & 0x0f);
      sb.append(new Character((char) ((h > 9) ? 'a' + h - 10 : '0' + h)));
      sb.append(new Character((char) ((l > 9) ? 'a' + l - 10 : '0' + l)));
    }
    return sb.toString();
  }

  /**
   * 將字串物件解密
   * @param s
   * @return
   */
  public static String Decode(String s) {
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < s.length() / 2; i++) {
      int digit1 = s.charAt(i * 2);
      int digit2 = s.charAt(i * 2 + 1);
      if ((digit1 >= '0') && (digit1 <= '9'))
        digit1 -= '0';
      else if ((digit1 >= 'a') && (digit1 <= 'f'))
        digit1 -= 'a' - 10;
      if ((digit2 >= '0') && (digit2 <= '9'))
        digit2 -= '0';
      else if ((digit2 >= 'a') && (digit2 <= 'f'))
        digit2 -= 'a' - 10;
      sb.append((char) ((digit1 << 4) + digit2));
    }
    return sb.toString();
  }


  /**
   * 將物件 /n 轉成 <BR>
   * @param temp
   * @return
   */
  public static String transMultiline(String temp) {
    return temp.replaceAll("\n","<BR>");
  }

  /**
   * @param aDate yyyyMMdd
   * @param aFormat 要切割的字串
   * @return
   * 格式化日期
   */
  public static String dateSwitch(String aDate, String aFormat) {
    String tDate = "";
    if (aFormat.equals("date") && (aDate.length() == 8)) {
      tDate = aDate.substring(0, 4) + "/" + aDate.substring(4, 6) + "/"
          + aDate.substring(6, 8);
    } else if (aFormat.equals("time") && (aDate.length() == 4)) {
      tDate = aDate.substring(0, 2) + ":" + aDate.substring(2, 4);
    } else if (aFormat.equals("times") && (aDate.length() == 6)) {
      tDate = aDate.substring(0, 2) + ":" + aDate.substring(2, 4) + ":"
          + aDate.substring(4, 6);
    }
    return tDate;
  }

  /**
   * 字串取代
   * @param line
   * @param oldString
   * @param newString
   * @return
   * 字串取代
   */
  public static String replaceStr(String line, String oldString,
      String newString) {
    return line.replaceAll(oldString,newString);
  }
  
  /**
   * 判斷字串，是不是英文及數字
   * true-是正確
   * false-不正確
   * @param checkValue
   * @return
   */
  public static boolean isNumberEnglish(String checkValue) {
    return checkValue.matches("\\w+") ;
  }
  
  /**
   * @param oldString
   * @return
   */
  public static String toUrl(String oldString){
    String patternStr = "\\[url\\](.*?)\\[/url\\]";
    Pattern pattern = Pattern.compile(patternStr);
    Matcher matcher = pattern.matcher(oldString);
    return matcher.replaceAll("<a href='http://www.ggogo.com/ggogoWeb/keyword/keywordFind.do?getKeyword=$1' class='l_b' target='_new'>$1</a>");
  }
  
  public static HashMap getCookie(Cookie[] cks ) {
    HashMap hm = new HashMap();
    if (cks == null || cks.length == 0 ) 
      return null ;
    else {
      for (int i =0 ; i < cks.length ;i++) {
        hm.put(cks[i].getName(), cks[i].getValue());
      }
      return hm ;
    }
  }
}
