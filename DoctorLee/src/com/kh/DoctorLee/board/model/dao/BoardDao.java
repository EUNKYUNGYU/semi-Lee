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
import com.kh.DoctorLee.quize.model.dao.QuizeDao;
import com.kh.DoctorLee.quize.model.vo.Quize;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String filePath = QuizeDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Board> selectBoard(Connection conn){
		
		
		ArrayList<Board> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
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

}
