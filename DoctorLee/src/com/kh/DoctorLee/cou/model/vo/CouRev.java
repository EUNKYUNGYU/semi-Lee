package com.kh.DoctorLee.cou.model.vo;

public class CouRev {

	private int revNo;
	private int couNo;
	private int memNo;
	private String revContent;
	private String createDate;
	private int couScope;
	private String nickName;
	
	public CouRev() {
		super();
	}

	public CouRev(int revNo, int couNo, int memNo, String revContent, String createDate, int couScope,
			String nickName) {
		super();
		this.revNo = revNo;
		this.couNo = couNo;
		this.memNo = memNo;
		this.revContent = revContent;
		this.createDate = createDate;
		this.couScope = couScope;
		this.nickName = nickName;
	}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public int getCouNo() {
		return couNo;
	}

	public void setCouNo(int couNo) {
		this.couNo = couNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getCouScope() {
		return couScope;
	}

	public void setCouScope(int couScope) {
		this.couScope = couScope;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "CouRev [revNo=" + revNo + ", couNo=" + couNo + ", memNo=" + memNo + ", revContent=" + revContent
				+ ", createDate=" + createDate + ", couScope=" + couScope + ", nickName=" + nickName + "]";
	}
	
}
