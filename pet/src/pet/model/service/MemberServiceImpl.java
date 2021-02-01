package pet.model.service;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;

import pet.model.bean.MemberDAO;
import pet.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

	// Bean 객체 자동 주입
	@Inject
	private MemberDAO manager;
	
	// 이메일 중복 검사 (AJAX)
	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(manager.check_email(email));
		out.close();
		
	}

	// 회원 가입
	@Override
	public int join_member(MemberDTO register) throws Exception {
		int result = 0;
		if(manager.check_email(register.getEmail()) != 1) {
			// 인증키 set
			register.setApproval_key(create_key());
			manager.join_member(register);
			// 인증 메일 발송
			send_mail(register);
			result = 1;
		}
		return result;
	}
	
	// 인증키 생성
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();
		
		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}
	
	// 이메일 발송
	public void send_mail(MemberDTO register) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "global.final05@gmail.com";
		String hostSMTPpwd = "final005";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "global.final05@gmail.com";
		String fromName = "minimanimo";
		String subject = "이메일 발송 테스트";
		String msg = "";

		// 회원가입 메일 내용
		subject = "Spring Homepage 회원가입 인증 메일입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += register.getEmail() + "님 회원가입을 환영합니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
		msg += "<form method='post' action='http://localhost:8080/pet/member/approval_member.do'>";
		msg += "<input type='hidden' name='approval_key' value='" + register.getApproval_key() + "'>";
		msg += "<input type='submit' value='인증'></form><br/></div>";

		// 받는 사람 E-Mail 주소
		String mail = register.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	// 회원 인증
	@Override
	public int approval_member(MemberDTO register) throws Exception {
		int result = 0;
		if(result == 0 ) {
			manager.approval_member(register);
		}
		return result = 1;
	}
		
		
//		if (manager.approval_member(register) == 0) { // 이메일 인증에 실패하였을 경우
//			out.println("<script>");
//			out.println("alert('잘못된 접근입니다.');");
//			out.println("history.go(-1);");
//			out.println("</script>");
//			out.close();
//		} else { // 이메일 인증을 성공하였을 경우
//			out.println("<script>");
//			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
//			out.println("location.href='/pet/member/login.do';");
//			out.println("</script>");
//			out.close();
	

	// 로그인
	@Override
	public MemberDTO login_member(MemberDTO register, HttpServletResponse response) throws Exception{
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out = response.getWriter();

	// 등록된 이메일이 없으면
	if(manager.check_email(register.getEmail()) == 0) {
		out.println("<script>");
		out.println("alert('등록된 아이디가 없습니다.');");
		out.println("location.href='/pet/member/login.do';");
		out.println("</script>");
		out.close();
		return null;
	} else {
		String pw = register.getPw();
		register = manager.login_member(register.getEmail());
		// 비밀번호가 다를 경우
		if(!register.getPw().equals(pw)) {
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');");
			out.println("location.href='/pet/member/login.do';");
			out.println("</script>");
			out.close();
			return null;
			
			// 이메일 인증을 하지 않은 경우
			/*}else if(!member.getApproval_status().equals("true")) {
				out.println("<script>");
				out.println("alert('이메일 인증 후 로그인 하세요.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;*/
				
	        // 로그인 일자 업데이트 및 회원정보 리턴			
			}else {
				manager.update_log(register.getEmail());
				return register;
			}
		}
	}
	// 로그아웃
	@Override
	public void logout(HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href=document.referrer;");
		out.println("</script>");
		out.close();
	}
	
	// 회원정보 수정
	@Override
	public MemberDTO update_mypage(MemberDTO register) throws Exception{
		manager.update_mypage(register);
		return manager.login_member(register.getEmail());
	}
	
	// 비밀번호 변경
	public MemberDTO update_pw(MemberDTO register, String pw, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(!pw.equals(manager.login_member(register.getPw()))){
			out.println("<script>");
			out.println("alert('기존의 비밀번호가 다릅니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			manager.update_pw(register);
			return manager.login_member(register.getEmail());
		}
	}
	

	

}



























