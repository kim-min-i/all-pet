package pet.model.service;

import javax.servlet.http.HttpServletResponse;

import pet.model.dto.MemberDTO;

public interface MemberService {
	public void check_email(String email, HttpServletResponse response) throws Exception;
	public int join_member(MemberDTO register)throws Exception;
	public String create_key() throws Exception;
	void send_mail(MemberDTO register) throws Exception;
	public int approval_member(MemberDTO register) throws Exception;
	public MemberDTO login_member(MemberDTO register, HttpServletResponse response) throws Exception;
	public void logout(HttpServletResponse response) throws Exception;
	public MemberDTO update_mypage(MemberDTO register) throws Exception;
}
