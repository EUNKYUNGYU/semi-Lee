package com.kh.DoctorLee.quize.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.DoctorLee.common.JDBCTemplate.*;
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
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
				Quize q = new Quize();
				q.setQuizeNo(rset.getInt("QUIZE_NO"));
				q.setQuizeTitle(rset.getString("QUIZE_TITLE"));
				q.setQuizeContent(rset.getString("QUIZE_CONTENT"));
				q.setVote(rset.getInt("VOTE"));
				q.setCreateDate(rset.getString("CREATE_DATE"));
				q.setDeadline(rset.getString("DEADLINE"));
				q.setChoice1(rset.getString("CHOICE1"));
				q.setChoice2(rset.getString("CHOICE2"));
				q.setChoice3(rset.getString("CHOICE3"));
				q.setChoice4(rset.getString("CHOICE4"));
				
				list.add(q);
				
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
