package com.kh.DoctorLee.board.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.board.model.dao.BoardDao;
import com.kh.DoctorLee.board.model.vo.Board;

public class BoardService {

	public ArrayList<Board> selectBoard(){
		
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectBoard(conn);
		close(conn);
		return list;
		
	}
	
	
}
