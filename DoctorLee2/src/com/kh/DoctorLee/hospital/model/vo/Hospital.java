package com.kh.DoctorLee.hospital.model.vo;

import java.sql.Date;

public class Hospital {
	
	private int hosNo; // HOS_NO	NUMBER
	private String hosId; // HOS_ID	VARCHAR2(30 BYTE)
	private String hosPwd; // HOS_PWD	VARCHAR2(100 BYTE)
	private String hosName; // HOS_NAME	VARCHAR2(1000 BYTE)
	private String hosAddress; // HOS_ADDRESS	VARCHAR2(300 BYTE)
	private String treatDep; // TREAT_DEP	NUMBER                       (참조할)진료과 번호
	private String treatDate; // TREAT_DATE	VARCHAR2(70 BYTE)            진료 날짜
	private String treatBegin; // TREAT_BEGIN	VARCHAR2(40 BYTE)    진료 시작 시간
	private String treatEnd; // TREAT_END	VARCHAR2(40 BYTE)         진료 마감 시간
	private String hosTel; // HOS_TEL	VARCHAR2(30 BYTE)
	private String hosInfo; // HOS_INFO	VARCHAR2(2000 BYTE)
	private Date createDate; // CREATE_DATE	DATE
	private Date modifyDate; //MODITY_DATE	DATE
	private String status; // STATUS	VARCHAR2(1 BYTE)
	
	public Hospital() {
		super();
	}

	public Hospital(int hosNo, String hosId, String hosPwd, String hosName, String hosAddress, String treatDep,
			String treatDate, String treatBegin, String treatEnd, String hosTel, String hosInfo, Date createDate,
			Date modifyDate, String status) {
		super();
		this.hosNo = hosNo;
		this.hosId = hosId;
		this.hosPwd = hosPwd;
		this.hosName = hosName;
		this.hosAddress = hosAddress;
		this.treatDep = treatDep;
		this.treatDate = treatDate;
		this.treatBegin = treatBegin;
		this.treatEnd = treatEnd;
		this.hosTel = hosTel;
		this.hosInfo = hosInfo;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getHosNo() {
		return hosNo;
	}

	public void setHosNo(int hosNo) {
		this.hosNo = hosNo;
	}

	public String getHosId() {
		return hosId;
	}

	public void setHosId(String hosId) {
		this.hosId = hosId;
	}

	public String getHosPwd() {
		return hosPwd;
	}

	public void setHosPwd(String hosPwd) {
		this.hosPwd = hosPwd;
	}

	public String getHosName() {
		return hosName;
	}

	public void setHosName(String hosName) {
		this.hosName = hosName;
	}

	public String getHosAddress() {
		return hosAddress;
	}

	public void setHosAddress(String hosAddress) {
		this.hosAddress = hosAddress;
	}

	public String getTreatDep() {
		return treatDep;
	}

	public void setTreatDep(String treatDep) {
		this.treatDep = treatDep;
	}

	public String getTreatDate() {
		return treatDate;
	}

	public void setTreatDate(String treatDate) {
		this.treatDate = treatDate;
	}

	public String getTreatBegin() {
		return treatBegin;
	}

	public void setTreatBegin(String treatBegin) {
		this.treatBegin = treatBegin;
	}

	public String getTreatEnd() {
		return treatEnd;
	}

	public void setTreatEnd(String treatEnd) {
		this.treatEnd = treatEnd;
	}

	public String getHosTel() {
		return hosTel;
	}

	public void setHosTel(String hosTel) {
		this.hosTel = hosTel;
	}

	public String getHosInfo() {
		return hosInfo;
	}

	public void setHosInfo(String hosInfo) {
		this.hosInfo = hosInfo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Hospital [hosNo=" + hosNo + ", hosId=" + hosId + ", hosPwd=" + hosPwd + ", hosName=" + hosName
				+ ", hosAddress=" + hosAddress + ", treatDep=" + treatDep + ", treatDate=" + treatDate + ", treatBegin="
				+ treatBegin + ", treatEnd=" + treatEnd + ", hosTel=" + hosTel + ", hosInfo=" + hosInfo
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}

}
