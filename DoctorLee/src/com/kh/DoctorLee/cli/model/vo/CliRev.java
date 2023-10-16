package com.kh.DoctorLee.cli.model.vo;

public class CliRev {
	private int revNo;
	private int cliNo;
	private int memNo;
	private String revContent;
	private String createDate;
	private int cliScope;
	
	public CliRev() {
		super();
	}
	
	public CliRev(int revNo, int cliNo, int memNo, String revContent, String createDate, int cliScope) {
		super();
		this.revNo = revNo;
		this.cliNo = cliNo;
		this.memNo = memNo;
		this.revContent = revContent;
		this.createDate = createDate;
		this.cliScope = cliScope;
	}
	
	public int getRevNo() {
		return revNo;
	}
	
	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}
	
	public int getCliNo() {
		return cliNo;
	}
	
	public void setCliNo(int cliNo) {
		this.cliNo = cliNo;
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
	
	public int getCliScope() {
		return cliScope;
	}
	
	public void setCliScope(int cliScope) {
		this.cliScope = cliScope;
	}
	
	@Override
	public String toString() {
		return "CliRev [revNo=" + revNo + ", cliNo=" + cliNo + ", memNo=" + memNo + ", revContent=" + revContent
				+ ", createDate=" + createDate + ", cliScope=" + cliScope + "]";
	}
	
}
