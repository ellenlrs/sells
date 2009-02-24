/*
 * Created on 2005/6/28
 *
 */
package com.sells.common.mail;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

/**
 * Mail 寄送測試
 * @author davideLin
 *
 */
public class MailSend {

  public static void main(String[] args) {
    try {
      //mailBean.setTo("jinwei@eztravel.com.tw");
      //mailBean.setFrom("jinwei@eztravel.com.tw");
      //mailBean.setSubject("測試");
      //mailBean.setFromName("Jinwei 測試");
      //mailBean.setToName("Jinwei 林金微");
      //mailBean.setBody("測試二號");
      //mailBean.setCharset("UTF-8");
      //Mail mail = new Mail(mailBean);
      String dirSeparator = System.getProperty("file.separator");
      String tempDir = System.getProperty("user.home");

      System.out.println(dirSeparator);
      System.out.println(tempDir);
    } catch(Exception e){
      System.out.println(e.toString());
    }
    try {
      String userHome = System.getProperty("user.home");
      String dirSeparator = System.getProperty("file.separator");
      String propfile = "ggogo.prop";
      Properties props = new Properties();
      InputStream inprop = new FileInputStream(userHome+dirSeparator+propfile);
      props.load(inprop);
      inprop.close();
      String htmlpath = (String) props.get("htmlpath") ;
      String databaseName = (String) props.get("databaseName") ;
      String hostname = (String) props.get("hostname") ;
      String hostnameSsl = (String) props.get("hostnameSsl") ;
      String username = (String) props.get("username") ;
      String passwd = (String) props.get("passwd") ;
      String dburl=(String) props.get("dburl") ;
      System.out.println(htmlpath);
      System.out.println(databaseName);
      System.out.println(hostname);
      System.out.println(hostnameSsl);
      System.out.println(username);
      System.out.println(passwd);
      System.out.println(dburl);
    } catch (Exception e){
      System.out.println("Load properties file lost:"+e.toString());
    }
  }
}
