package com.kh.DoctorLee.quize.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.quize.model.vo.Quize;

public class QuizeDao {

	private Properties prop = new Properties();
	
	public QuizeDao() {
		String filePath = QuizeDao.class.getResource("/sql/quize/quize-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Quize> selectList(Connection conn){
		
		ArrayList<Quize> list = new ArrayList();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectList");
		
		
		
		
		return list;
		
	}
}

