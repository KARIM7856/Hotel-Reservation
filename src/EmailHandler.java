import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import IA_Project.WebData.Name;

public class EmailHandler {
	

		public static void sendEmail(String toEmail, String subject, String body){
			try
		    {
				
			   	final String fromEmail = "kemomohamed703@gmail.com"; //requires valid gmail id
				final String password = "dagxbzkzgghfohsu"; // correct password for gmail id
				
				System.out.println("TLSEmail Start");
				Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
				props.put("mail.smtp.port", "587"); //TLS Port
				props.put("mail.smtp.auth", "true"); //enable authentication
				props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
				props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
				
		                //create Authenticator object to pass in Session.getInstance argument
				Authenticator auth = new Authenticator() {
					//override the getPasswordAuthentication method
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(fromEmail, password);
					}
				};
				Session session = Session.getInstance(props, auth);
		      MimeMessage msg = new MimeMessage(session);
		      //set message headers
		      msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
		      msg.addHeader("format", "flowed");
		      msg.addHeader("Content-Transfer-Encoding", "8bit");

		      msg.setFrom(new InternetAddress("HotelReservation@HRes.com", "HotelReservation"));

		      msg.setReplyTo(InternetAddress.parse("HotelReservation@HRes.com", false));

		      msg.setSubject(subject, "UTF-8");

		      msg.setText(body, "UTF-8");

		      msg.setSentDate(new Date());

		      msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
		      System.out.println("Message is ready");
	    	  Transport.send(msg);  

		      System.out.println("EMail Sent Successfully!!");
		    }
		    catch (Exception e) {
		      e.printStackTrace();
		    }
		}
		
		public static String getPwdEmailBody(String pwd) {
			return "Please use this password to login (Can use for first login only)\n Password: " + pwd; 
		}

		public static String getCancellingEmailBody(Name name, String username, String hotelName) {
			
			return "User: "+name.getfName() + " " + name.getmName() + " " + name.getlName() +"(" + username +") " 
			+ "has cancelled his/her reservations to " + hotelName;
		}
	
	}

