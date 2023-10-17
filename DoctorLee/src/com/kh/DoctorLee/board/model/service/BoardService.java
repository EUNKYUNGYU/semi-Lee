package com.kh.DoctorLee.board.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.commit;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;
import static com.kh.DoctorLee.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.board.model.dao.BoardDao;
import com.kh.DoctorLee.board.model.vo.Board;
import com.kh.DoctorLee.common.model.vo.PageInfo;

public class BoardService {

	public int selectListCount(String type) {
		
		Connection conn = getConnection();
		int listCount = new BoardDao().selectListCount(conn, type);
		close(conn);
		return listCount;
	}
		
	public ArrayList<Board> selectList(String type, PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectList(conn, type, pi);
		close(conn);
		return list;
		
	}
	
	public int insertBoard(Board b, int memNo) {
		
		Connection conn = getConnection();
		int result = new BoardDao().insertBoard(conn, b, memNo);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Board selectBoard(int boardNo) {

		Connection conn = getConnection();
		Board b = new BoardDao().selectBoard(conn, boardNo);
		close(conn);
		return b;
		
	}
	
	public int deleteBoard(int boardNo) {
		
		Connection conn = getConnection();
		int result = new BoardDao().deleteBoard(conn, boardNo);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	public int updateBoard(Board b) {
		
		Connection conn = getConnection();
		int result = new BoardDao().updateBoard(conn, b);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
}
