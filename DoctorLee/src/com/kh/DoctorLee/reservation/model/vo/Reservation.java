package com.kh.DoctorLee.reservation.model.vo;

public class Reservation {

	private int rsvtNo;
	private int rsvtHos;
	private int rsvtDoc;
	private int rsvtMem;
	private String rsvtDate;
	private String rsvtTime;
	private String memInfo;
	
	public Reservation() {
		super();
	}
	
	public Reservation(int rsvtNo, int rsvtHos, int rsvtDoc, int rsvtMem, String rsvtDate, String rsvtTime,
			String memInfo) {
		super();
		this.rsvtNo = rsvtNo;
		this.rsvtHos = rsvtHos;
		this.rsvtDoc = rsvtDoc;
		this.rsvtMem = rsvtMem;
		this.rsvtDate = rsvtDate;
		this.rsvtTime = rsvtTime;
		this.memInfo = memInfo;
	}
	public int getRsvtNo() {
		return rsvtNo;
	}
	public void setRsvtNo(int rsvtNo) {
		this.rsvtNo = rsvtNo;
	}
	public int getRsvtHos() {
		return rsvtHos;
	}
	public void setRsvtHos(int rsvtHos) {
		this.rsvtHos = rsvtHos;
	}
	public int getRsvtDoc() {
		return rsvtDoc;
	}
	public void setRsvtDoc(int rsvtDoc) {
		this.rsvtDoc = rsvtDoc;
	}
	public int getRsvtMem() {
		return rsvtMem;
	}
	public void setRsvtMem(int rsvtMem) {
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
	
	@Override
	public String toString() {
		return "Reservation [rsvtNo=" + rsvtNo + ", rsvtHos=" + rsvtHos + ", rsvtDoc=" + rsvtDoc + ", rsvtMem="
				+ rsvtMem + ", rsvtDate=" + rsvtDate + ", rsvtTime=" + rsvtTime + ", memInfo=" + memInfo + "]";
	}
	
}
