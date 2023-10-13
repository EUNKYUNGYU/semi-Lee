package com.kh.DoctorLee.mpBoard.model.vo;

import java.sql.Date;

public class CustomerService {

	private int inqNo;
	private int memNo;
	private int inqType;
	private String inqTitle;
	private String inqContent;
	private Date createDate;
	private String delStatus;
	
	
	public CustomerService() {
		super();
	}


	public CustomerService(int inqNo, int memNo, int inqType, String inqTitle, String inqContent, Date createDate,
			String delStatus) {
		super();
		this.inqNo = inqNo;
		this.memNo = memNo;
		this.inqType = inqType;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.createDate = createDate;
		this.delStatus = delStatus;
	}


	public int getInqNo() {
		return inqNo;
	}


	public void setInqNo(int inqNo) {
		this.inqNo = inqNo;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public int getInqType() {
		return inqType;
	}


	public void setInqType(int inqType) {
		this.inqType = inqType;
	}


	public String getInqTitle() {
		return inqTitle;
	}


	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}


	public String getInqContent() {
		return inqContent;
	}


	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getDelStatus() {
		return delStatus;
	}


	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}


	@Override
	public String toString() {
		return "CustomerService [inqNo=" + inqNo + ", memNo=" + memNo + ", inqType=" + inqType + ", inqTitle="
				+ inqTitle + ", inqContent=" + inqContent + ", createDate=" + createDate + ", delStatus=" + delStatus
				+ "]";
	}
	
	
}
