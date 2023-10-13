package com.kh.DoctorLee.cli.model.vo;

import java.sql.Date;

public class CliRes {
	
	private int resNo;
	private int memNo;
	private int cliNo;
	private String resDate;
	private String resTime;
	
	public CliRes() {
		super();
	}
	
	public CliRes(int resNo, int memNo, int cliNo, String resDate, String resTime) {
		super();
		this.resNo = resNo;
		this.memNo = memNo;
		this.cliNo = cliNo;
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
	
	public int getCliNo() {
		return cliNo;
	}
	
	public void setCliNo(int cliNo) {
		this.cliNo = cliNo;
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
		return "CliRes [resNo=" + resNo + ", memNo=" + memNo + ", cliNo=" + cliNo + ", resDate=" + resDate
				+ ", resTime=" + resTime + "]";
	}
	
}
