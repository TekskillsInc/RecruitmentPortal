package com.recruitmentportal.Service;
 
 import java.util.List;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Component;

import com.recruitmentportal.DTO.mailBean;
 
@Component
@EnableAsync
 public class CandidateMailConfirmation
 {
private static final Logger logger = Logger.getLogger(CandidateMailConfirmation.class);
   @Async
   public void sendMail(String fromMail,String toAddress, String subject, String mailBody, String ccMail,String toName,List<String> ccList,String role )
   {
     final String username = mailBean.getMail_User();
     final String password = mailBean.getMail_password();
     final String link = mailBean.getMail_link();
     final String mailhost=mailBean.getMail_Host();
     
     try
     {
	     java.util.Properties properties = System.getProperties();  
	     properties.setProperty("mail.smtp.host",mailhost);  
		 properties.put("mail.smtp.port",25 );
		 properties.put("mail.smtp.auth", "true"); 
	      Session session1 = Session.getDefaultInstance(properties,  
		  new javax.mail.Authenticator(){  
		  protected PasswordAuthentication getPasswordAuthentication(){  
		  return new PasswordAuthentication(username,password);  
	      }  
		  });  
	      StringBuilder sb = new StringBuilder();
			sb.append("Hi" + " " + toName + ",<br>");
			sb.append("<br>");
			/*sb.append("<br>");*/
			sb.append(mailBody);
			sb.append("<br>");
			sb.append("<br>");
			sb.append("<br>");
			sb.append("Regards<br>");
			sb.append("Tekskills");
			

         MimeMessage message = new MimeMessage(session1);  
         message.setFrom(new InternetAddress(fromMail));  
         message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddress)); 
       
 if(ccMail!=null) {
        	 message.addRecipient(Message.RecipientType.CC, new InternetAddress(ccMail));
        	 }
         else {}
        	 
        
         message.setSubject(subject);                                                          
         message.setContent(sb.toString(),"text/html"); 
         Transport.send(message);	
        
     }
     catch (Exception e) {
    	 logger.error("Exception While Sending mail-------"+e);
     }
   }
 }


