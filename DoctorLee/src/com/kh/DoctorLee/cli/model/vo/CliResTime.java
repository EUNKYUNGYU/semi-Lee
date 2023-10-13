package com.kh.DoctorLee.cli.model.vo;

public class CliResTime {

	private int timeNo;
	private int cliNo;
	private String cliTime;
	private String cliDate;
	
	public CliResTime() {
		super();
	}
	
	public CliResTime(int timeNo, int cliNo, String cliTime, String cliDate) {
		super();
		this.timeNo = timeNo;
		this.cliNo = cliNo;
		this.cliTime = cliTime;
		this.cliDate = cliDate;
	}
	
	public int getTimeNo() {
		return timeNo;
	}
	
	public void setTimeNo(int timeNo) {
		this.timeNo = timeNo;
	}
	
	public int getCliNo() {
		return cliNo;
	}
	
	public void setCliNo(int cliNo) {
		this.cliNo = cliNo;
	}
	
	public String getCliTime() {
		return cliTime;
	}
	
	public void setCliTime(String cliTime) {
		this.cliTime = cliTime;
	}
	
	public String getCliDate() {
		return cliDate;
	}
	
	public void setCliDate(String cliDate) {
		this.cliDate = cliDate;
	}
	
	@Override
	public String toString() {
		return "CliResTime [timeNo=" + timeNo + ", cliNo=" + cliNo + ", cliTime=" + cliTime + ", cliDate=" + cliDate
				+ "]";
	}
	
}
