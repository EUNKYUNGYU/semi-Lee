package com.kh.DoctorLee.cli.model.vo;

public class CliResTime {

	private int timeNo;
	private int cliNo;
	private String cliTime;
	public CliResTime() {
		super();
	}
	
	public CliResTime(int timeNo, int cliNo, String cliTime) {
		super();
		this.timeNo = timeNo;
		this.cliNo = cliNo;
		this.cliTime = cliTime;
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
	
	@Override
	public String toString() {
		return "CliResTime [timeNo=" + timeNo + ", cliNo=" + cliNo + ", cliTime=" + cliTime + "]";
	}
	
}
