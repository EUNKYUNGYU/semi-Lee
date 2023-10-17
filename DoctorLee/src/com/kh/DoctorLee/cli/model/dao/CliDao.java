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
import com.kh.DoctorLee.cli.model.vo.CliRes;
import com.kh.DoctorLee.cli.model.vo.CliResTime;
import com.kh.DoctorLee.cli.model.vo.CliRev;
import com.kh.DoctorLee.cli.model.vo.Clinic;
import com.kh.DoctorLee.member.model.vo.Member;

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
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Clinic c = new Clinic();
				c.setScope(rset.getDouble("ROUND(AVG(CLI_SCOPE),1)"));
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
				c.setCliNo(rset.getInt("CLI_NO"));
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
	public ArrayList<CliResTime> selectResDate(Connection conn, int cliNo){

		ArrayList<CliResTime> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectResDate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cliNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				CliResTime ct = new CliResTime();
				ct.setCliDate(rset.getString("CLI_DATE"));
				list.add(ct);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 클리닉 예약 가능 시간 가져오기
	public ArrayList<CliResTime> selectCliTimeList(Connection conn, int cliNo, String resDate){
		ArrayList<CliResTime> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCliTimeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cliNo);
			pstmt.setString(2, resDate);
			pstmt.setInt(3, cliNo);
			pstmt.setString(4, resDate);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				CliResTime c = new CliResTime();
				c.setTimeNo(rset.getInt("TIME_NO"));
				c.setCliNo(rset.getInt("CLI_NO"));
				c.setCliTime(rset.getString("CLI_TIME"));
				c.setCliDate(rset.getString("CLI_DATE"));
				
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
	
	// 클리닉 예약
	public int insertCliRes(Connection conn, CliRes c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCliRes");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, c.getMemNo());
			pstmt.setInt(2, c.getCliNo());
			pstmt.setString(3, c.getResDate());
			pstmt.setString(4, c.getResTime());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 클리닉 예약자 정보 불러오기
	public int selectResMem(Connection conn, int cliNo, Member loginUser){
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectResMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cliNo);
			pstmt.setInt(2, loginUser.getMemNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	// 클리닉 리뷰 작성하기
	public int insertCliRev(Connection conn, CliRev c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCliRev");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, c.getCliNo());
			pstmt.setInt(2, c.getMemNo());
			pstmt.setString(3, c.getRevContent());
			pstmt.setInt(4, c.getCliScope());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 클리닉 평점 가져오기
	public Double selectCliScope(Connection conn, int cliNo) {
		
		Double scope = 0.0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCliScope");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cliNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				scope = rset.getDouble("ROUND(AVG(CLI_SCOPE),1)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return scope;
	}
	
	// 클리닉 리뷰 가져오기
	public ArrayList<CliRev> selectCliRevList(Connection conn, int cliNo){
		
		ArrayList<CliRev> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCliRevList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cliNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				CliRev c = new CliRev();
				c.setRevNo(rset.getInt("REV_NO"));
				c.setCliNo(rset.getInt("CLI_NO"));
				c.setNickName(rset.getString("NICKNAME"));
				c.setRevContent(rset.getString("REV_CONTENT"));
				c.setCreateDate(rset.getString("CREATE_DATE"));
				c.setCliScope(rset.getInt("CLI_SCOPE"));
				
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
	
	// 한 사람 당 한 번만 리뷰 작성 가능하게
	public int selectRevCount(Connection conn, int cliNo, Member loginUser) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRevCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cliNo);
			pstmt.setInt(2, loginUser.getMemNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

}
