package com.kh.DoctorLee.mpBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.member.model.vo.Member;
import com.kh.DoctorLee.mpBoard.model.vo.FamDiary;
import com.kh.DoctorLee.mpBoard.model.vo.MyDiary;

	public class DiaryDao {
		private Properties prop = new Properties();
		public DiaryDao() {
			String fileName = DiaryDao.class.getResource("/sql/diary/diary-mapper.xml").getPath();
			try {
				prop.loadFromXML(new FileInputStream(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		public int insertMyDiary(Connection conn,MyDiary md) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertDiary");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, md.getMemNo());
				pstmt.setString(2, md.getDiaryTitle());
				pstmt.setString(3, md.getDiaryContent());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
				
			}
			return result;
			
			
		}
		public int insertFamDiary(Connection conn,FamDiary fd) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertFamDiary");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, fd.getFamDirTitle());
				pstmt.setString(2, fd.getFamDirContent());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(pstmt);
			}
			
			
			return result;
		}
		public ArrayList<MyDiary> selectMyDiary(Connection conn) {
			ArrayList<MyDiary> list = new ArrayList();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectMyDiaryList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				Member loginUser = new Member();
				pstmt.setInt(1, loginUser.getMemNo());
				System.out.println(loginUser.getMemNo());
				rset = pstmt.executeQuery();
				
				
				while(rset.next()) {
					MyDiary md = new MyDiary();
					md.setDiaryNo(rset.getInt("DIARY_NO"));
					md.setDiaryTitle(rset.getString("DIARY_TITLE"));
					md.setCreateDate(rset.getDate("CREATE_DATE"));
					list.add(md);
					
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return list;
			
			
		}
		public ArrayList<FamDiary> selectFamDiary(Connection conn){
			ArrayList<FamDiary> famList = new ArrayList();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectFamDiaryList");
			
			try {
				pstmt=conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					FamDiary fd = new FamDiary();
					fd.setFamDirNo(rset.getInt("FAM_DIR_NO"));
					fd.setFamDirTitle(rset.getString("FAM_DIR_TITLE"));
					fd.setCreateDate(rset.getDate("CREATE_DATE"));
					famList.add(fd);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return famList;
		}
	
}
