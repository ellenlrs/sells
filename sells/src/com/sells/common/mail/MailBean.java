/**
 * Title:        MailBean.java<p>
 * Description:  MailBean Api<p>
 * Copyright:    Copyright (c) Jinwei <p>
 * Company:      davide <p>
 * @author       Jinwei Lin
 * @version      3.0
 * Date          2002/02/18
 */
package com.sells.common.mail;

/**
 * 寄送Mail的設定
 * @author davide
 * 
 */
public class MailBean {
  private String subject = "";
  private String charset = "Big5";
  private String contant = "text/html";
  private String message = "";
  private String filename = "";
  private String from = "";
  private String fromName = "";
  private String to = "";
  private String toName = "";
  private String cc = "";
  private String bcc = "";
  private String body = "";
  private String mailServer = "localhost";
  private String threadName = "Ggogo";
  private String username = "" ;
  private String password = "" ;

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  /**
   * @return Returns the cc.
   */
  public String getCc() {
    return cc;
  }

  /**
   * @param cc
   *          The cc to set.
   */
  public void setCc(String cc) {
    this.cc = cc;
  }

  /**
   * @return Returns the charset.
   */
  public String getCharset() {
    return charset;
  }

  /**
   * @param charset
   *          The charset to set.
   */
  public void setCharset(String charset) {
    this.charset = charset;
  }

  /**
   * @return Returns the contant.
   */
  public String getContant() {
    return contant;
  }

  /**
   * @param contant
   *          The contant to set.
   */
  public void setContant(String contant) {
    this.contant = contant;
  }

  /**
   * @return Returns the filename.
   */
  public String getFilename() {
    return filename;
  }

  /**
   * @param filename
   *          The filename to set.
   */
  public void setFilename(String filename) {
    this.filename = filename;
  }

  /**
   * @return Returns the from.
   */
  public String getFrom() {
    return from;
  }

  /**
   * @param from
   *          The from to set.
   */
  public void setFrom(String from) {
    this.from = from;
  }

  /**
   * @return Returns the fromName.
   */
  public String getFromName() {
    return fromName;
  }

  /**
   * @param fromName
   *          The fromName to set.
   */
  public void setFromName(String fromName) {
    this.fromName = fromName;
  }

  /**
   * @return Returns the mailServer.
   */
  public String getMailServer() {
    return mailServer;
  }

  /**
   * @param mailServer
   *          The mailServer to set.
   */
  public void setMailServer(String mailServer) {
    this.mailServer = mailServer;
  }

  /**
   * @return Returns the message.
   */
  public String getMessage() {
    return message;
  }

  /**
   * @param message
   *          The message to set.
   */
  public void setMessage(String message) {
    this.message = message;
  }

  /**
   * @return Returns the subject.
   */
  public String getSubject() {
    return subject;
  }

  /**
   * @param subject
   *          The subject to set.
   */
  public void setSubject(String subject) {
    this.subject = subject;
  }

  /**
   * @return Returns the threadName.
   */
  public String getThreadName() {
    return threadName;
  }

  /**
   * @param threadName
   *          The threadName to set.
   */
  public void setThreadName(String threadName) {
    this.threadName = threadName;
  }

  /**
   * @return Returns the to.
   */
  public String getTo() {
    return to;
  }

  /**
   * @param to
   *          The to to set.
   */
  public void setTo(String to) {
    this.to = to;
  }

  /**
   * @return Returns the toName.
   */
  public String getToName() {
    return toName;
  }

  /**
   * @param toName
   *          The toName to set.
   */
  public void setToName(String toName) {
    this.toName = toName;
  }
  /**
   * @return Returns the bcc.
   */
  public String getBcc() {
    return bcc;
  }
  /**
   * @param bcc The bcc to set.
   */
  public void setBcc(String bcc) {
    this.bcc = bcc;
  }
  /**
   * @return Returns the body.
   */
  public String getBody() {
    return body;
  }
  /**
   * @param body The body to set.
   */
  public void setBody(String body) {
    this.body = body;
  }
}