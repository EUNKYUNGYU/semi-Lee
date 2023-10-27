package com.kh.DoctorLee.comment.model.dao;

import static com.kh.DoctorLee.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.comment.model.vo.Comment;
import com.kh.DoctorLee.quize.model.dao.QuizeDao;

public class CommentDao {

	private Properties prop = new Properties();
	
	public CommentDao() {
		String filePath = QuizeDao.class.getResource("/sql/comment/comment-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
		
	public ArrayList<Comment> selectCommentList(Connection conn, int boardNo){
			
			
			ArrayList<Comment> list = new ArrayList();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectCommentList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, boardNo);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					
					Comment c = new Comment();
					c.setCommentNo(rset.getInt("COMMENT_NO"));
					c.setWriter(rset.getString("NICKNAME")); 
					c.setCommentContent(rset.getString("COMMENT_CONTENT"));
					c.setCreateDate(rset.getString("CREATE_DATE"));
					list.add(c);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
			
		}
	
		public int insertComment(Connection conn, Comment c) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertComment");
			
			try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, c.getBoardNo());
				pstmt.setInt(2, Integer.parseInt(c.getWriter()));
				pstmt.setString(3, c.getCommentContent());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
			
		}
	
}
