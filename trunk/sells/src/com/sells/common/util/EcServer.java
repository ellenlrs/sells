package com.sells.common.util;

/**
 * @author davide
 */
public class EcServer {
  private static String database ;
  private static String htmlpath;
  private static String hostname ;
  private static String hostnameSsl ;
  private static String username ;
  private static String passwd ;
  private static String dburl ;
  private static String educList;
  private static String apHost;
  private static String apPort;
  private static String ftpServer ;
  private static String ftpUsername ;
  private static String ftpPassword ;
  private static String ftpFilepath ;
  
  private static String mailServer ;
  private static String adminNo ;
  private static String sysName ;
  
  public static String getSysName() {
    return sysName;
  }
  public static void setSysName(String sysName) {
    EcServer.sysName = sysName;
  }
  /**
   * @return Returns the ftpFilepaht.
   */
  public static String getFtpFilepath() {
    return ftpFilepath;
  }
  /**
   * @param ftpFilepaht The ftpFilepaht to set.
   */
  public static void setFtpFilepath(String ftpFilepaht) {
    EcServer.ftpFilepath = ftpFilepaht;
  }
  /**
   * @return Returns the ftpPassword.
   */
  public static String getFtpPassword() {
    return ftpPassword;
  }
  /**
   * @param ftpPassword The ftpPassword to set.
   */
  public static void setFtpPassword(String ftpPassword) {
    EcServer.ftpPassword = ftpPassword;
  }
  /**
   * @return Returns the ftpServer.
   */
  public static String getFtpServer() {
    return ftpServer;
  }
  /**
   * @param ftpServer The ftpServer to set.
   */
  public static void setFtpServer(String ftpServer) {
    EcServer.ftpServer = ftpServer;
  }
  /**
   * @return Returns the ftpUsername.
   */
  public static String getFtpUsername() {
    return ftpUsername;
  }
  /**
   * @param ftpUsername The ftpUsername to set.
   */
  public static void setFtpUsername(String ftpUsername) {
    EcServer.ftpUsername = ftpUsername;
  }
  /**
   * @return Returns the apHost.
   */
  public static String getApHost() {
    return apHost;
  }
  /**
   * @param apHost The apHost to set.
   */
  public static void setApHost(String apHost) {
    EcServer.apHost = apHost;
  }
  /**
   * @return Returns the apPort.
   */
  public static String getApPort() {
    return apPort;
  }
  /**
   * @param apPort The apPort to set.
   */
  public static void setApPort(String apPort) {
    EcServer.apPort = apPort;
  }
  /**
   * @return Returns the educList.
   */
  public static String getEducList() {
    return educList;
  }
  /**
   * @param educList The educList to set.
   */
  public static void setEducList(String educList) {
    EcServer.educList = educList;
  }
  /**
   * @return Returns the database.
   */
  public static String getDatabase() {
    return database;
  }
  /**
   * @param database The database to set.
   */
  public static void setDatabase(String database) {
    EcServer.database = database;
  }
  /**
   * @param dburl The dburl to set.
   */
  public static void setDburl(String dburl) {
    EcServer.dburl = dburl;
  }
  /**
   * @param hostname The hostname to set.
   */
  public static void setHostname(String hostname) {
    EcServer.hostname = hostname;
  }
  /**
   * @param hostnameSsl The hostnameSsl to set.
   */
  public static void setHostnameSsl(String hostnameSsl) {
    EcServer.hostnameSsl = hostnameSsl;
  }
  /**
   * @param htmlpath The htmlpath to set.
   */
  public static void setHtmlpath(String htmlpath) {
    EcServer.htmlpath = htmlpath;
  }
  /**
   * @param passwd The passwd to set.
   */
  public static void setPasswd(String passwd) {
    EcServer.passwd = passwd;
  }
  /**
   * @param username The username to set.
   */
  public static void setUsername(String username) {
    EcServer.username = username;
  }
  
  /**
   * @return
   */
  public static String getHtmlpath() {
    return htmlpath ;
  }
  /**
   * @param filename
   * @return
   */
  public static String getHtmlpath(String filename) {
    return htmlpath+filename ;
  }
  /**
   * @return
   */
  public static String getHostname() {
    return hostname ;
  }
  /**
   * @return
   */
  public static String getHostnameSsl() {
    return hostnameSsl ;
  }
  /**
   * @return
   */
  public static String getUsername() {
    return username ;
  }
  /**
   * @return
   */
  public static String getPasswd() {
    return passwd ;
  }
  /**
   * @return
   */
  public static String getDburl() {
    return dburl ;
  }
  public static String getMailServer() {
    return mailServer;
  }

  public static void setMailServer(String mailServer) {
    EcServer.mailServer = mailServer;
  }

  public static String getAdminNo() {
    return adminNo;
  }
  public static void setAdminNo(String adminNo) {
    EcServer.adminNo = adminNo;
  }
}
