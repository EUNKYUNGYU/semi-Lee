package com.kh.DoctorLee.mpBoard.model.vo;

import java.sql.Date;

public class FamDiary {
	private int famDirNo;
	private int memNo;
	private Date createDate;
	private String famDirTitle;
	private String famDirContent;
	public FamDiary() {
		super();
	}
	public FamDiary(int famDirNo, int memNo, Date createDate, String famDirTitle, String famDirContent) {
		super();
		this.famDirNo = famDirNo;
		this.memNo = memNo;
		this.createDate = createDate;
		this.famDirTitle = famDirTitle;
		this.famDirContent = famDirContent;
	}
	public int getFamDirNo() {
		return famDirNo;
	}
	public void setFamDirNo(int famDirNo) {
		this.famDirNo = famDirNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getFamDirTitle() {
		return famDirTitle;
	}
	public void setFamDirTitle(String famDirTitle) {
		this.famDirTitle = famDirTitle;
	}
	public String getFamDirContent() {
		return famDirContent;
	}
	public void setFamDirContent(String famDirContent) {
		this.famDirContent = famDirContent;
	}
	@Override
	public String toString() {
		return "FamDiary [famDirNo=" + famDirNo + ", memNo=" + memNo + ", createDate=" + createDate + ", famDirTitle="
				+ famDirTitle + ", famDirContent=" + famDirContent + "]";
	}

}
