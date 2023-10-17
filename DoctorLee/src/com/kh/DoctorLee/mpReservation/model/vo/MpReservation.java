package com.kh.DoctorLee.mpReservation.model.vo;

public class MpReservation {
	private int rsvtNo;
	private String rsvtHos;
	private String rsvtDoc;
	private String rsvtMem;
	private String rsvtDate;
	private String rsvtTime;
	private String memInfo;
	private int rsvtMemNo;
	public MpReservation() {
		super();
	}
	public MpReservation(int rsvtNo, String rsvtHos, String rsvtDoc, String rsvtMem, String rsvtDate, String rsvtTime,
			String memInfo, int rsvtMemNo) {
		super();
		this.rsvtNo = rsvtNo;
		this.rsvtHos = rsvtHos;
		this.rsvtDoc = rsvtDoc;
		this.rsvtMem = rsvtMem;
		this.rsvtDate = rsvtDate;
		this.rsvtTime = rsvtTime;
		this.memInfo = memInfo;
		this.rsvtMemNo = rsvtMemNo;
	}
	public int getRsvtNo() {
		return rsvtNo;
	}
	public void setRsvtNo(int rsvtNo) {
		this.rsvtNo = rsvtNo;
	}
	public String getRsvtHos() {
		return rsvtHos;
	}
	public void setRsvtHos(String rsvtHos) {
		this.rsvtHos = rsvtHos;
	}
	public String getRsvtDoc() {
		return rsvtDoc;
	}
	public void setRsvtDoc(String rsvtDoc) {
		this.rsvtDoc = rsvtDoc;
	}
	public String getRsvtMem() {
		return rsvtMem;
	}
	public void setRsvtMem(String rsvtMem) {
		this.rsvtMem = rsvtMem;
	}
	public String getRsvtDate() {
		return rsvtDate;
	}
	public void setRsvtDate(String rsvtDate) {
		this.rsvtDate = rsvtDate;
	}
	public String getRsvtTime() {
		return rsvtTime;
	}
	public void setRsvtTime(String rsvtTime) {
		this.rsvtTime = rsvtTime;
	}
	public String getMemInfo() {
		return memInfo;
	}
	public void setMemInfo(String memInfo) {
		this.memInfo = memInfo;
	}
	public int getRsvtMemNo() {
		return rsvtMemNo;
	}
	public void setRsvtMemNo(int rsvtMemNo) {
		this.rsvtMemNo = rsvtMemNo;
	}
	@Override
	public String toString() {
		return "MpReservation [rsvtNo=" + rsvtNo + ", rsvtHos=" + rsvtHos + ", rsvtDoc=" + rsvtDoc + ", rsvtMem="
				+ rsvtMem + ", rsvtDate=" + rsvtDate + ", rsvtTime=" + rsvtTime + ", memInfo=" + memInfo
				+ ", rsvtMemNo=" + rsvtMemNo + "]";
	}

}
