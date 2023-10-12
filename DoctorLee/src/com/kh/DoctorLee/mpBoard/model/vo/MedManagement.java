package com.kh.DoctorLee.mpBoard.model.vo;

import java.sql.Date;

public class MedManagement {
	
	private int preNo;
	private int rsvtNo;
	private int memNo;
	private String hosName;
	private String doctorName;
	private String mediName;
	private Date treateDate;
	private Date preDate;
	
	
	public MedManagement() {
		super();
	}


	public MedManagement(int preNo, int rsvtNo, int memNo, String hosName, String doctorName, String mediName,
			Date treateDate, Date preDate) {
		super();
		this.preNo = preNo;
		this.rsvtNo = rsvtNo;
		this.memNo = memNo;
		this.hosName = hosName;
		this.doctorName = doctorName;
		this.mediName = mediName;
		this.treateDate = treateDate;
		this.preDate = preDate;
	}


	public int getPreNo() {
		return preNo;
	}


	public void setPreNo(int preNo) {
		this.preNo = preNo;
	}


	public int getRsvtNo() {
		return rsvtNo;
	}


	public void setRsvtNo(int rsvtNo) {
		this.rsvtNo = rsvtNo;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public String getHosName() {
		return hosName;
	}


	public void setHosName(String hosName) {
		this.hosName = hosName;
	}


	public String getDoctorName() {
		return doctorName;
	}


	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}


	public String getMediName() {
		return mediName;
	}


	public void setMediName(String mediName) {
		this.mediName = mediName;
	}


	public Date getTreateDate() {
		return treateDate;
	}


	public void setTreateDate(Date treateDate) {
		this.treateDate = treateDate;
	}


	public Date getPreDate() {
		return preDate;
	}


	public void setPreDate(Date preDate) {
		this.preDate = preDate;
	}


	@Override
	public String toString() {
		return "MedManagement [preNo=" + preNo + ", rsvtNo=" + rsvtNo + ", memNo=" + memNo + ", hosName=" + hosName
				+ ", doctorName=" + doctorName + ", mediName=" + mediName + ", treateDate=" + treateDate + ", preDate="
				+ preDate + "]";
	}

	
}