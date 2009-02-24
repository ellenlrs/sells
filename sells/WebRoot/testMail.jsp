<%@ page contentType="text/html;charset=Utf-8"%>
<%@ page import="com.sells.common.mail.MailBean"%>
<%@ page import="com.sells.common.mail.Mail"%>
<%
MailBean mailBean = new MailBean();
mailBean.setFrom("service@icart.tw");
mailBean.setFromName("Davide");
mailBean.setTo("jinwei_tw@yahoo.com.tw");
mailBean.setToName("Davide");
mailBean.setMailServer("localhost");
mailBean.setSubject("TEST4");
mailBean.setBody("GGGGGGGG");
mailBean.setCharset("UTF-8");
out.println("111");
try {
  Mail mail = new Mail(mailBean);
} catch (Exception e) {
  out.println("GetPasswdAction mail e:" + e.getMessage());
}
out.println("222");
/*
try {
  java.util.Properties oProperties_ = System.getProperties ();
  javax.mail.Session oSession_ = javax.mail.Session.getInstance (oProperties_,null);
  javax.mail.internet.MimeMessage mMessage_ = new javax.mail.internetMimeMessage(oSession_);
  oSession_.setDebug(true);
  oProperties_.put("mail.smtp.host","mail.vivi-soap.net");
  oProperties_.put("mail.smtp.auth", "true");
  mMessage_.setSubject("TEST");
  javax.mail.Address fromAddress = new javax.mail.internet.InternetAddress("jinwei.lin@gmail.com"); ;
  mMessage_.setFrom(fromAddress);
  javax.mail.Address toAddress = new javax.mail.internet.InternetAddress("jinwei.lin@gmail.com"); ;
  mMessage_.setFrom(toAddress);
  mMessage_.setContent("MailBody..","text/html;charset=Utf-8") ;
  mMessage_.setSentDate(new java.util.Date());
  Transport transport = oSession_.getTransport("smtp");
  transport.connect("mail.vivi-soap.net","vivibian","vv0220");
  transport.send(mMessage_);
  out.println("<BR>SEND");
} catch (Exception e) {
  out.println("<BR>GetPasswdAction mail e:" + e.getMessage());
}*/
%>