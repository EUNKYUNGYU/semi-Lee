package com.kh.DoctorLee.quiz.model.vo;

public class QuizAnswer {

	private int quizNo;
	private int answer;
	private String answerDetail;
	private String quizTitle;
	
			
	public QuizAnswer() {
		super();
	}



	public QuizAnswer(int quizNo, int answer, String answerDetail) {
		super();
		this.quizNo = quizNo;
		this.answer = answer;
		this.answerDetail = answerDetail;
	}


	

	public String getQuizTitle() {
		return quizTitle;
	}



	public void setQuizTitle(String quizTitle) {
		this.quizTitle = quizTitle;
	}



	public int getQuizNo() {
		return quizNo;
	}



	public void setQuizNo(int quizNo) {
		this.quizNo = quizNo;
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
		return "QuizAnswer [quizNo=" + quizNo + ", answer=" + answer + ", answerDetail=" + answerDetail + "]";
	}
	
	
	
	
	
}
