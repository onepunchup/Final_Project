package org.kh.dajob.dashboard.model.vo;

public class DashBoard {
	private static final long serialVersionUID = 31238127132L;
	
	private int tot_profit;
	private String year;
	private String mon;
	private int mon_profit;
	private String area;
	private int area_count;
	private int mon_count;
	private int count_sum;

	public DashBoard(){}
	public DashBoard(int tot_profit){
		this.tot_profit = tot_profit;
	}
	public DashBoard(String year, String mon, int mon_profit){
		this.year = year;
		this.mon = mon;
		this.mon_profit = mon_profit;
	}
	public DashBoard(String area, int area_count){
		this.area = area;
		this.area_count = area_count;
	}
	public DashBoard(String year, String mon, int mon_count, int count_sum){
		this.year = year;
		this.mon = mon;
		this.mon_count = mon_count;
		this.count_sum = count_sum;
	}
	
	public int getCount_sum() {
		return count_sum;
	}
	public void setCount_sum(int count_sum) {
		this.count_sum = count_sum;
	}
	public int getMon_count() {
		return mon_count;
	}
	
	public void setMon_count(int mon_count) {
		this.mon_count = mon_count;
	}
	
	public int getTot_profit() {
		return tot_profit;
	}


	public void setTot_profit(int tot_profit) {
		this.tot_profit = tot_profit;
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


	public int getMon_profit() {
		return mon_profit;
	}


	public void setMon_profit(int mon_profit) {
		this.mon_profit = mon_profit;
	}


	public String getArea() {
		return area;
	}


	public void setArea(String area) {
		this.area = area;
	}


	public int getArea_count() {
		return area_count;
	}


	public void setArea_count(int area_count) {
		this.area_count = area_count;
	}


	@Override
	public String toString(){
		return this.tot_profit + ", " + this.year + ", " + this.mon + ", " + this.mon_profit + ", " + 
				this.area + ", " + this.area_count + this.mon_count;
	}

}
