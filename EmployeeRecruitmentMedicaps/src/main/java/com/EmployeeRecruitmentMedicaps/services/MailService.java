package com.EmployeeRecruitmentMedicaps.services;


import java.util.Properties;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


@Service
public class MailService 
{
	private JavaMailSenderImpl mailSender;
	private Properties props;
	
	public MailService() 
	{
		mailSender = new JavaMailSenderImpl();
	    mailSender.setHost("smtp.gmail.com");
	    mailSender.setPort(587);	    
	    mailSender.setUsername("miifoundationmu@gmail.com");
	    mailSender.setPassword("adrr uwjn mtca joqe");
	    
	    props = mailSender.getJavaMailProperties();
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.debug", "true");
	}
	
	public void verificationMail(String mail,String otp) throws Exception 
	{
			MimeMessage mimeMessage = mailSender.createMimeMessage();
		
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
			
			String htmlMsg = "<html>"
	                + "<head>"
	                + "<style>"
	                + "body { font-family: 'Arial', sans-serif; background-color: #f4f4f4; text-align: center; margin: 0; padding: 0; }"
	                + "h1 { color: #d9534f; }"
	                + "hr { border-color: #d9534f; margin-top: 20px; }"
	                + "p { color: #333; margin: 20px 0; }"
	                + "a { display: inline-block; padding: 10px 20px; background-color: #d9534f; color: #fff; text-decoration: none; border-radius: 5px; }"
	                + "</style>"
	                + "</head>"
	                + "<body>"
	                + "<h1>Welcome, User !</h1>"
	                + "<hr>"
	                + "<p>For verification  : </p>"
	                +"<h1>Your Otp is "+otp+" </h1>"
	                + "</body>"
	                + "</html>";
			
			mimeMessage.setContent(htmlMsg, "text/html"); 
			helper.setText(htmlMsg, true); 
			helper.setTo(mail);
			helper.setSubject("OTP Via Mii Foundation");
			helper.setFrom("miifoundationmu@gmail.com");
			mailSender.send(mimeMessage);
	}

}