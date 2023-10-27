package com.kh.DoctorLee.medicine.model.vo;

public class Medicine {
	
	private int medNo;
	private String medName;
	private String preInfo;
	private String cauction;
	
	public Medicine() {
		super();
	}
	public Medicine(int medNo, String medName, String preInfo, String cauction) {
		super();
		this.medNo = medNo;
		this.medName = medName;
		this.preInfo = preInfo;
		this.cauction = cauction;
	}
	public int getMedNo() {
		return medNo;
	}
	public void setMedNo(int medNo) {
		this.medNo = medNo;
	}
	public String getMedName() {
		return medName;
	}
	public void setMedName(String medName) {
		this.medName = medName;
	}
	public String getPreInfo() {
		return preInfo;
	}
	public void setPreInfo(String preInfo) {
		this.preInfo = preInfo;
	}
	public String getCauction() {
		return cauction;
	}
	public void setCauction(String cauction) {
		this.cauction = cauction;
	}
	@Override
	public String toString() {
		return "Medicine [medNo=" + medNo + ", medName=" + medName + ", preInfo=" + preInfo + ", cauction=" + cauction
				+ "]";
	}

}
