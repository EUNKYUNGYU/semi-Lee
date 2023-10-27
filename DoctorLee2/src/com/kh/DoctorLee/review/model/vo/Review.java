package com.kh.DoctorLee.review.model.vo;

import java.sql.Date;

/**
 * @author jULIA
 *
 */
public class Review {
	private int reviewNo; // REVIEW_NO	NUMBER
	private int reviewHos; // REVIEW_HOS	NUMBER
	private String reviewWriter; // REVIEW_WRITER	NUMBER
	private String content; // CONTENT	VARCHAR2(4000 BYTE)
	private int scope; // SCOPE	NUMBER
	private Date createDate; // CREATE_DATE	DATE
	private String status; // STATUS	VARCHAR2(1 BYTE)
	
	public Review() {
		super();
	}

	public Review(int reviewNo, int reviewHos, String reviewWriter, String content, int scope, Date createDate,
			String status) {
		super();
		this.reviewNo = reviewNo;
		this.reviewHos = reviewHos;
		this.reviewWriter = reviewWriter;
		this.content = content;
		this.scope = scope;
		this.createDate = createDate;
		this.status = status;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getReviewHos() {
		return reviewHos;
	}

	public void setReviewHos(int reviewHos) {
		this.reviewHos = reviewHos;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getScope() {
		return scope;
	}

	public void setScope(int scope) {
		this.scope = scope;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
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
		return "Review [reviewNo=" + reviewNo + ", reviewHos=" + reviewHos + ", reviewWriter=" + reviewWriter
				+ ", content=" + content + ", scope=" + scope + ", createDate=" + createDate + ", status=" + status
				+ "]";
	}

}
