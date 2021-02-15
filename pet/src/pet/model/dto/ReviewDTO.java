package pet.model.dto;

import java.sql.Timestamp;

// 리뷰
public class ReviewDTO {
	// 고유번호
	private int no;
	// 회원 이메일
	private String member_email;
	// 병원 이름
	private String hospital_name;
	// 의사 이름
	private String doc_name;
	// 재방문 추천 Y / N
	private String revisit;
	// 작성내용 공개여부 Y /N
	private String public_check;
	// 인증 확인 여부 Y / N
	private String auth_check;
	// 리뷰 작성 시간
	private Timestamp reg_date;
	
	public String getHospital_name() {
		return hospital_name;
	}
	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getRevisit() {
		return revisit;
	}
	public void setRevisit(String revisit) {
		this.revisit = revisit;
	}
	public String getPublic_check() {
		return public_check;
	}
	public void setPublic_check(String public_check) {
		this.public_check = public_check;
	}
	public String getAuth_check() {
		return auth_check;
	}
	public void setAuth_check(String auth_check) {
		this.auth_check = auth_check;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
