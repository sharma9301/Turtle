package com.turtle.spring.mail.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.turtle.spring.mail.MailHandler;
import com.turtle.spring.member.model.service.MemberService;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {
	private final JavaMailSender mailSender;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private MemberService service;
	
    //private static final String FROM_ADDRESS = "GDJ41turtle@gmail.com";

    public void mailSend(HttpSession session, String email) {
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo(email);
//        message.setFrom(MailService.FROM_ADDRESS);
//        message.setSubject("이메일 인증 테스트");
//        message.setText("인증번호는 OOO입니다.");
//
//        mailSender.send(message);
    	// 위 코드는 이메일 api 되는 지 확인 했음
    	
    	try {
    		MailHandler mailHandler = new MailHandler(mailSender);
    		Random random = new Random(System.currentTimeMillis());
    		long start = System.currentTimeMillis();
    		
    		int result = 100000 + random.nextInt(900000);
    		
    		//받는사람
    		mailHandler.setTo(email);
    		//보내는사람
    		mailHandler.setFrom("GDJ41turtle@gmail.com");
    		//제목
    		mailHandler.setSubject("인증번호입니다.");
    		//HTML Layout
    		String htmlContent = "<p>인증번호 : "+ result+"</p>";
    		mailHandler.setText(htmlContent, true);
    		
    		mailHandler.send();
    		
    		long end = System.currentTimeMillis();
    		
    		session.setAttribute(""+email, result);
    		System.out.println("실행시간 : "+(end - start)/1000.0);
    		
    		
    		
    		
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	
		
    }
    
    
    public boolean checkToken(HttpSession session, String email, int token) {
    	try {
    		int token2 = (int)session.getAttribute(email);
    		if(token2 == token) {
    			return true;
    		}else {
    			return false;
    		}
    	}catch(Exception e) {
    		throw e;
    	}
    }
    
    
    
    public void mailId(HttpSession session, String email, String userId) {
//      SimpleMailMessage message = new SimpleMailMessage();
//      message.setTo(email);
//      message.setFrom(MailService.FROM_ADDRESS);
//      message.setSubject("이메일 인증 테스트");
//      message.setText("인증번호는 OOO입니다.");
//
//      mailSender.send(message);
  	// 위 코드는 이메일 api 되는 지 확인 했음
  	
  	try {
  		MailHandler mailHandler = new MailHandler(mailSender);
  		
  		//받는사람
  		mailHandler.setTo(email);
  		//보내는사람
  		mailHandler.setFrom("GDJ41turtle@gmail.com");
  		//제목
  		mailHandler.setSubject("TurtleStore 아이디 조회 결과");
  		//HTML Layout
  		String htmlContent = "<p>아이디 : "+userId+"</p>";
  		mailHandler.setText(htmlContent, true);
  		
  		mailHandler.send();
  		
  		
  	}catch(Exception e){
  		e.printStackTrace();
  	}
  	
		
  }
    
    
    public void mailPw(HttpSession session, String email, String userId) {
//      SimpleMailMessage message = new SimpleMailMessage();
//      message.setTo(email);
//      message.setFrom(MailService.FROM_ADDRESS);
//      message.setSubject("이메일 인증 테스트");
//      message.setText("인증번호는 OOO입니다.");
//
//      mailSender.send(message);
  	// 위 코드는 이메일 api 되는 지 확인 했음
  	
  	try {
  		MailHandler mailHandler = new MailHandler(mailSender);
  		Random random = new Random(System.currentTimeMillis());
  		long start = System.currentTimeMillis();
  		
  		String newPassword = ""+random.nextInt(9999)+1;
  		
  		String encPassword=encoder.encode(newPassword);
  		//받는사람
  		mailHandler.setTo(email);
  		//보내는사람
  		mailHandler.setFrom("GDJ41turtle@gmail.com");
  		//제목
  		mailHandler.setSubject("임시비밀번호 입니다..");
  		//HTML Layout
  		String htmlContent = "<p>임시 비밀번호 : "+newPassword+"</p>";
  		mailHandler.setText(htmlContent, true);
  		
  		mailHandler.send();
  		
  		Map<String,Object> param = new HashMap();
		param.put("userId", userId);
		param.put("password", encPassword);
		param.put("email", email);
		
		
		int result = service.pwUpdate(param);
		
		
		
  		
  	}catch(Exception e){
  		e.printStackTrace();
  	}
  	
  	
		
  }
    
    
    
    
    
}
