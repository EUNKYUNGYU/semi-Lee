package com.kh.DoctorLee.cou.model.vo;

public class Cou {
	
	private int couNo;
	private int hosNo;
	private String hosName;
	private String couName;
	private String phone;
	private String originName;
	private String changeName;
	private String profilePath;
	
	public Cou() {
		super();
	}

	public Cou(int couNo, int hosNo, String hosName, String couName, String phone, String originName, String changeName,
			String profilePath) {
		super();
		this.couNo = couNo;
		this.hosNo = hosNo;
		this.hosName = hosName;
		this.couName = couName;
		this.phone = phone;
		this.originName = originName;
		this.changeName = changeName;
		this.profilePath = profilePath;
	}

	public int getCouNo() {
		return couNo;
	}

	public void setCouNo(int couNo) {
		this.couNo = couNo;
	}

	public int getHosNo() {
		return hosNo;
	}

	public void setHosNo(int hosNo) {
		this.hosNo = hosNo;
	}

	public String getHosName() {
		return hosName;
	}

	public void setHosName(String hosName) {
		this.hosName = hosName;
	}

	public String getCouName() {
		return couName;
	}

	public void setCouName(String couName) {
		this.couName = couName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	@Override
	public String toString() {
		return "Cou [couNo=" + couNo + ", hosNo=" + hosNo + ", hosName=" + hosName + ", couName=" + couName + ", phone="
				+ phone + ", originName=" + originName + ", changeName=" + changeName + ", profilePath=" + profilePath
				+ "]";
	}
	
}
