package com.kh.DoctorLee.cli.model.vo;

import java.sql.Date;

public class CliResDate {

	private int dateNo;
	private int cliNo;
	private Date cliDate;
	
	public CliResDate() {
		super();
	}

	public CliResDate(int dateNo, int cliNo, Date cliDate) {
		super();
		this.dateNo = dateNo;
		this.cliNo = cliNo;
		this.cliDate = cliDate;
	}

	public int getDateNo() {
		return dateNo;
	}

	public void setDateNo(int dateNo) {
		this.dateNo = dateNo;
	}

	public int getCliNo() {
		return cliNo;
	}

	public void setCliNo(int cliNo) {
		this.cliNo = cliNo;
	}

	public Date getCliDate() {
		return cliDate;
	}

	public void setCliDate(Date cliDate) {
		this.cliDate = cliDate;
	}

	@Override
	public String toString() {
		return "CliResDate [dateNo=" + dateNo + ", cliNo=" + cliNo + ", cliDate=" + cliDate + "]";
	}
	
}
