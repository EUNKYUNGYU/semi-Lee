package com.kh.DoctorLee.cou.model.vo;

public class CouResTime {
	private int timeNo;
	private int couNo;
	private String couTime;
	private String couDate;
	
	public CouResTime() {
		super();
	}
	
	public CouResTime(int timeNo, int couNo, String couTime, String couDate) {
		super();
		this.timeNo = timeNo;
		this.couNo = couNo;
		this.couTime = couTime;
		this.couDate = couDate;
	}
	
	public int getTimeNo() {
		return timeNo;
	}
	
	public void setTimeNo(int timeNo) {
		this.timeNo = timeNo;
	}
	
	public int getCouNo() {
		return couNo;
	}
	
	public void setCouNo(int couNo) {
		this.couNo = couNo;
	}
	
	public String getCouTime() {
		
		return couTime;
	}
	public void setCouTime(String couTime) {
		this.couTime = couTime;
	}
	
	public String getCouDate() {
		return couDate;
	}
	
	public void setCouDate(String couDate) {
		this.couDate = couDate;
	}
	
	@Override
	public String toString() {
		return "CouResTime [timeNo=" + timeNo + ", couNo=" + couNo + ", couTime=" + couTime + ", couDate=" + couDate
				+ "]";
	}
}
