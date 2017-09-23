package org.kh.dajob.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	private static final long serialVersionUID = 11111111111L;
	
	private String member_id;
	private String member_password;
	private String member_type_code;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_address;
	private Date member_sign_date;
	private String member_profile_img;
	
	public Member(){}
	
	public Member(String member_id) {
		super();
		this.member_id = member_id;
	}

	public Member(String member_id, String member_password, String member_type_code, String member_name,
			String member_email, String member_phone, String member_address, Date member_sign_date,
			String member_profile_img) {
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_type_code = member_type_code;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_address = member_address;
		this.member_sign_date = member_sign_date;
		this.member_profile_img = member_profile_img;
	}
	
	public Member(String member_id, String member_password) {
		this.member_id = member_id;
		this.member_password = member_password;
	}
	
	public Member(String member_id, String member_password, String member_type_code, String member_name,
			String member_email, String member_phone, String member_address, String member_profile_img) {
		super();
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_type_code = member_type_code;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_address = member_address;
		this.member_profile_img = member_profile_img;
	}

	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_password=" + member_password + ", member_type_code="
				+ member_type_code + ", member_name=" + member_name + ", member_email=" + member_email
				+ ", member_phone=" + member_phone + ", member_address=" + member_address + ", member_sign_date="
				+ member_sign_date + ", member_profile_img=" + member_profile_img + "]";
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
}
