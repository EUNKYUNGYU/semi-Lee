package com.kh.DoctorLee.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String nickName;
	private String phone;
	private String iNum;
	private String email;
	private String gender;
	private int height;
	private int weight;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	
	public Member() {
		super();
	}


	public Member(int memNo, String memId, String memPwd, String memName, String nickName, String phone, String iNum,
			String email, String gender, int height, int weight, Date createDate, Date modifyDate, String status) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickName = nickName;
		this.phone = phone;
		this.iNum = iNum;
		this.email = email;
		this.gender = gender;
		this.height = height;
		this.weight = weight;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getMemPwd() {
		return memPwd;
	}


	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}


	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getiNum() {
		return iNum;
	}


	public void setiNum(String iNum) {
		this.iNum = iNum;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getHeight() {
		return height;
	}


	public void setHeight(int height) {
		this.height = height;
	}


	public int getWeight() {
		return weight;
	}


	public void setWeight(int weight) {
		this.weight = weight;
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
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", nickName=" + nickName + ", phone=" + phone + ", iNum=" + iNum + ", email=" + email + ", gender="
				+ gender + ", height=" + height + ", weight=" + weight + ", createDate=" + createDate + ", modifyDate="
				+ modifyDate + ", status=" + status + "]";
	}
	
	

}
