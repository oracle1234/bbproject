package controller;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import dto.MemberDTO;

public class MailSend {

	public MailSend() {
		// TODO Auto-generated constructor stub
	}

	public MailSend(MemberDTO mdto, int price[], int amount[], String foods_name[]) {

	
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true");// gmail은 무조건 true 고정
		p.put("mail.smtp.host", "smtp.gmail.com");// smtp 서버 주소
		p.put("mail.smtp.auth", "true");// gmail은 무조건 true 고정
		p.put("mail.smtp.port", "587");// gmail 포트

		Authenticator auth = new MyAuthentication();

		// session 생성 및 MimeMessage생성
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);
		try {
			// 편지보낸시간
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress();

			from = new InternetAddress("pwljh1@gmail.com");
			// 이메일 발신자
			msg.setFrom(from);

			// 이메일 수신자
			InternetAddress to = new InternetAddress(mdto.getMail());
			msg.setRecipient(Message.RecipientType.TO, to);
			// 이메일 제목
			msg.setSubject("반찬을부탁해에서 구매한 상품정보입니다.", "UTF-8");
			// 이메일 내용
			String str = "";
			for (int i = 0; i < foods_name.length; i++) {
				str += foods_name[i] + price[i];
			}
			msg.setText(str);
			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");
			// 메일보내기
			javax.mail.Transport.send(msg);
		} catch (AddressException addr_e) {
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) {
			msg_e.printStackTrace();
		}
	}

	public MailSend(MemberDTO mdto, int price, int amount, String foods_name) {

		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true");// gmail은 무조건 true 고정
		p.put("mail.smtp.host", "smtp.gmail.com");// smtp 서버 주소
		p.put("mail.smtp.auth", "true");// gmail은 무조건 true 고정
		p.put("mail.smtp.port", "587");// gmail 포트

		Authenticator auth = new MyAuthentication();

		// session 생성 및 MimeMessage생성
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);
		try {
			// 편지보낸시간
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress();

			from = new InternetAddress("pwljh1@gmail.com");
			// 이메일 발신자
			msg.setFrom(from);

			// 이메일 수신자
			InternetAddress to = new InternetAddress(mdto.getMail());
			msg.setRecipient(Message.RecipientType.TO, to);
			// 이메일 제목
			msg.setSubject("반찬을부탁해에서 구매한 상품정보입니다.", "UTF-8");
			// 이메일 내용
			msg.setText("ㅋㅋ");
			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");
			// 메일보내기
			javax.mail.Transport.send(msg);
		} catch (AddressException addr_e) {
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) {
			msg_e.printStackTrace();
		}
	}

}// end MailTestclass

class MyAuthentication extends Authenticator {

	PasswordAuthentication pa;

	public MyAuthentication() {

		String id = "pwljh1@gmail.com";// 구글 ID
		String pw = "sbslpghnzgtibrme";// 구글 비밀번호
		// ID와 비밀번호를 입력한다.
		pa = new PasswordAuthentication(id, pw);
	}

	// 시스템에서 사용하는 인증정보
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
