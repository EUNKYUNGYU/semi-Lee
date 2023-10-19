package com.kh.DoctorLee.board.model.vo;

public class Board {

	private int boardNo;
	private int boardType; // 10 / 20 / 30 / 40 / 50
	private int memNo;
	private String writer;
	private String memId; // 작성자 닉네임 클릭 했을 시 해당 사용자의 id가 보이게 하기 위해 만든 필드
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private int views;
	private int likes; // 추천 수를 저장하기 위한 필드
	private int comments; // 댓글 수를 저장하기 위한 필드 
	private String status;
	private String fileNo; // 테이블에서 삭제한 컬럼인데 일단 삭제 안 함, 나중에 필요없으면 삭제하기
	private String boardName; // 공지사항 / 자유게시판 / 정보게시판 / 익명게시판 / 건강매거진
	private String boardTypeStr; // 보드타입을 쿼리 스트링으로 받으면 String타입이라 따로 저장 할 변수가 필요해서 만들었음
	private int likeMem; // 게시글을 조회 할 때 조회 한 해당 유저가 좋아요를 했는지 알기 위해 선언한 필드, 좋아요 했으면 1, 안 했으면 0
	
	public Board() {
		super();
	}



	public Board(int boardNo, int boardType, int memNo, String writer, String memId, String boardTitle,
			String boardContent, String createDate, int views, int likes, int comments, String status, String fileNo,
			String boardName, String boardTypeStr, int likeMem) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.memNo = memNo;
		this.writer = writer;
		this.memId = memId;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.views = views;
		this.likes = likes;
		this.comments = comments;
		this.status = status;
		this.fileNo = fileNo;
		this.boardName = boardName;
		this.boardTypeStr = boardTypeStr;
		this.likeMem = likeMem;
	}


	

	public int getLikeMem() {
		return likeMem;
	}



	public void setLikeMem(int likeMem) {
		this.likeMem = likeMem;
	}



	public int getMemNo() {
		return memNo;
	}




	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}




	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getBoardTypeStr() {
		return boardTypeStr;
	}



	public void setBoardTypeStr(String boardTypeStr) {
		this.boardTypeStr = boardTypeStr;
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
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", memNo=" + memNo + ", writer=" + writer
				+ ", memId=" + memId + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", createDate="
				+ createDate + ", views=" + views + ", likes=" + likes + ", comments=" + comments + ", status=" + status
				+ ", fileNo=" + fileNo + ", boardName=" + boardName + ", boardTypeStr=" + boardTypeStr + ", likeMem="
				+ likeMem + "]";
	}





	

}
