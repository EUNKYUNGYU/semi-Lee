package com.kh.DoctorLee.quize.model.vo;

public class QuizeChoice {

	private int quizeNo;
	private int memNo;
	private int choice;
	
	
	
	public QuizeChoice() {
		super();
	}



	public QuizeChoice(int quizeNo, int memNo, int choice) {
		super();
		this.quizeNo = quizeNo;
		this.memNo = memNo;
		this.choice = choice;
	}



	public int getQuizeNo() {
		return quizeNo;
	}



	public void setQuizeNo(int quizeNo) {
		this.quizeNo = quizeNo;
	}



	public int getMemNo() {
		return memNo;
	}



	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}



	public int getChoice() {
		return choice;
	}



	public void setChoice(int choice) {
		this.choice = choice;
	}



	@Override
	public String toString() {
		return "QuizeChoice [quizeNo=" + quizeNo + ", memNo=" + memNo + ", choice=" + choice + "]";
	}
	
	
	
	
	
	
}
