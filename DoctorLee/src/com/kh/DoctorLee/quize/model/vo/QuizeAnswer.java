package com.kh.DoctorLee.quize.model.vo;

public class QuizeAnswer {

	private int quizeNo;
	private int answer;
	private String answerDetail;
	private String quizeTitle;
	
			
	public QuizeAnswer() {
		super();
	}



	public QuizeAnswer(int quizeNo, int answer, String answerDetail) {
		super();
		this.quizeNo = quizeNo;
		this.answer = answer;
		this.answerDetail = answerDetail;
	}


	

	public String getQuizeTitle() {
		return quizeTitle;
	}



	public void setQuizeTitle(String quizeTitle) {
		this.quizeTitle = quizeTitle;
	}



	public int getQuizeNo() {
		return quizeNo;
	}



	public void setQuizeNo(int quizeNo) {
		this.quizeNo = quizeNo;
	}



	public int getAnswer() {
		return answer;
	}



	public void setAnswer(int answer) {
		this.answer = answer;
	}



	public String getAnswerDetail() {
		return answerDetail;
	}



	public void setAnswerDetail(String answerDetail) {
		this.answerDetail = answerDetail;
	}



	@Override
	public String toString() {
		return "QuizeAnswer [quizeNo=" + quizeNo + ", answer=" + answer + ", answerDetail=" + answerDetail + "]";
	}
	
	
	
	
	
}
