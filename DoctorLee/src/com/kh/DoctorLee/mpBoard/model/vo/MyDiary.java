package com.kh.DoctorLee.mpBoard.model.vo;

import java.sql.Date;

public class MyDiary {
	private int dairyNO;
	private int memNo;
	private Date createDate;
	private String diaryTitle;
	private String diaryContent;
	public MyDiary() {
		super();
	}
	public MyDiary(int dairyNO, int memNo, Date createDate, String diaryTitle, String diaryContent) {
		super();
		this.dairyNO = dairyNO;
		this.memNo = memNo;
		this.createDate = createDate;
		this.diaryTitle = diaryTitle;
		this.diaryContent = diaryContent;
	}
	public int getDairyNO() {
		return dairyNO;
	}
	public void setDairyNO(int dairyNO) {
		this.dairyNO = dairyNO;
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
	public String getDiaryTitle() {
		return diaryTitle;
	}
	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}
	public String getDiaryContent() {
		return diaryContent;
	}
	public void setDiaryContent(String diaryContent) {
		this.diaryContent = diaryContent;
	}
	@Override
	public String toString() {
		return "MyDiary [dairyNO=" + dairyNO + ", memNo=" + memNo + ", createDate=" + createDate + ", diaryTitle="
				+ diaryTitle + ", diaryContent=" + diaryContent + "]";
	}

}
