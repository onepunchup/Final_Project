package org.kh.dajob.member.model.vo;

import java.sql.Date;

public class User extends Member implements java.io.Serializable {
	private static final long serialVersionUID = 11111111112L;
	
	private Member m;
	private String gender;
	private Date birthday;
	private String resume_data;
	private String resumefile1;
	private String resumefile2;
	private String resumefile3;
	
	public User() {
		super();
	}

	public User(String member_id, String member_password, String member_type_code, String member_name,
			String member_email, String member_phone, String member_address, Date member_sign_date,
			String member_profile_img, String gender, Date birthday, String resumefile1, String resumefile2, String resumefile3) {
		super(member_id, member_password, member_type_code, member_name, member_email, member_phone, member_address,
				member_sign_date, member_profile_img);
		this.gender = gender;
		this.birthday = birthday;
		this.resumefile1 = resumefile1;
		this.resumefile2 = resumefile2;
		this.resumefile3 = resumefile3;
	}
	
	public User(String id, String resumefile1, String resumefile2, String resumefile3) {
		super(id);
		this.resumefile1 = resumefile1;
		this.resumefile2 = resumefile2;
		this.resumefile3 = resumefile3;
	}
	
	public User(String id, String gender, Date birthday, String resume_data, String resumefile1, String resumefile2,
			String resumefile3) {
		super(id);
		this.gender = gender;
		this.birthday = birthday;
		this.resume_data = resume_data;
		this.resumefile1 = resumefile1;
		this.resumefile2 = resumefile2;
		this.resumefile3 = resumefile3;
	}
	
	public User(Member m, String gender, Date birthday, String resume_data, String resumefile1, String resumefile2,
			String resumefile3) {
		super();
		this.m = m;
		this.gender = gender;
		this.birthday = birthday;
		this.resume_data = resume_data;
		this.resumefile1 = resumefile1;
		this.resumefile2 = resumefile2;
		this.resumefile3 = resumefile3;
	}
	
	public User(String id, String gender, Date birthday) {
		super(id);
		this.gender = gender;
		this.birthday = birthday;
	}

	public User(String gender, Date birthday, String resume_data, String resumefile1, String resumefile2, String resumefile3) {
		super();
		this.gender = gender;
		this.birthday = birthday;
		this.resume_data = resume_data;
		this.resumefile1 = resumefile1;
		this.resumefile2 = resumefile2;
		this.resumefile3 = resumefile3;
	}

	public User(String gender, Date birthday, String resumefile1, String resumefile2, String resumefile3) {
		super();
		this.gender = gender;
		this.birthday = birthday;
		this.resumefile1 = resumefile1;
		this.resumefile2 = resumefile2;
		this.resumefile3 = resumefile3;
	}

	@Override
	public String toString() {
		return "User [m=" + m + ", gender=" + gender + ", birthday=" + birthday + ", resume_data=" + resume_data
				+ ", resumefile1=" + resumefile1 + ", resumefile2=" + resumefile2 + ", resumefile3=" + resumefile3
				+ "]";
	}

	public Member getM() {
		return m;
	}

	public void setM(Member m) {
		this.m = m;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getResume_data() {
		return resume_data;
	}

	public void setResume_data(String resume_data) {
		this.resume_data = resume_data;
	}
	
	public String getResumefile1() {
		return resumefile1;
	}

	public void setResumefile1(String resumefile1) {
		this.resumefile1 = resumefile1;
	}

	public String getResumefile2() {
		return resumefile2;
	}

	public void setResumefile2(String resumefile2) {
		this.resumefile2 = resumefile2;
	}

	public String getResumefile3() {
		return resumefile3;
	}

	public void setResumefile3(String resumefile3) {
		this.resumefile3 = resumefile3;
	}
}