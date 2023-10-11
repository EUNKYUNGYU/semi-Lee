package com.kh.DoctorLee.hospital.model.vo;

public class Doctor {
	
	private int docNo;
	private String treatDep;
	private String docName;
	private String treatDate;
	private String treatTime;
	private int hosNo; // 소속 병원
	
	public Doctor() {
		super();
	}
	public Doctor(int docNo, String treatDep, String docName, String treatDate, String treatTime, int hosNo) {
		super();
		this.docNo = docNo;
		this.treatDep = treatDep;
		this.docName = docName;
		this.treatDate = treatDate;
		this.treatTime = treatTime;
		this.hosNo = hosNo;
	}
	public int getDocNo() {
		return docNo;
	}
	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}
	public String getTreatDep() {
		return treatDep;
	}
	public void setTreatDep(String treatDep) {
		this.treatDep = treatDep;
	}
	public String getDocName() {
		return docName;
	}
	public void setDocName(String docName) {
		this.docName = docName;
	}
	public String getTreatDate() {
		return treatDate;
	}
	public void setTreatDate(String treatDate) {
		this.treatDate = treatDate;
	}
	public String getTreatTime() {
		return treatTime;
	}
	public void setTreatTime(String treatTime) {
		this.treatTime = treatTime;
	}
	public int getHosNo() {
		return hosNo;
	}
	public void setHosNo(int hosNo) {
		this.hosNo = hosNo;
	}
	
	@Override
	public String toString() {
		return "Doctor [docNo=" + docNo + ", treatDep=" + treatDep + ", docName=" + docName + ", treatDate=" + treatDate
				+ ", treatTime=" + treatTime + ", hosNo=" + hosNo + "]";
	}
}
