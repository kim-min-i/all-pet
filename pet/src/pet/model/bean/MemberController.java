package pet.model.bean;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pet.model.dto.MemberDTO;
import pet.model.service.MemberServiceImpl;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceImpl service;
	
	
	 // 회원 가입 폼 이동
	 @RequestMapping(value = "/register.do") 
	 public String memberJoinForm() throws Exception{ 
		 return "/member/register"; 
	}
	 
	
	// 이메일 중복 검사 (AJAX)
	 @ResponseBody
	@RequestMapping(value = "/check_email.do")
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		service.check_email(email, response);
	}
	
	// 회원가입
	@RequestMapping(value = "/join_member.do")
	public String join_member( MemberDTO register , Model model ) throws Exception{
		int result= service.join_member(register);
		model.addAttribute("result",result);
		return "member/registerPro";  
	}
	// 회원 인증
	@RequestMapping(value = "/approval_member.do")
	public void approval_member(MemberDTO register) throws Exception{
		service.approval_member(register);
	}
	
	@RequestMapping("/main.do")
	public String main() {
		return "member/main";
	}
	
	// 로그인 폼 이동
	@RequestMapping(value = "/login.do")
	public String login() throws Exception{
		return "member/login";
	}
		
	// 로그인
	@RequestMapping(value = "/login_member.do")
	public String login_member(MemberDTO register, HttpSession session, HttpServletResponse response) throws Exception{
		register = service.login_member(register, response);
		session.setAttribute("member", register);
		return "member/loginPro";
	}
	
	//--------------로그인 후 사용가능
	
	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public void logout(HttpSession session, HttpServletResponse response) throws Exception{
		session.invalidate();
		//session.removeAttribute("member");
		service.logout(response);
	}
	
	// 마이페이지로 이동
	@RequestMapping(value = "/mypage.do")
	public String mypage() throws Exception{
		return "member/mypage";
	}
	
	// 나의 회원정보 페이지로 이동
	@RequestMapping(value = "/modifyForm.do")
	public String modiyfyForm() throws Exception{
		return "member/modifyForm";
	}
	// 정보 수정 
	@RequestMapping(value = "/modifyPro.do")
	public String modifyPro() throws Exception{
		return "member/modifyPro";
	}
	
	// mypage 수정
	@RequestMapping(value = "/update_mypage.do")
	public String update_mypage(MemberDTO register, HttpSession session) throws Exception{
		session.setAttribute("member", service.update_mypage(register));
		return "member/mypage";
	}
	// 비밀번호 업데이트 수정
	@RequestMapping(value = "/update_pw.do")
	public String update_pw(MemberDTO register, String pw, HttpSession session, HttpServletResponse response) throws Exception{
		session.setAttribute("member", service.update_pw(register, pw, response));
		
		return "member/update_pw";
	}
	
	// 나의 활동 페이지로 이동
	@RequestMapping(value = "/about_me.do")
	public String about_me() throws Exception{
		return "member/about_me";
	}
	
	// 나의 포인트 페이지로 이동
	@RequestMapping(value = "/point.do")
	public String point() throws Exception{
		return "member/point";
	}
	
	// 계정 설정 페이지로 이동
	@RequestMapping(value = "/member_info.do")
	public String member_info() throws Exception{
		return "member/member_info";
	}
}
	


