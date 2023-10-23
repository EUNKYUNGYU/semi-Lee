package com.kh.DoctorLee.quiz.model.vo;

public class QuizChoice {
	
	private int quizNo;
	private int memNo;
	private int choice;
	
	
	public QuizChoice() {
		super();
	}


	public QuizChoice(int quizNo, int memNo, int choice) {
		super();
		this.quizNo = quizNo;
		this.memNo = memNo;
		this.choice = choice;
	}


	public int getQuizNo() {
		return quizNo;
	}


	public void setQuizNo(int quizNo) {
		this.quizNo = quizNo;
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
		return "QuizChoice [quizNo=" + quizNo + ", memNo=" + memNo + ", choice=" + choice + "]";
	}
	
	

}
