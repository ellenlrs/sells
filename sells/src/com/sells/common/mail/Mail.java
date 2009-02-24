/*
 * Created on 2005/6/24
 *
 */
package com.sells.common.mail;

import java.util.Date;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Mail 寄送主物件
 * 
 * @author davideLin
 * 
 */
public class Mail implements Runnable {
  private Log log = LogFactory.getLog(Mail.class);
  private java.util.Properties oProperties_ = System.getProperties();
  private Session oSession_ = Session.getInstance(oProperties_, null);
  private MimeMessage mMessage_ = new MimeMessage(oSession_);
  Thread tMailThread_;
  private MailBean mailBean;

  /**
   * 建立 Mail 的實體 直接發送測試信
   * 
   * @throws MailException
   */
  public Mail() throws MailException {
    mailBean = new MailBean();
    mailBean.setTo("davide@Ggogo.com");
    mailBean.setFrom("davide@Ggogo.com");
    mailBean.setSubject("測試 ");
    mailBean.setFromName("Jinwei 測試 ");
    mailBean.setToName("Jinwei 林金微 ");
    mailBean.setBody("測試二號 ");
    try {
      tMailThread_ = new Thread(this, mailBean.getThreadName());
      oProperties_.put("mail.smtp.host", mailBean.getMailServer());
      oProperties_.put("mail.smtp.localhost", mailBean.getMailServer());
      setTo();
      setFrom();
      setSubject();
      setBody();
      if (!mailBean.getBcc().equals("") || mailBean.getBcc() != null) {
        setBcc();
      }
      if (!mailBean.getCc().equals("") || mailBean.getCc() != null) {
        setCc();
      }
      mailSendThread();
      log.info("Mail send1!");
    } catch (Exception e) {
      log.debug("Mail send exception1:" + e.getMessage());
      throw new MailException(e.getMessage());
    }
  }

  /**
   * 建立 Mail 的實體,須傳入一個 MailBean
   * 
   * @param mailBean
   *          發送Mail的相關設定
   * @throws MailException
   */
  public Mail(MailBean mailBean) throws MailException {
    this.mailBean = mailBean;
    try {
      tMailThread_ = new Thread(this, mailBean.getThreadName());
      oProperties_.put("mail.smtp.host", mailBean.getMailServer());
      oProperties_.put("mail.smtp.localhost", mailBean.getMailServer());
      setTo();
      setFrom();
      setSubject();
      setBody();
      if (!mailBean.getBcc().equals("") || mailBean.getBcc() != null) {
        setBcc();
      }
      if (!mailBean.getCc().equals("") || mailBean.getCc() != null) {
        setCc();
      }
      mailSendThread();
      log.info("Mail send2!");
    } catch (Exception e) {
      log.debug("Mail send exception2:" + e.getMessage());
      throw new MailException(e.getMessage());
    }
  }

  /**
   * 設定收件者,若有多位收件者可以用","隔開
   * 
   * @throws MessagingException
   */
  public void setTo() throws MessagingException {
    try {
      String[] toList = mailBean.getTo().split(",");
      String[] nameList = mailBean.getToName().split(",");
      Address[] toAddress = new Address[toList.length];
      for (int _i = 0; _i < toList.length; _i++) {
        if (nameList.length == 0 || nameList.length != toList.length) {
          toAddress[_i] = new InternetAddress(toList[_i], toList[_i], mailBean
              .getCharset());
        } else {
          toAddress[_i] = new InternetAddress(toList[_i], nameList[_i],
              mailBean.getCharset());
        }
      }
      mMessage_.setRecipients(Message.RecipientType.TO, toAddress);
    } catch (Exception e) {
      log.debug("Mail To Address error");
      throw new MessagingException("Mail to Address error");
    }
  }

  /**
   * 設定寄件者,email,UserName,字碼
   * 
   * @throws MessagingException
   */
  public void setFrom() throws MessagingException {
    try {
      Address fromAddress;
      if (mailBean.getFromName().equals("")) {
        fromAddress = new InternetAddress(mailBean.getFrom());
      } else {
        fromAddress = new InternetAddress(mailBean.getFrom(), mailBean
            .getFromName(), mailBean.getCharset());
      }
      mMessage_.setFrom(fromAddress);
    } catch (Exception e) {
      log.debug("Mail From Address error");
      throw new MessagingException("Mail From Address error");
    }
  }

  /**
   * 設定副本,若有多位副本可以用","隔開
   */
  public void setCc() throws MessagingException {
    try {
      mMessage_.setRecipients(Message.RecipientType.CC, InternetAddress
          .parse(mailBean.getCc()));
    } catch (Exception e) {
      log.debug("Mail Cc Address error");
      throw new MessagingException("Mail Cc Address error");
    }
  }

  /**
   * 設定密件副本,若有多位密件副本可以用","隔開
   */
  public void setBcc() throws MessagingException {
    try {
      mMessage_.setRecipients(Message.RecipientType.BCC, InternetAddress
          .parse(mailBean.getBcc()));
    } catch (Exception e) {
      log.debug("Mail Bcc Address error");
      throw new MessagingException("Mail Bcc Address error");
    }
  }

  /**
   * 設定信件主題,需加字碼,如中文字碼:Big5
   */
  public void setSubject() throws MessagingException {
    try {
      mMessage_.setSubject(mailBean.getSubject(), mailBean.getCharset());
    } catch (Exception e) {
      log.debug("Subject error");
      throw new MessagingException("Subject error");
    }
  }

  /**
   * 設定信件內容,和附加檔案的路徑,並設定字碼,中文字碼 "Big5"
   */
  public void setBody() throws MessagingException {
    try {
      if (mailBean.getFilename().length() != 0
          || mailBean.getFilename() == null) {
        MimeBodyPart mbp1 = new MimeBodyPart();
        MimeBodyPart mbp2 = new MimeBodyPart();
        mbp1.setContent(mailBean.getBody(), mailBean.getContant() + ";charset="
            + mailBean.getCharset());
        FileDataSource fds = new FileDataSource(mailBean.getFilename());
        mbp2.setDataHandler(new DataHandler(fds));
        mbp2.setFileName(fds.getName());
        Multipart mp = new MimeMultipart();
        mp.addBodyPart(mbp1);
        mp.addBodyPart(mbp2);
        mMessage_.setContent(mp);
      } else {
        mMessage_.setContent(mailBean.getBody(), mailBean.getContant()
            + ";charset=" + mailBean.getCharset());
      }
    } catch (Exception e) {
      log.debug("Body error");
      throw new MessagingException("Body error");
    }
  }

  /**
   * 以執行緒的方式將信件寄出
   */
  public void mailSendThread() throws SendFailedException {
    try {
      tMailThread_.start();
    } catch (Exception e) {
      log.debug("Send error1:" + e.toString());
      throw new SendFailedException("Send error:" + e.toString());
    }
  }

  /**
   * 執行緒的啟動區
   */
  public void run() {
    try {
      mMessage_.setSentDate(new Date());
      if (StringUtils.isNotBlank(mailBean.getUsername())
          && StringUtils.isNotBlank(mailBean.getPassword())) {
        Transport transport = oSession_.getTransport("smtp");
        transport.connect(mailBean.getMailServer(), mailBean.getUsername(),
            mailBean.getPassword());
        transport.sendMessage(mMessage_, mMessage_.getAllRecipients());
        transport.close();
      } else {
        Transport.send(mMessage_);
      }
    } catch (Exception e) {
      log.debug("Send error2:" + e.toString());
      System.out.println("Send error:" + e.toString());
    }
  }
}
