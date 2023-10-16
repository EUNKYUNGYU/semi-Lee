package com.kh.DoctorLee.board.model.dao;

import static com.kh.DoctorLee.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.board.model.vo.Board;
import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.quize.model.dao.QuizeDao;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public int selectListCount(Connection conn, String type) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount") +
					"AND " + 
					"BOARD_TYPE = " +
					type;
					 
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public BoardDao() {
		String filePath = QuizeDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Board> selectList(Connection conn, String type, PageInfo pi){
		
		
		ArrayList<Board> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList") + 
					"AND " + 
					"BOARD_TYPE = ? " +
					"ORDER BY " + 
					"B.CREATE_DATE DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setCreateDate(rset.getString("CREATE_DATE"));
				b.setViews(rset.getInt("VIEWS"));
				b.setFileNo(rset.getString("FILE_NO"));
				b.setBoardName(rset.getString("BOARD_NAME"));
				
				list.add(b);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public Board selectBoard(Connection conn, String type, int boardNo) {
		
		Board b = new Board();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoard");
		
		
		return b;
		
		
	}

}
