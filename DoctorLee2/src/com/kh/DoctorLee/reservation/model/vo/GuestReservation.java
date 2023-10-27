package com.kh.DoctorLee.reservation.model.vo;

public class GuestReservation {

	private int guestRsvtNo;
	private String guestRsvtDate;
	private String guestRsvtTime;
	private String guestRsvtHos;
	private String guestRsvtInfo;
	private String rsvtGuest;
	private String guestRsvtDoc;
	
	public GuestReservation() {
		super();
	}
	
	public GuestReservation(int guestRsvtNo, String guestRsvtDate, String guestRsvtTime, String guestRsvtHos,
			String guestRsvtInfo, String rsvtGuest, String guestRsvtDoc) {
		super();
		this.guestRsvtNo = guestRsvtNo;
		this.guestRsvtDate = guestRsvtDate;
		this.guestRsvtTime = guestRsvtTime;
		this.guestRsvtHos = guestRsvtHos;
		this.guestRsvtInfo = guestRsvtInfo;
		this.rsvtGuest = rsvtGuest;
		this.guestRsvtDoc = guestRsvtDoc;
	}
	
	public int getGuestRsvtNo() {
		return guestRsvtNo;
	}
	public void setGuestRsvtNo(int guestRsvtNo) {
		this.guestRsvtNo = guestRsvtNo;
	}
	public String getGuestRsvtDate() {
		return guestRsvtDate;
	}
	public void setGuestRsvtDate(String guestRsvtDate) {
		this.guestRsvtDate = guestRsvtDate;
	}
	public String getGuestRsvtTime() {
		return guestRsvtTime;
	}
	public void setGuestRsvtTime(String guestRsvtTime) {
		this.guestRsvtTime = guestRsvtTime;
	}
	public String getGuestRsvtHos() {
		return guestRsvtHos;
	}
	public void setGuestRsvtHos(String guestRsvtHos) {
		this.guestRsvtHos = guestRsvtHos;
	}
	public String getGuestRsvtInfo() {
		return guestRsvtInfo;
	}
	public void setGuestRsvtInfo(String guestRsvtInfo) {
		this.guestRsvtInfo = guestRsvtInfo;
	}
	public String getRsvtGuest() {
		return rsvtGuest;
	}
	public void setRsvtGuest(String rsvtGuest) {
		this.rsvtGuest = rsvtGuest;
	}
	public String getGuestRsvtDoc() {
		return guestRsvtDoc;
	}
	public void setGuestRsvtDoc(String guestRsvtDoc) {
		this.guestRsvtDoc = guestRsvtDoc;
	}
	
	@Override
	public String toString() {
		return "GuestReservation [guestRsvtNo=" + guestRsvtNo + ", guestRsvtDate=" + guestRsvtDate + ", guestRsvtTime="
				+ guestRsvtTime + ", guestRsvtHos=" + guestRsvtHos + ", guestRsvtInfo=" + guestRsvtInfo + ", rsvtGuest="
				+ rsvtGuest + ", guestRsvtDoc=" + guestRsvtDoc + "]";
	}
	
}
