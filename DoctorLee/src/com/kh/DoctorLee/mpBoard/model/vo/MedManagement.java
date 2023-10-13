package com.kh.DoctorLee.mpBoard.model.vo;

import java.sql.Date;

public class MedManagement {
	
	private String hosName;
	private Date treatDate;
	private Date preDate;
	private String doctorName;
	private String mediName;
	private int medManNo;
	
	
	public MedManagement() {
		super();
	}


	public MedManagement(String hosName, Date treateDate, Date preDate, String doctorName, String mediName,
			int medManNo) {
		super();
		this.hosName = hosName;
		this.treatDate = treateDate;
		this.preDate = preDate;
		this.doctorName = doctorName;
		this.mediName = mediName;
		this.medManNo = medManNo;
	}


	public String getHosName() {
		return hosName;
	}


	public void setHosName(String hosName) {
		this.hosName = hosName;
	}


	public Date getTreateDate() {
		return treatDate;
	}


	public void setTreateDate(Date treateDate) {
		this.treatDate = treateDate;
	}


	public Date getPreDate() {
		return preDate;
	}


	public void setPreDate(Date preDate) {
		this.preDate = preDate;
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


	public int getMedManNo() {
		return medManNo;
	}


	public void setMedManNo(int medManNo) {
		this.medManNo = medManNo;
	}


	@Override
	public String toString() {
		return "MedManagement [hosName=" + hosName + ", treatDate=" + treatDate + ", preDate=" + preDate
				+ ", doctorName=" + doctorName + ", mediName=" + mediName + ", medManNo=" + medManNo + "]";
	}
	
	
	
	
}