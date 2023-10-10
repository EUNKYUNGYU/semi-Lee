package com.kh.DoctorLee.cli.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.cli.model.vo.Category;
import static com.kh.DoctorLee.common.JDBCTemplate.*;

public class CliDao {
	
	private Properties prop = new Properties();
	
	public CliDao() {
		String filePath = CliDao.class.getResource("/sql/cli/cli-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Category> selectCategoryList(Connection conn) {
		ArrayList<Category> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(rset.getInt("CATE_NO"),
									  rset.getString("CLI_CATE")));
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
