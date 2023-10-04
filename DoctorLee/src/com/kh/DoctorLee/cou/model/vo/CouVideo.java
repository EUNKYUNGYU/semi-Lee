package com.kh.DoctorLee.cou.model.vo;

public class CouVideo {
	private int videoNo;
	private int memNo;
	private String videoTitle;
	private String channelName;
	private String videoAddress;
	
	public CouVideo() {
		super();
	}
	
	public CouVideo(int videoNo, int memNo, String videoTitle, String channelName, String videoAddress) {
		super();
		this.videoNo = videoNo;
		this.memNo = memNo;
		this.videoTitle = videoTitle;
		this.channelName = channelName;
		this.videoAddress = videoAddress;
	}
	
	public int getVideoNo() {
		return videoNo;
	}
	
	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}
	
	public int getMemNo() {
		return memNo;
	}
	
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	
	public String getVideoTitle() {
		return videoTitle;
	}
	
	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}
	
	public String getChannelName() {
		return channelName;
	}
	
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	
	public String getVideoAddress() {
		return videoAddress;
	}
	
	public void setVideoAddress(String videoAddress) {
		this.videoAddress = videoAddress;
	}
	
	@Override
	public String toString() {
		return "CouVideo [videoNo=" + videoNo + ", memNo=" + memNo + ", videoTitle=" + videoTitle + ", channelName="
				+ channelName + ", videoAddress=" + videoAddress + "]";
	}

}
