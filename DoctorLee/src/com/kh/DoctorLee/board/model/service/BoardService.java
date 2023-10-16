package com.kh.DoctorLee.board.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.board.model.dao.BoardDao;
import com.kh.DoctorLee.board.model.vo.Board;
import com.kh.DoctorLee.message.model.dao.MessageDao;

public class BoardService {

	public int selectListCount(String type) {
		
		Connection conn = getConnection();
		int listCount = new BoardDao().selectListCount(conn, type);
		close(conn);
		return listCount;
	}
		
	public ArrayList<Board> selectList(String type){
		
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectList(conn, type);
		close(conn);
		return list;
		
	}
	
	public Board selectBoard(String type, int boardNo) {
		
		Connection conn = getConnection();
		Board b = new BoardDao().selectBoard(conn, type, boardNo);
		close(conn);
		return b;
		
	}
	
	
}
