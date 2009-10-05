/* 
 * Created on 2005/6/28 
 * 
 */ 
package com.sells.common.mail; 
 
import java.io.FileInputStream; 
import java.io.InputStream; 
import java.security.Security; 
import java.util.Properties; 
 
import javax.mail.Message; 
import javax.mail.PasswordAuthentication; 
import javax.mail.Session; 
import javax.mail.Transport; 
import javax.mail.internet.InternetAddress; 
import javax.mail.internet.MimeMessage; 
 
/** 
 * Mail 寄送測試 
 *  
 * @author davideLin 
 *  
 */ 
public class MailSend { 
  public static void main(String[] args) { 
    long start = System.currentTimeMillis();
    MailSend mailsend = new MailSend(); 
    try { 
      //for ( int i=0 ; i < 100 ; i ++) {
        //mailsend.sendMail("test", "test", "jinwei.lin@gmail.com", "jinwei.lin@gmail.com");
      //}
    } catch (Exception e) { 
      // TODO Auto-generated catch block 
      e.printStackTrace(); 
    } 
 
    try { 
      MailBean mailBean = new MailBean(); 
      mailBean.setTo("jinwei@eztravel.com.tw"); 
      mailBean.setFrom("jinwei@eztravel.com.tw"); 
      mailBean.setSubject("測試－google"); 
      mailBean.setFromName("Jinwei 測試"); 
      mailBean.setToName("Jinwei 林金微"); 
      mailBean.setBody("測試二號"); 
//      mailBean.setMailServer("mail.vivibian.net"); 
//      mailBean.setUsername("vivibian"); 
//      mailBean.setPassword("vv0220"); 
      mailBean.setCharset("UTF-8"); 
      Mail mail = new Mail(mailBean); 
      // String dirSeparator = System.getProperty("file.separator"); 
      // String tempDir = System.getProperty("user.home"); 
      // 
      // System.out.println(dirSeparator); 
      // System.out.println(tempDir); 
    } catch (Exception e) { 
      System.out.println(e.toString()); 
    }
    System.out.println("time:"+(System.currentTimeMillis() - start )/1000);
    // try { 
    // String userHome = System.getProperty("user.home"); 
    // String dirSeparator = System.getProperty("file.separator"); 
    // String propfile = "ggogo.prop"; 
    // Properties props = new Properties(); 
    // InputStream inprop = new FileInputStream(userHome+dirSeparator+propfile); 
    // props.load(inprop); 
    // inprop.close(); 
    // String htmlpath = (String) props.get("htmlpath") ; 
    // String databaseName = (String) props.get("databaseName") ; 
    // String hostname = (String) props.get("hostname") ; 
    // String hostnameSsl = (String) props.get("hostnameSsl") ; 
    // String username = (String) props.get("username") ; 
    // String passwd = (String) props.get("passwd") ; 
    // String dburl=(String) props.get("dburl") ; 
    // System.out.println(htmlpath); 
    // System.out.println(databaseName); 
    // System.out.println(hostname); 
    // System.out.println(hostnameSsl); 
    // System.out.println(username); 
    // System.out.println(passwd); 
    // System.out.println(dburl); 
    // } catch (Exception e){ 
    // System.out.println("Load properties file lost:"+e.toString()); 
    // } 
  } 
  private String mailhost = "smtp.gmail.com" ; 
   
  public synchronized void sendMail(String subject, String body, String sender, 
      String recipients) throws Exception { 
    Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider()); 
    Properties props = new Properties(); 
    props.setProperty("mail.transport.protocol", "smtp"); 
    props.setProperty("mail.host", mailhost); 
    props.put("mail.smtp.auth", "true"); 
    props.put("mail.smtp.port", "465"); 
    props.put("mail.smtp.socketFactory.port", "465"); 
    props 
        .put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
    props.put("mail.smtp.socketFactory.fallback", "false"); 
    props.setProperty("mail.smtp.quitwait", "false"); 
    javax.mail.Session session = Session.getDefaultInstance(props, 
        new javax.mail.Authenticator() { 
          protected PasswordAuthentication getPasswordAuthentication() { 
            return new PasswordAuthentication("jinwei.lin@gmail.com", "sp8560690120"); 
          } 
        }); 
    MimeMessage message = new MimeMessage(session); 
    message.setFrom(new InternetAddress(sender)); 
    message.setSubject(subject); 
    message.setContent(body, "text/plain"); 
     
     
    if (recipients.indexOf(',') > 0) 
      message.setRecipients(Message.RecipientType.TO, InternetAddress 
          .parse(recipients)); 
    else 
      message.setRecipient(Message.RecipientType.TO, new InternetAddress( 
          recipients)); 
    
    Transport.send(message); 
     
  } 
} 