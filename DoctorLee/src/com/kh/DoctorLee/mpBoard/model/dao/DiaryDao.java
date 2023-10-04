package com.kh.DoctorLee.mpBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.DoctorLee.common.JDBCTemplate;
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
				pstmt.setString(1, md.getDiaryTitle());
				pstmt.setString(2, md.getDiaryContent());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
				
			}
			return result;
			
			
		}
	
}
