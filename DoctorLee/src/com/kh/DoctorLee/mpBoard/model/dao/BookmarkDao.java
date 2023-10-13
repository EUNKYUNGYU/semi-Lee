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
import com.kh.DoctorLee.hospital.model.vo.Hospital;

public class BookmarkDao {
	private Properties prop = new Properties();
	public BookmarkDao() {
		String fileName = DiaryDao.class.getResource("/sql/bookmark/bookmark-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Hospital> selectHospital(Connection conn,String hosName) {
		ArrayList<Hospital> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHospital");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hosName);
			//System.out.println(hosName);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Hospital hos = new Hospital();
				hos.setHosName(rset.getString("HOS_NAME"));
				list.add(hos);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
		
	}
	public Hospital selectHosWord(Connection conn,String hosnameWord) {
		Hospital hos = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectWord");
		
		try {
			//System.out.println(hosnameWord);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hosnameWord);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				hos = new Hospital();
				hos.setHosName(rset.getString("HOS_NAME"));
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return hos;
	}
}
