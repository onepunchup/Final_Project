package org.kh.dajob.member.model.vo;

public class CompanyType implements java.io.Serializable{

	private static final long serialVersionUID = 11111111114L;
	private String company_type;
	private String company_tname;
	
	public CompanyType() {}	
	
	public CompanyType(String company_type, String company_tname) {
		this.company_type = company_type;
		this.company_tname = company_tname;
	}

	@Override
	public String toString() {
		return "CompanyType [company_type=" + company_type + ", company_tname=" + company_tname + "]";
	}

	public String getCompany_type() {
		return company_type;
	}

	public void setCompany_type(String company_type) {
		this.company_type = company_type;
	}

	public String getCompany_tname() {
		return company_tname;
	}

	public void setCompany_tname(String company_tname) {
		this.company_tname = company_tname;
	}
}
