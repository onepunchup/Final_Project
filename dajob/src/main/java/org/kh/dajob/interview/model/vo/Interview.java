package org.kh.dajob.interview.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class Interview implements Serializable{
	private static final long serialVersionUID = 12111111112L;
	private String interview_no;
	private String interviewer;
	private String interviewee;
	private String interview_question;
	private String interview_answer;
	private Timestamp interview_start_date;
	private Timestamp interview_end_date;
	private String interview_status;
	private String work_no;
	private String member_id;
	private String company_name;
	private String company_type;
	private String company_staff;
	private String company_capital;
	private String company_code;
	private String company_tel;
	private String company_fax;
	private String company_welfare;
	private Date company_date;
	private String member_password;
	private String member_type_code;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_address;
	private Date member_sign_date;
	private String member_profile_img;
	
	public Interview() {}
	
	public Interview(String interview_question, Timestamp interview_start_date, Timestamp interview_end_date,
			String interview_status) {
		super();
		this.interview_question = interview_question;
		this.interview_start_date = interview_start_date;
		this.interview_end_date = interview_end_date;
		this.interview_status = interview_status;
	}
	
	public Interview(String interview_no, String interviewer, String interviewee, String interview_question,
			String interview_answer, Timestamp interview_start_date, Timestamp interview_end_date,
			String interview_status, String work_no, String member_id, String company_name, String company_type,
			String company_staff, String company_capital, String company_code, String company_tel, String company_fax,
			String company_welfare, Date company_date, String member_password, String member_type_code,
			String member_name, String member_email, String member_phone, String member_address, Date member_sign_date,
			String member_profile_img) {
		super();
		this.interview_no = interview_no;
		this.interviewer = interviewer;
		this.interviewee = interviewee;
		this.interview_question = interview_question;
		this.interview_answer = interview_answer;
		this.interview_start_date = interview_start_date;
		this.interview_end_date = interview_end_date;
		this.interview_status = interview_status;
		this.work_no = work_no;
		this.member_id = member_id;
		this.company_name = company_name;
		this.company_type = company_type;
		this.company_staff = company_staff;
		this.company_capital = company_capital;
		this.company_code = company_code;
		this.company_tel = company_tel;
		this.company_fax = company_fax;
		this.company_welfare = company_welfare;
		this.company_date = company_date;
		this.member_password = member_password;
		this.member_type_code = member_type_code;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_address = member_address;
		this.member_sign_date = member_sign_date;
		this.member_profile_img = member_profile_img;
	}

	public String getInterview_no() {
		return interview_no;
	}

	public void setInterview_no(String interview_no) {
		this.interview_no = interview_no;
	}

	public String getInterviewer() {
		return interviewer;
	}

	public void setInterviewer(String interviewer) {
		this.interviewer = interviewer;
	}

	public String getInterviewee() {
		return interviewee;
	}

	public void setInterviewee(String interviewee) {
		this.interviewee = interviewee;
	}

	public String getInterview_question() {
		return interview_question;
	}

	public void setInterview_question(String interview_question) {
		this.interview_question = interview_question;
	}

	public String getInterview_answer() {
		return interview_answer;
	}

	public void setInterview_answer(String interview_answer) {
		this.interview_answer = interview_answer;
	}

	public Timestamp getInterview_start_date() {
		return interview_start_date;
	}

	public void setInterview_start_date(Timestamp interview_start_date) {
		this.interview_start_date = interview_start_date;
	}

	public Timestamp getInterview_end_date() {
		return interview_end_date;
	}

	public void setInterview_end_date(Timestamp interview_end_date) {
		this.interview_end_date = interview_end_date;
	}

	public String getInterview_status() {
		return interview_status;
	}

	public void setInterview_status(String interview_status) {
		this.interview_status = interview_status;
	}

	public String getWork_no() {
		return work_no;
	}

	public void setWork_no(String work_no) {
		this.work_no = work_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_type() {
		return company_type;
	}

	public void setCompany_type(String company_type) {
		this.company_type = company_type;
	}

	public String getCompany_staff() {
		return company_staff;
	}

	public void setCompany_staff(String company_staff) {
		this.company_staff = company_staff;
	}

	public String getCompany_capital() {
		return company_capital;
	}

	public void setCompany_capital(String company_capital) {
		this.company_capital = company_capital;
	}

	public String getCompany_code() {
		return company_code;
	}

	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}

	public String getCompany_tel() {
		return company_tel;
	}

	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}

	public String getCompany_fax() {
		return company_fax;
	}

	public void setCompany_fax(String company_fax) {
		this.company_fax = company_fax;
	}

	public String getCompany_welfare() {
		return company_welfare;
	}

	public void setCompany_welfare(String company_welfare) {
		this.company_welfare = company_welfare;
	}

	public Date getCompany_date() {
		return company_date;
	}

	public void setCompany_date(Date company_date) {
		this.company_date = company_date;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_type_code() {
		return member_type_code;
	}

	public void setMember_type_code(String member_type_code) {
		this.member_type_code = member_type_code;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public Date getMember_sign_date() {
		return member_sign_date;
	}

	public void setMember_sign_date(Date member_sign_date) {
		this.member_sign_date = member_sign_date;
	}

	public String getMember_profile_img() {
		return member_profile_img;
	}

	public void setMember_profile_img(String member_profile_img) {
		this.member_profile_img = member_profile_img;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Interview [interview_no=" + interview_no + ", interviewer=" + interviewer + ", interviewee="
				+ interviewee + ", interview_question=" + interview_question + ", interview_answer=" + interview_answer
				+ ", interview_start_date=" + interview_start_date + ", interview_end_date=" + interview_end_date
				+ ", interview_status=" + interview_status + ", work_no=" + work_no + ", member_id=" + member_id
				+ ", company_name=" + company_name + ", company_type=" + company_type + ", company_staff="
				+ company_staff + ", company_capital=" + company_capital + ", company_code=" + company_code
				+ ", company_tel=" + company_tel + ", company_fax=" + company_fax + ", company_welfare="
				+ company_welfare + ", company_date=" + company_date + ", member_password=" + member_password
				+ ", member_type_code=" + member_type_code + ", member_name=" + member_name + ", member_email="
				+ member_email + ", member_phone=" + member_phone + ", member_address=" + member_address
				+ ", member_sign_date=" + member_sign_date + ", member_profile_img=" + member_profile_img + "]";
	}
}
