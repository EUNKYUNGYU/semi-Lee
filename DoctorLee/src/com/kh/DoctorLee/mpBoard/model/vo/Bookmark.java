package com.kh.DoctorLee.mpBoard.model.vo;

import java.sql.Date;

public class Bookmark {
	private String hospitalName;
	private Date enrollDate;
	public Bookmark() {
		super();
	}
	public Bookmark(String hospitalName, Date enrollDate) {
		super();
		this.hospitalName = hospitalName;
		this.enrollDate = enrollDate;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	@Override
	public String toString() {
		return "Bookmark [hospitalName=" + hospitalName + ", enrollDate=" + enrollDate + "]";
	}

}
