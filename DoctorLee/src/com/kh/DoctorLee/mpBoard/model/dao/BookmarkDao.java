package com.kh.DoctorLee.mpBoard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

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
	public void selectHospital(Connection conn,String searchContent) {
		ArrayList<Hospital> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHospital");
		
		
	}
}
