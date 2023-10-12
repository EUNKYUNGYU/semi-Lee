package com.kh.DoctorLee.cli.model.dao;

import static com.kh.DoctorLee.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.cli.model.vo.Category;
import com.kh.DoctorLee.cli.model.vo.CliResDate;
import com.kh.DoctorLee.cli.model.vo.Clinic;

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
	
	public ArrayList<Clinic> selectCliList(Connection conn, int cateNo){
		
		ArrayList<Clinic> cliList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCliList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cateNo);
			
			//System.out.println(cateName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Clinic c = new Clinic();
				c.setCliNo(rset.getInt("CLI_NO"));
				c.setHosNo(rset.getString("HOS_NAME"));
				c.setCateName(rset.getString("CLI_CATE"));
				c.setCliName(rset.getString("CLI_NAME"));
				c.setCliPrice(rset.getString("CLI_PRICE"));
				c.setOriginName(rset.getString("ORIGIN_NAME"));
				c.setChangeName(rset.getString("CHANGE_NAME"));
				c.setDesPath(rset.getString("DES_PATH"));
				
				cliList.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return cliList;
	}
	
	public Clinic selectCli(Connection conn, int cliNo) {
		
		Clinic c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCli");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cliNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Clinic();
				c.setHosNo(rset.getString("HOS_NAME"));
				c.setCateName(rset.getString("CLI_CATE"));
				c.setCliName(rset.getString("CLI_NAME"));
				c.setCliPrice(rset.getString("CLI_PRICE"));
				c.setOriginName(rset.getString("ORIGIN_NAME"));
				c.setChangeName(rset.getString("CHANGE_NAME"));
				c.setDesPath(rset.getString("DES_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}
	
	// 클리닉 예약 가능 날짜 가져오기
	public ArrayList<CliResDate> selectCliDateList(Connection conn, int cliNo){
		
		ArrayList<CliResDate> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCliDateList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cliNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				CliResDate c = new CliResDate();
				c.setDateNo(rset.getInt("DATE_NO"));
				c.setCliNo(rset.getInt("CLI_NO"));
				c.setCliDate(rset.getDate("CLI_DATE"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return list;
		
	}

}
