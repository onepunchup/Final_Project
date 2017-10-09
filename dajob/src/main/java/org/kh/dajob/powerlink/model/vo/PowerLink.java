package org.kh.dajob.powerlink.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PowerLink implements Serializable{
	private static final long serialVersionUID = 51111111111L;
	
	private String member_id;
	private Date powerlink_date;
	private int powerlink_cnt;
	private int powerlink_time;
	private String year;
	private String mon;
	private int sum;
	private int percentage;
	private int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMon() {
		return mon;
	}
	public void setMon(String mon) {
		this.mon = mon;
	}
	public int getPercentage() {
		return percentage;
	}
	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getPowerlink_date() {
		return powerlink_date;
	}
	public void setPowerlink_date(Date powerlink_date) {
		this.powerlink_date = powerlink_date;
	}
	public int getPowerlink_cnt() {
		return powerlink_cnt;
	}
	public void setPowerlink_cnt(int powerlink_cnt) {
		this.powerlink_cnt = powerlink_cnt;
	}
	public int getPowerlink_time() {
		return powerlink_time;
	}
	public void setPowerlink_time(int powerlink_time) {
		this.powerlink_time = powerlink_time;
	}
	@Override
	public String toString() {
		return "PowerLink [member_id=" + member_id + ", powerlink_date=" + powerlink_date + ", powerlink_cnt="
				+ powerlink_cnt + ", powerlink_time=" + powerlink_time + "]";
	}
	
}
