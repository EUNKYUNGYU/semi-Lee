package com.kh.DoctorLee.board.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.board.model.dao.BoardDao;
import com.kh.DoctorLee.board.model.vo.Board;

public class BoardService {

	public ArrayList<Board> selectList(){
		
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectList(conn);
		close(conn);
		return list;
		
	}
	
	public Board selectBoard(int boardNo) {
		
		Connection conn = getConnection();
		Board b = new BoardDao().selectBoard(conn, boardNo);
		close(conn);
		return b;
		
	}
	
	
}
