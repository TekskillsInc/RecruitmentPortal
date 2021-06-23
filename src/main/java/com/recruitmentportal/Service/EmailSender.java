package com.recruitmentportal.Service;
 
 import java.io.IOException;
import java.util.List;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Component;

import com.recruitmentportal.DTO.mailBean;

 
 @Component
 @EnableAsync
 public class EmailSender
 {
private static final Logger logger = Logger.getLogger(EmailSender.class);
 @Async
   
   public void sendMail(String fromMail,String toAddress, String subject, String mailBody, String ccMail,String toName,List<String> ccList,String role) 
   {
	 
	 System.out.println("sendMail--fromMail----"+fromMail+"------toAddress----"+toAddress);
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
			
			  Session session1 = Session.getDefaultInstance(properties, new  javax.mail.Authenticator(){ protected PasswordAuthentication
			  getPasswordAuthentication(){ return new  PasswordAuthentication(username,password); } });
			  
	         StringBuilder sb = new StringBuilder();
			sb.append("Hi" + " " + toName + ",<br>");
			sb.append("<br>");
			sb.append("<br>");
			sb.append(mailBody);
			sb.append("<br>");
			sb.append("<br>");
			sb.append("<a href='" + link + "'>click,here to login</a>");
			sb.append("<br>");

         MimeMessage message = new MimeMessage(session1);  
         message.setFrom(new InternetAddress(fromMail));  
         message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddress)); 
       
         if(ccList!=null) {
        	 for (String email : ccList) {
                 InternetAddress[] myCcList =null;
                 if(email!=null) {
                 myCcList = InternetAddress.parse(email);
                 }
                 message.addRecipients(Message.RecipientType.CC, myCcList);
                                           

              }
       }
         else if(ccMail!=null) {
        	 message.addRecipient(Message.RecipientType.CC, new InternetAddress(ccMail));
        	 }
         else {}
        	 
        
         message.setSubject(subject);                                                          
         message.setContent(sb.toString(),"text/html"); 
         Transport.send(message);	
     }
     
     catch (AddressException e) {
         logger.error("Exception raised while sendMail----"+e);

     } catch (SendFailedException e) {
         logger.error("Exception raised while sendMail----"+e);

     } catch (Exception e) {
         logger.error("Exception raised while sendMail----"+e);
     }
   }
 

 @Async
 public void sendMailRectoTL(String fromMail,String toAddress,String subject,String mailBody,String ccMail,String name,String tlName,List<String> ccList,String role,String canName,String jobcode,String recname,String status,String comments,String clientStatus)
 {
   final String username = mailBean.getMail_User();
   final String password = mailBean.getMail_password();
   final String link = mailBean.getMail_link();
   final String mailhost=mailBean.getMail_Host();
   
   System.out.println("sendMailRectoTL---fromMail----"+fromMail+"------toAddress----"+toAddress);
   try
   {
	     java.util.Properties properties = System.getProperties();  
	     properties.setProperty("mail.smtp.host",mailhost);  
		 properties.put("mail.smtp.port",25 );
		 properties.put("mail.smtp.auth", "true"); 
			
			  Session session1 = Session.getDefaultInstance(properties, new
			  javax.mail.Authenticator(){ protected PasswordAuthentication
			  getPasswordAuthentication(){ return new
			  PasswordAuthentication(username,password); } });
			   
				 
	      StringBuilder sb = new StringBuilder();
	      
       
          
          if(comments!=null){
          
                  sb.append("Hi" + " " + name + ",<br>");
                  sb.append("<br>");
                  sb.append("<br>");
                  //sb.append("<br>");
                  sb.append(mailBody);
                  sb.append("<table cellpadding='5' cellspacing='0' border='1'><tr><th>Candidate Name</th><th>Job Code</th><th>TeamLead Name</th><th>Recruiter Name</th><th>Status</th><th>Comments</th><th>Client Status</th></tr><tr><td>"+canName+"</td><td>"+jobcode+"</td><td>"+tlName+"</td><td>"+recname+"</td><td>"+status+"</td><td>"+comments+"</td><td>"+clientStatus+"</td></tr></table>");
                  sb.append("<br>");
                  sb.append("<a href='" + link + "'>click,here to login</a>");
                  sb.append("<br>");
          }
        
          else {
	      
			sb.append("Hi" + " " + name + ",<br>");
			sb.append("<br>");
			/*sb.append("<br>");*/
			sb.append(mailBody);
			sb.append("<br>");
			sb.append("<br>");
			sb.append("<table cellpadding='5' cellspacing='0' border='1'><tr><th>Candidate Name</th><th>Job Code</th><th>TeamLead Name</th><th>Recruiter Name</th><th>Status</th><th>Client Status</th></tr><tr><td>"+canName+"</td><td>"+jobcode+"</td><td>"+tlName+"</td><td>"+recname+"</td><td>"+status+"</td><td>"+clientStatus+"</td></tr></table>");
			sb.append("<br>");
			sb.append("<a href='" + link + "'>click,here to login</a>");
			sb.append("<br>");
          }
       MimeMessage message = new MimeMessage(session1);  
       message.setFrom(new InternetAddress(fromMail));  
       message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddress)); 
     
       if(ccList!=null) {
      	 for (String email : ccList) {
               InternetAddress[] myCcList =null;
               if(email!=null) {
               myCcList = InternetAddress.parse(email);
               }
               message.addRecipients(Message.RecipientType.CC, myCcList);
                                         

            }
      	
     }
       else if(ccMail!=null) {
      	 message.addRecipient(Message.RecipientType.CC, new InternetAddress(ccMail));
      	 }
       else {}
      	 
      
       message.setSubject(subject);                                                          
       message.setContent(sb.toString(),"text/html"); 
      Transport.send(message);	
       
   }
   catch (Exception e) {
	   logger.error("Exception while sending mail in sendMailRectoTL----"+e);
   }
   
   
 }

 
 @Async
 public void sendMailInterviewSchedule(String fromMail,String toAddress, String subject,String ccMail,String toName,List<String> ccList,String role,String jobcode,String candidateName,String interviewDate,String interviewtime,String modeofInterview,String interviewType,String company)
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
			
			sb.append("<br>");
			sb.append("<br>");
			sb.append("<table cellpadding='5' cellspacing='0' border='1'><tr><th>Job Code</th><th>Company Name</th><th>Candidate Name</th><th>Interview Date</th><th>Interview Time</th><th>Mode of Interview </th><th>Interview Type</th></tr><tr><td>"+jobcode+"</td><td>"+company+"</td><td>"+candidateName+"</td><td>"+interviewDate+"</td><td>"+interviewtime+"</td><td>"+modeofInterview+"</td><td>"+interviewType+"</td></tr></table>");
			sb.append("<br>");
			sb.append("<a href='" + link + "'>click,here to login</a>");
			sb.append("<br>");

       MimeMessage message = new MimeMessage(session1);  
       message.setFrom(new InternetAddress(fromMail));  
       message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddress)); 
     
       if(ccList!=null) {
      	 for (String email : ccList) {
               InternetAddress[] myCcList =null;
               if(email!=null) {
               myCcList = InternetAddress.parse(email);
               }
               message.addRecipients(Message.RecipientType.CC, myCcList);
                                         

            }
      
     }
       else if(ccMail!=null) {
      	 message.addRecipient(Message.RecipientType.CC, new InternetAddress(ccMail));
      	 }
       else {
    	   
    	   
       }
      	 
      
       message.setSubject(subject);                                                          
       message.setContent(sb.toString(),"text/html"); 
      Transport.send(message);	
   }
   catch (Exception e) {
	   logger.error("Exception while sending mail in sendMailInterviewSchedule----"+e);
   }
 }

 @Async
 public void sendMailBD_RecUser(String fromMail,String toAddress, String subject,String ccMail,String toName,List<String> ccList,String role,String jobcode,String copmany,String assignedto,String assignedby,String Status) throws ServletException, IOException
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
			
			  Session session1 = Session.getDefaultInstance(properties, new
			  javax.mail.Authenticator(){ protected PasswordAuthentication
			  getPasswordAuthentication(){ return new
			  PasswordAuthentication(username,password); } });
			  
	      StringBuilder sb = new StringBuilder();
			sb.append("Hi" + " " + toName + ",<br>");
			sb.append("<br>");
			
			sb.append("<br>");
			sb.append("<br>");
			if(assignedto!=null) {
				sb.append("<table cellpadding='5' cellspacing='0' border='1'><tr><th>Job Code</th><th>Company Name</th><th>Assigned to</th><th>Assigned By</th><th>Status</th></tr><tr><td>"+jobcode+"</td><td>"+copmany+"</td><td>"+assignedto+"</td><td>"+assignedby+"</td><td>"+Status+"</td></tr></table>");
			}else {
				sb.append("<table cellpadding='5' cellspacing='0' border='1'><tr><th>Job Code</th><th>Company Name</th><th>Assigned By</th><th>Status</th></tr><tr><td>"+jobcode+"</td><td>"+copmany+"</td><td>"+assignedby+"</td><td>"+Status+"</td></tr></table>");
			}
			
			sb.append("<br>");
			sb.append("<a href='" + link + "'>click,here to login</a>");
			sb.append("<br>");

       MimeMessage message = new MimeMessage(session1);  
       message.setFrom(new InternetAddress(fromMail));  
       message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddress)); 
     
       if(ccList!=null) {
      	 for (String email : ccList) {
               InternetAddress[] myCcList =null;
               if(email!=null) {
               myCcList = InternetAddress.parse(email);
               }
               message.addRecipients(Message.RecipientType.CC, myCcList);
            }
     }
       else if(ccMail!=null) {
      	 message.addRecipient(Message.RecipientType.CC, new InternetAddress(ccMail));
      	 }
       else {}
      	 
      
       message.setSubject(subject);                                                          
       message.setContent(sb.toString(),"text/html"); 
      Transport.send(message);	
   }
   catch (Exception e) {
	   logger.error("Exception while sending mail in  sendMailInterviewSchedule----"+e);
	  
    
   }
 }
 
 
 @Async
 public void sendDocApproved(String fromMail,List<String> toAddress,String subject,String toName,String description,List<String> ccList)
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
			sb.append(toName);
			sb.append("<br>");
			sb.append("<br>");
			sb.append(description);
			sb.append("<br>");
			sb.append("<a href='" + link + "'>click,here to login</a>");
			sb.append("<br>");

       MimeMessage message = new MimeMessage(session1);  
       message.setFrom(new InternetAddress(fromMail)); 
       
       if(toAddress!=null){
    	   for (String email : toAddress) {
               InternetAddress[] toList =null;
               if(email!=null) {
              	toList = InternetAddress.parse(email);
               }
               message.setRecipients(Message.RecipientType.TO, toList);  
			}
       }
       else{
    	   
       }
     
     
      if(ccList!=null) {
      	 for (String email1 : ccList) {
               InternetAddress[] myCcList =null;
               if(email1!=null) {
               myCcList = InternetAddress.parse(email1);
               }
               message.addRecipients(Message.RecipientType.CC, myCcList);
            }
			}
     
       
       else {
    	   
       }

       message.setSubject(subject);                                                          
       message.setContent(sb.toString(),"text/html"); 
       Transport.send(message);	
       
   }
   catch (Exception e) {
	   logger.error("Exception while sending mail in  sendDocApproved----"+e);
   }
 }
}