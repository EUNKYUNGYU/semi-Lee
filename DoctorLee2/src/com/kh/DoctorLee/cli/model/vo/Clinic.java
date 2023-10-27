package com.kh.DoctorLee.cli.model.vo;

public class Clinic {
	private int cliNo; // 클리닉 번호
	private String hosNo; // 소속 병원명
	private int cateNo; // 클리닉 카테고리 번호
	private String cliName;  // 클리닉명
	private String cliPrice;  // 클리닉 가격
	private String originName;  // 상세정보 원본명
	private String changeName;  // 상세정보 수정명
	private String desPath;  // 상세정보 경로
	private String cateName; // 클리닉 카테고리 이름
	private double scope;
	
	public Clinic() {
		super();
	}
	
	public Clinic(int cliNo, String hosNo, int cateNo, String cliName, String cliPrice, String originName,
			String changeName, String desPath, String cateName, double scope) {
		super();
		this.cliNo = cliNo;
		this.hosNo = hosNo;
		this.cateNo = cateNo;
		this.cliName = cliName;
		this.cliPrice = cliPrice;
		this.originName = originName;
		this.changeName = changeName;
		this.desPath = desPath;
		this.cateName = cateName;
		this.scope = scope;
	}
	
	public int getCliNo() {
		return cliNo;
	}
	
	public void setCliNo(int cliNo) {
		this.cliNo = cliNo;
	}
	
	public String getHosNo() {
		return hosNo;
	}
	
	public void setHosNo(String hosNo) {
		this.hosNo = hosNo;
	}
	
	public int getCateNo() {
		return cateNo;
	}
	
	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}
	
	public String getCliName() {
		return cliName;
	}
	
	public void setCliName(String cliName) {
		this.cliName = cliName;
	}
	
	public String getCliPrice() {
		return cliPrice;
	}
	
	public void setCliPrice(String cliPrice) {
		this.cliPrice = cliPrice;
	}
	
	public String getOriginName() {
		return originName;
	}
	
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	
	public String getChangeName() {
		return changeName;
	}
	
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	
	public String getDesPath() {
		return desPath;
	}
	
	public void setDesPath(String desPath) {
		this.desPath = desPath;
	}
	
	public String getCateName() {
		return cateName;
	}
	
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	
	public double getScope() {
		return scope;
	}
	
	public void setScope(double scope) {
		this.scope = scope;
	}
	
	@Override
	public String toString() {
		return "Clinic [cliNo=" + cliNo + ", hosNo=" + hosNo + ", cateNo=" + cateNo + ", cliName=" + cliName
				+ ", cliPrice=" + cliPrice + ", originName=" + originName + ", changeName=" + changeName + ", desPath="
				+ desPath + ", cateName=" + cateName + ", scope=" + scope + "]";
	}
	
}
