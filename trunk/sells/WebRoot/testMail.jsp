<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Transport"%>
<%@page import="com.sells.common.util.EcServer"%>
<%@ page contentType="text/html;charset=Utf-8"%>
<%@ page import="com.sells.common.mail.MailBean"%>
<%@ page import="com.sells.common.mail.Mail"%>
<%
/*
class MyAuthenticator extends javax.mail.Authenticator {
  private String strUser;
  private String strPwd;
  public MyAuthenticator(String user, String password) {
    this.strUser = user;
    this.strPwd = password;
  }

  protected PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication(strUser, strPwd);
  }
}*/

MailBean mailBean = new MailBean();
mailBean.setFrom("service@icart.tw");
mailBean.setFromName("Davide");
mailBean.setTo("service@icart.tw");
mailBean.setToName("Davide");
mailBean.setMailServer("localhost");
mailBean.setSubject("中文測試");
mailBean.setBody("中文測試");
mailBean.setCharset("UTF-8");
out.println(EcServer.getMailServer());
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
  oProperties_.put("mail.smtp.host","localhost");
  //oProperties_.put("mail.smtp.auth", "true");
  mMessage_.setSubject("TEST");
  javax.mail.Address fromAddress = new javax.mail.internet.InternetAddress("jinwei.lin@gmail.com"); ;
  mMessage_.setFrom(fromAddress);
  javax.mail.Address toAddress = new javax.mail.internet.InternetAddress("jinwei.lin@gmail.com"); ;
  mMessage_.setFrom(toAddress);
  mMessage_.setContent("MailBody..","text/html;charset=Utf-8") ;
  mMessage_.setSentDate(new java.util.Date());
  Transport transport = oSession_.getTransport("smtp");
  //transport.connect("mail.vivi-soap.net","vivibian","vv0220");
  transport.send(mMessage_);
  out.println("<BR>SEND");
} catch (Exception e) {
  out.println("<BR>GetPasswdAction mail e:" + e.getMessage());
}*/
/*
try {
  SecurityManager security = System.getSecurityManager();
  out.println("Security Manager:" + security);
	out.println("<BR>SEND START<BR>");
	Properties props = System.getProperties (); 
	props.put("mail.transport.protocol", "smtp"); 
	props.put("mail.smtp.host", "localhost");
	props.put("mail.smtp.localhost", "localhost");
	props.put("mail.smtp.auth", "false");
	props.put("mail.smtp.port", "25");
	//MyAuthenticator au = new MyAuthenticator("root@icart.tw","@auijoji");
	//javax.mail.Session oSession_ = javax.mail.Session.getDefaultInstance (props,au);
	javax.mail.Session oSession_ = javax.mail.Session.getDefaultInstance (props,null);
	oSession_.setDebug(true);
	out.println("SEND process<BR>");
	MimeMessage message = new MimeMessage(oSession_); 
	 out.println("SEND process1<BR>");
	message.setFrom(new InternetAddress("jinwei@eztravel.com.tw")); 
	message.setSubject("TEST"); 
	 out.println("SEND process2<BR>");
	message.setContent("TEST111中文字", "text/html;charset=Utf-8"); 
	 out.println("SEND process3<BR>");
	message.setRecipients(Message.RecipientType.TO, InternetAddress 
	    .parse("jinwei.lin@gmail.com,jinwei@eztravel.com.tw,jinwei.lin@msa.hinet.net,jinwei_tw@yahoo.com.tw")); 
	 out.println("SEND process4<BR>");
	message.setSentDate(new java.util.Date());
	Transport.send(message); 
	out.println("SENDED<BR>");
} catch (Exception e) {
  out.println("<BR>GetPasswdAction mail e:" + e.getMessage());
}
*/
%>