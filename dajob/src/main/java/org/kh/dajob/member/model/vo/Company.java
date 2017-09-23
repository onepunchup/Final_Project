package org.kh.dajob.member.model.vo;

import java.sql.Date;

public class Company extends Member {

	private static final long serialVersionUID = 11111111113L;
	
	private String company_name;
	private String company_type;
	private int company_staff;
	private int company_capital;
	private String company_code;
	private String company_tel;
	private String company_fax;
	private String company_welfare;
	private Date company_date;
	
	public Company() {}
	
	public Company(String member_id, String company_name, String company_type, int company_staff, int company_capital,
			String company_code, String company_tel, String company_fax, String company_welfare, Date company_date) {
		super(member_id);
		this.company_name = company_name;
		this.company_type = company_type;
		this.company_staff = company_staff;
		this.company_capital = company_capital;
		this.company_code = company_code;
		this.company_tel = company_tel;
		this.company_fax = company_fax;
		this.company_welfare = company_welfare;
		this.company_date = company_date;
	}

	public Company(String company_name, String company_type, int company_staff, int company_capital,
			String company_code, String company_tel, String company_fax, String company_welfare, Date company_date) {
		super();
		this.company_name = company_name;
		this.company_type = company_type;
		this.company_staff = company_staff;
		this.company_capital = company_capital;
		this.company_code = company_code;
		this.company_tel = company_tel;
		this.company_fax = company_fax;
		this.company_welfare = company_welfare;
		this.company_date = company_date;
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

	public int getCompany_staff() {
		return company_staff;
	}

	public void setCompany_staff(int company_staff) {
		this.company_staff = company_staff;
	}

	public int getCompany_capital() {
		return company_capital;
	}

	public void setCompany_capital(int company_capital) {
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
	};
}