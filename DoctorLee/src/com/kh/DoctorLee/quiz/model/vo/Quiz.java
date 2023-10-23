package com.kh.DoctorLee.quiz.model.vo;

public class Quiz {

	private int quizNo;
	private String quizTitle;
	private String quizContent;
	private String createDate;
	private String endDate;
	private String deadline;
	private int vote;
	private String choice1;
	private String choice2;
	private String choice3;
	private String choice4;
	private int answer;
	
	public Quiz() {
		super();
	}

	public Quiz(int quizNo, String quizTitle, String quizContent, String createDate, String endDate,
			String deadline, int vote, String choice1, String choice2, String choice3, String choice4, int answer) {
		super();
		this.quizNo = quizNo;
		this.quizTitle = quizTitle;
		this.quizContent = quizContent;
		this.createDate = createDate;
		this.endDate = endDate;
		this.deadline = deadline;
		this.vote = vote;
		this.choice1 = choice1;
		this.choice2 = choice2;
		this.choice3 = choice3;
		this.choice4 = choice4;
		this.answer = answer;
	}


	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}


	public int getQuizNo() {
		return quizNo;
	}

	public void setQuizNo(int quizNo) {
		this.quizNo = quizNo;
	}


	public String getQuizTitle() {
		return quizTitle;
	}


	public void setQuizTitle(String quizTitle) {
		this.quizTitle = quizTitle;
	}

	public String getQuizContent() {
		return quizContent;
	}


	public void setQuizContent(String quizContent) {
		this.quizContent = quizContent;
	}


	public String getCreateDate() {
		return createDate;
	}


	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getVote() {
		return vote;
	}


	public void setVote(int vote) {
		this.vote = vote;
	}


	public String getChoice1() {
		return choice1;
	}





	public void setChoice1(String choice1) {
		this.choice1 = choice1;
	}





	public String getChoice2() {
		return choice2;
	}





	public void setChoice2(String choice2) {
		this.choice2 = choice2;
	}





	public String getChoice3() {
		return choice3;
	}





	public void setChoice3(String choice3) {
		this.choice3 = choice3;
	}





	public String getChoice4() {
		return choice4;
	}





	public void setChoice4(String choice4) {
		this.choice4 = choice4;
	}





	public int getAnswer() {
		return answer;
	}





	public void setAnswer(int answer) {
		this.answer = answer;
	}


	@Override
	public String toString() {
		return "Quiz [quizNo=" + quizNo + ", quizTitle=" + quizTitle + ", quizContent=" + quizContent
				+ ", createDate=" + createDate + ", endDate=" + endDate + ", deadline=" + deadline + ", vote=" + vote
				+ ", choice1=" + choice1 + ", choice2=" + choice2 + ", choice3=" + choice3 + ", choice4=" + choice4
				+ ", answer=" + answer + "]";
	}

	
}
