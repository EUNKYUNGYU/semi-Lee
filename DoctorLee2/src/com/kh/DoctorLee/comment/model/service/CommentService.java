package com.kh.DoctorLee.comment.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.comment.model.dao.CommentDao;
import com.kh.DoctorLee.comment.model.vo.Comment;

public class CommentService {
	
	public ArrayList<Comment> selectCommentList(int boardNo){
		
		Connection conn = getConnection();
		ArrayList<Comment> list = new CommentDao().selectCommentList(conn, boardNo);
		close(conn);
		return list;
	}
	
	public int insertComment(Comment c) {
		Connection conn = getConnection();
		int result = new CommentDao().insertComment(conn, c);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	

}
