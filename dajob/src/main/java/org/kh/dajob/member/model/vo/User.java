package org.kh.dajob.member.model.vo;

import java.sql.Date;

public class User extends Member {
	private static final long serialVersionUID = 11111111112L;
	
	private Member m;
	private String gender;
	private Date birthday;
	private String resume_data;
	private String resumefile;
	
	public User() {
		super();
	}

	public User(String member_id, String member_password, String member_type_code, String member_name,
			String member_email, String member_phone, String member_address, Date member_sign_date,
			String member_profile_img, String gender, Date birthday, String resumefile) {
		super(member_id, member_password, member_type_code, member_name, member_email, member_phone, member_address,
				member_sign_date, member_profile_img);
		this.gender = gender;
		this.birthday = birthday;
		this.resumefile = resumefile;
	}
	
	public User(String id, String gender, Date birthday, String resume_data, String resumefile) {
		super(id);
		this.gender = gender;
		this.birthday = birthday;
		this.resume_data = resume_data;
		this.resumefile = resumefile;
	}
	
	public User(Member m, String gender, Date birthday, String resume_data, String resumefile) {
		this.m = m;
		this.gender = gender;
		this.birthday = birthday;
		this.resume_data = resume_data;
		this.resumefile = resumefile;
	}
	
	public User(String id, String gender, Date birthday) {
		super(id);
		this.gender = gender;
		this.birthday = birthday;
	}

	public User(String gender, Date birthday, String resume_data, String resumefile) {
		super();
		this.gender = gender;
		this.birthday = birthday;
		this.resume_data = resume_data;
		this.resumefile = resumefile;
	}

	public User(String gender, Date birthday, String resumefile) {
		super();
		this.gender = gender;
		this.birthday = birthday;
		this.resumefile = resumefile;
	}

	@Override
	public String toString() {
		return "User = ["+super.toString()+ "[gender=" + gender + ", birthday=" + birthday + ", resume_data=" + resume_data + ", resumefile="
				+ resumefile + "]";
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

	public String getResumefile() {
		return resumefile;
	}

	public void setResumefile(String resumefile) {
		this.resumefile = resumefile;
	}
}