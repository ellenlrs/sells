/*
 * Created on 2005/6/24
 *
 */
package com.sells.common.mail;

/**
 * @author davideLin
 * 
 */
@SuppressWarnings("serial")
public class MailException extends Exception {
  /**
   * Default constructor
   */
  public MailException() {
    super();
  }

  /**
   * @param s
   */
  public MailException(String s) {
    super(s);
  }
}