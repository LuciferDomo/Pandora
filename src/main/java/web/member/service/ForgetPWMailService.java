package web.member.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

//以下使用JavaMail API來建立EMAIL(建立含有HTML標籤的郵件)
//邏輯：
//step1、從Session獲得實現了某種郵件發送協議的Transport對象
//step2、使用Session建立Message對象，並調用Message的方法封裝email的數據；
//step3、連接指定的SMTP服務器(需取得該mail server的SMTP授權碼)，調用Transport中的郵件發送方法Message中封裝的郵件數據。

//MimeMessage類表示整封郵件、MimeBodyPart類表示郵件的一個MIME訊息、MimeMultipart類表示一個由多個MIME訊息組合成的組合MIME訊息

public class ForgetPWMailService {
	private final static String HOST = "smtp.gmail.com";
	private final static String AUTH = "true";
	private final static String PORT = "587";
	private final static String STARTTLE_ENABLE = "true";
	private final static String SENDER = "pandoracruise6@gmail.com";
	private final static String PASSWORD = "ifmbvffkigvfsoce";
//	private final static String PASSWORD = "tga102tga102";

//  設定傳送郵件:至收信人的Email信箱,Email主旨,Email內容
	public void sendMail(String recipients, String mailSubject, String mailBody) {
//		String recipientCcs = "副本mail";
		recipients = "chmber824@gmail.com";
		Properties props = new Properties();
//		props.setProperty("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", HOST);
		props.put("mail.smtp.auth", AUTH);
		props.put("mail.smtp.port", PORT);
		props.put("mail.smtp.starttls.enable", STARTTLE_ENABLE);
		props.put("mail.smtp.ssl.trust", HOST);
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

//      設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
		Authenticator authenticator = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(SENDER, PASSWORD);
			}
		};

		Session session = Session.getDefaultInstance(props, authenticator);
		Message message = new MimeMessage(session);

		try {
//			設定Email Message start

//			設定寄件人、收件人、副本、主旨
			message.setSentDate(new Date());
			message.setHeader("Content-Type", "text/html; charset=UTF-8");
			message.setFrom(new InternetAddress(SENDER));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipients));
//			message.addRecipients(Message.RecipientType.CC, InternetAddress.parse(recipientCcs));
//          https://javaee.github.io/javamail/docs/api/javax/mail/internet/MimeUtility.html#encodeText-java.lang.String-java.lang.String-java.lang.String- (第三個參數參考API文件)
			message.setSubject(MimeUtility.encodeText(mailSubject, StandardCharsets.UTF_8.toString(), "B"));

//			first part (text)
			MimeBodyPart messageBody = new MimeBodyPart();
			messageBody.setContent(mailBody, "text/html; charset=UTF-8");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBody);

//          second part (the image) 可根據自己需要決定是否要加這段
			File file = new File("/Users/namu0423/Pandora2/src/main/webapp/Cart/html/img/logo_sticky.png");
			MimeBodyPart messageImgBody = new MimeBodyPart();
			DataSource fds = new FileDataSource(file);

			messageImgBody.setDataHandler(new DataHandler(fds));
			messageImgBody.setHeader("Content-ID", "<image>");
			messageImgBody.setFileName(file.getName());

//          add image to the multipart
			multipart.addBodyPart(messageImgBody);

			message.setContent(multipart);
//   		寄出email
			Transport transport = session.getTransport("smtp");
			try {
				transport.connect();
				transport.sendMessage(message, message.getAllRecipients());
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			} finally {
				transport.close();
			}

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	public static void main(String args[]) {
//
//		String to = "";
//
//		String subject = "密碼通知";
//
//		String ch_name = "David";
//		String passRandom = "111";
//		String messageText = "Hello! " + ch_name + " 請謹記此密碼: " + passRandom + "\n" + " (已經啟用)";
//
//		ForgetPWMailService mailService = new ForgetPWMailService();
//		mailService.sendMail(to, subject, messageText);
//
//	}

}