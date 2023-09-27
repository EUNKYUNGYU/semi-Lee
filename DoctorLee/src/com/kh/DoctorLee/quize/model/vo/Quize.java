package com.kh.DoctorLee.quize.model.vo;

public class Quize {

	private int quizeNo;
	private String quizeTitle;
	private String quizeContent;
	private String createDate;
	private String endDate;
	private int vote;
	private String choice1;
	private String choice2;
	private String choice3;
	private String choice4;
	private int answer;
	
	
	
	
	
	public Quize() {
		super();
	}





	public Quize(int quizeNo, String quizeTitle, String quizeContent, String createDate, String endDate, int vote,
			String choice1, String choice2, String choice3, String choice4, int answer) {
		super();
		this.quizeNo = quizeNo;
		this.quizeTitle = quizeTitle;
		this.quizeContent = quizeContent;
		this.createDate = createDate;
		this.endDate = endDate;
		this.vote = vote;
		this.choice1 = choice1;
		this.choice2 = choice2;
		this.choice3 = choice3;
		this.choice4 = choice4;
		this.answer = answer;
	}





	public int getQuizeNo() {
		return quizeNo;
	}





	public void setQuizeNo(int quizeNo) {
		this.quizeNo = quizeNo;
	}





	public String getQuizeTitle() {
		return quizeTitle;
	}





	public void setQuizeTitle(String quizeTitle) {
		this.quizeTitle = quizeTitle;
	}





	public String getQuizeContent() {
		return quizeContent;
	}





	public void setQuizeContent(String quizeContent) {
		this.quizeContent = quizeContent;
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
		return "Quize [quizeNo=" + quizeNo + ", quizeTitle=" + quizeTitle + ", quizeContent=" + quizeContent
				+ ", createDate=" + createDate + ", endDate=" + endDate + ", vote=" + vote + ", choice1=" + choice1
				+ ", choice2=" + choice2 + ", choice3=" + choice3 + ", choice4=" + choice4 + ", answer=" + answer + "]";
	}
	
	
	
	
	
	
}
