package org.kh.dajob;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSend {
	public EmailSend(){};
	
	public void emailSend(String recvID, String title, String content){
		 String host = "smtp.naver.com"; // 사용하는 메일
		 final String user = "vxxoov";  // 보내는 사람 ID
		 final String password  = "skdlzl12!@#"; // 보내는 사람 PassWord
		 String to = recvID; // 받는 사용자
		 
		 System.out.println("---------recv Data--------");
		 System.out.println("recvID : "+ recvID);
		 System.out.println("title : "+ title);
		 System.out.println("content : "+ content);
		 System.out.println("--------------------------");
		 
		  // Get the session object
		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");

		  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(user, password);
		   }
		  });
		  
		  // Compose the message
		  try {
		   MimeMessage message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(user));
		   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

		   // Subject
		   message.setFrom("vxxoov@naver.com");
		   
		   // Subject
		   message.setSubject("[DAJOB] "+title);
		   
		   // Text
		   message.setText(content,"UTF-8","html");

		   // send the message
		   Transport.send(message);
		   System.out.println("message sent successfully...");

		  } catch (MessagingException e) {
		   e.printStackTrace();
		  }
	}
}
