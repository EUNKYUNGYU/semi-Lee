package com.kh.DoctorLee.cou.model.vo;

public class CouRes {
	
	private int resNo;
	private int memNo;
	private int couNo;
	private String resDate;
	private String resTime;
	
	public CouRes() {
		super();
	}

	public CouRes(int resNo, int memNo, int couNo, String resDate, String resTime) {
		super();
		this.resNo = resNo;
		this.memNo = memNo;
		this.couNo = couNo;
		this.resDate = resDate;
		this.resTime = resTime;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getCouNo() {
		return couNo;
	}

	public void setCouNo(int couNo) {
		this.couNo = couNo;
	}

	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

	public String getResTime() {
		return resTime;
	}

	public void setResTime(String resTime) {
		this.resTime = resTime;
	}

	@Override
	public String toString() {
		return "CouRes [resNo=" + resNo + ", memNo=" + memNo + ", couNo=" + couNo + ", resDate=" + resDate
				+ ", resTime=" + resTime + "]";
	}
	
}
