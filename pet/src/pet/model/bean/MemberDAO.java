package pet.model.bean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pet.model.dto.MemberDTO;
import pet.model.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlsession = null;
	

	// 이메일 중복 검사
	public int check_email(String email) throws Exception{
		return sqlsession.selectOne("member.check_email", email);
	}
	
	// 회원가입
	@Transactional
	public int join_member(MemberDTO register) throws Exception{
		return sqlsession.insert("member.join_member", register);
	}
	// 이메일 인증
	@Transactional
	public int approval_member(MemberDTO register) throws Exception{
		return sqlsession.update("member.approval_member", register);
	}
	
	// 로그인 검사
	public MemberDTO login_member(String email) throws Exception{
		return sqlsession.selectOne("member.login_member", email);
	}
	
	// 로그인 접속일자 변경
	@Transactional
	public int update_log(String email) throws Exception{
		return sqlsession.update("member.update_log", email);
	}
	
	// 마이페이지
	@Transactional
	public int update_mypage(MemberDTO register) throws Exception{
		return sqlsession.update("member.update_mypage", register);
	}
	// 비밀번호 업데이트
	@Transactional
	public int update_pw(MemberDTO register) throws Exception{
		return sqlsession.update("member.update_pw", register);
	}
	
	
}
