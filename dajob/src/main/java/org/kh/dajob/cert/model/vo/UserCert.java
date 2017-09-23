package org.kh.dajob.cert.model.vo;

import java.sql.Date;

public class UserCert implements java.io.Serializable{
	
	private static final long serialVersionUID = 2111111112L;
	
	private String member_id;
	private String cert_no;
	private Date cert_date;
	
	public UserCert() {
		super();
	}

	public UserCert(String member_id, String cert_no, Date cert_date) {
		super();
		this.member_id = member_id;
		this.cert_no = cert_no;
		this.cert_date = cert_date;
	}
	
	@Override
	public String toString() {
		return "UserCert [member_id=" + member_id + ", cert_no=" + cert_no + ", cert_date=" + cert_date + "]";
	}

	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCert_no() {
		return cert_no;
	}
	public void setCert_no(String cert_no) {
		this.cert_no = cert_no;
	}
	public Date getCert_date() {
		return cert_date;
	}
	public void setCert_date(Date cert_date) {
		this.cert_date = cert_date;
	}
}
