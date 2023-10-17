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
	
	public BoardDao() {
		String filePath = QuizeDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn, String type) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount") +
				" AND " + 
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
		System.out.println("selectListCount Dao listCount" + listCount);
		return listCount;
		
	}
	
	public ArrayList<Board> selectList(Connection conn, String type, PageInfo pi){
		
		
		ArrayList<Board> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList") + 
					" BOARD_TYPE = " +
					type + 
					" ORDER BY " + 
					"B.CREATE_DATE DESC " +
					") A ) " +
					"WHERE " + 
					"RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				// BOARD_TYPE이 NUMBER라서 (int)setBoardType에 담지 못해서 setBoardName으로 했음 
				// => (String)BoardTypeStr 만들었음 수정해야 함
				b.setBoardName(rset.getString("BOARD_TYPE")); 
				b.setWriter(rset.getString("NICKNAME"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setCreateDate(rset.getString("CREATE_DATE"));
				b.setViews(rset.getInt("VIEWS"));
				
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
	
	public int insertBoard(Connection conn, Board b, int memNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard") + b.getBoardName() + ")";
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Board selectBoard(Connection conn, int boardNo) {
		
		Board b = new Board();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			pstmt.setInt(2, boardNo);
			pstmt.setInt(3, boardNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setWriter(rset.getString("NICKNAME"));
				b.setMemNo(rset.getInt("MEM_NO"));
				b.setMemId(rset.getString("MEM_ID"));
				b.setBoardName(rset.getString("BOARD_NAME"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setCreateDate(rset.getString("CREATE_DATE"));
				b.setViews(rset.getInt("VIEWS"));
				b.setLikes(rset.getInt("LIKES"));
				b.setComments(rset.getInt("COMMENTS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
	
	public int deleteBoard(Connection conn, int boardNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateBoard(Connection conn, Board b) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardType());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setInt(4, b.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
