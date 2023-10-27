package com.kh.DoctorLee.comment.model.vo;

public class Comment {

	private int CommentNo;
	private int boardNo;
	private int topCommentNo;
	private String writer;
	private String commentContent;
	private String createDate;
	private String status;
	public Comment(int commentNo, int boardNo, int topCommentNo, String writer, String commentContent, String createDate,
			String status) {
		super();
		CommentNo = commentNo;
		this.boardNo = boardNo;
		this.topCommentNo = topCommentNo;
		this.writer = writer;
		this.commentContent = commentContent;
		this.createDate = createDate;
		this.status = status;
	}
	public Comment() {
		super();
	}
	public int getCommentNo() {
		return CommentNo;
	}
	public void setCommentNo(int commentNo) {
		CommentNo = commentNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getTopCommentNo() {
		return topCommentNo;
	}
	public void setTopCommentNo(int topCommentNo) {
		this.topCommentNo = topCommentNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Comment [CommentNo=" + CommentNo + ", boardNo=" + boardNo + ", topCommentNo=" + topCommentNo
				+ ", writer=" + writer + ", commentContent=" + commentContent + ", createDate=" + createDate
				+ ", status=" + status + "]";
	}
	
	
	
}
