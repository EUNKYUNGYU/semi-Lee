package com.kh.DoctorLee.board.model.vo;

public class Board {

	private int boardNo;
	private int boardType;
	private String writer;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private int views;
	private int likes;
	private int comments;
	private String status;
	private String fileNo;
	private String boardName;
	
	
	
	public Board() {
		super();
	}





	public Board(int boardNo, int boardType, String writer, String boardTitle, String boardContent, String createDate,
			int views, int likes, int comments, String status, String fileNo, String boardName) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.writer = writer;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.views = views;
		this.likes = likes;
		this.comments = comments;
		this.status = status;
		this.fileNo = fileNo;
		this.boardName = boardName;
	}



	


	public int getLikes() {
		return likes;
	}





	public void setLikes(int likes) {
		this.likes = likes;
	}





	public int getComments() {
		return comments;
	}





	public void setComments(int comments) {
		this.comments = comments;
	}





	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public int getBoardType() {
		return boardType;
	}



	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public String getBoardTitle() {
		return boardTitle;
	}



	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}



	public String getBoardContent() {
		return boardContent;
	}



	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}



	public String getCreateDate() {
		return createDate;
	}



	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}



	public int getViews() {
		return views;
	}



	public void setViews(int views) {
		this.views = views;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getFileNo() {
		return fileNo;
	}



	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}



	public String getBoardName() {
		return boardName;
	}



	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}





	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", writer=" + writer + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", createDate=" + createDate + ", views=" + views
				+ ", likes=" + likes + ", comments=" + comments + ", status=" + status + ", fileNo=" + fileNo
				+ ", boardName=" + boardName + "]";
	}



	
	
	
	

}
