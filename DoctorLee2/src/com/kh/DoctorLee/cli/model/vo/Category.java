package com.kh.DoctorLee.cli.model.vo;

public class Category {
	
	private int cateNo;
	private String cliCate;
	
	public Category() {
		super();
	}
	
	public Category(int cateNo, String cliCate) {
		super();
		this.cateNo = cateNo;
		this.cliCate = cliCate;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public String getCliCate() {
		return cliCate;
	}

	public void setCliCate(String cliCate) {
		this.cliCate = cliCate;
	}

	@Override
	public String toString() {
		return "Category [cateNo=" + cateNo + ", cliCate=" + cliCate + "]";
	}
	
}
