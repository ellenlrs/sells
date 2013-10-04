<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Transport"%>>
<%@ page contentType="text/html;charset=Utf-8"%>
<%
int PORT = 25;
String FROM = "nobody@icart.tw";
String SUBJECT = "TEST123456789";
String TO = "jinwei.lin@gmail.com";
String BODY = "Mail Body TEST";
String HOST = "email-smtp.us-east-1.amazonaws.com" ;
String SMTP_USERNAME="AKIAJJWJGNFMGEU2TWHQ";
String SMTP_PASSWORD ="An2ZFZQZsktdLxJM3OvByyxzRXwtTptOn2Gads8WO8lK";

Properties props = System.getProperties();
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.port", PORT); 

// Set properties indicating that we want to use STARTTLS to encrypt the connection.
// The SMTP session will begin on an unencrypted connection, and then the client
  // will issue a STARTTLS command to upgrade to an encrypted connection.
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.starttls.required", "true");

  // Create a Session object to represent a mail session with the specified properties. 
Session _session = Session.getDefaultInstance(props);

  // Create a message with the specified information. 
  MimeMessage msg = new MimeMessage(_session);
  msg.setFrom(new InternetAddress(FROM));
  msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
  msg.setSubject(SUBJECT);
  msg.setContent(BODY,"text/plain");
      
  // Create a transport.        
  Transport transport = _session.getTransport();
              
  // Send the message.
  try  {
      out.println("Attempting to send an email through the Amazon SES SMTP interface...<BR>");
      // Connect to Amazon SES using the SMTP username and password you specified above.
      transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
  	
      // Send the email.
      transport.sendMessage(msg, msg.getAllRecipients());
      out.println("Email sent!<BR>");
  } catch (Exception ex) {
    out.println("The email was not sent.<BR>");
  	out.println("Error message:<BR> " + ex.getMessage());
  } finally {
      // Close and terminate the connection.
      transport.close();        	
  }
%>
