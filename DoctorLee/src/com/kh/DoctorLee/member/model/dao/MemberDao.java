package com.kh.DoctorLee.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.member.model.vo.Member;


public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String file = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		//System.out.println(file);
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String memId, String memPwd) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("MEM_NO"),
								rset.getString("MEM_ID"),
								rset.getString("MEM_PWD"),
								rset.getString("MEM_NAME"),
								rset.getString("NICKNAME"),
								rset.getString("PHONE"),
								rset.getString("INUM"),
								rset.getString("EMAIL"),
								rset.getString("GENDER"),
								rset.getInt("HEIGHT"),
								rset.getInt("WEIGHT"),
								rset.getInt("POINT"),
								rset.getDate("CREATE_DATE"),
								rset.getDate("MODIFY_DATE"),
								rset.getString("STATUS"),
								rset.getString("DISEASES"),
								rset.getString("INHALE_ALL"),
								rset.getString("FOOD_ALL"));
				//System.out.println(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return m;
		
	}
	
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		System.out.println(m);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPwd());
			pstmt.setString(3, m.getMemName());
			pstmt.setString(4, m.getNickName());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getINum());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getGender());
			pstmt.setInt(9, m.getHeight());
			pstmt.setInt(10, m.getWeight());
			pstmt.setString(11, m.getDiseases());
			pstmt.setString(12, m.getInhaleAll());
			pstmt.setString(13, m.getFoodAll());
		
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getMemName());
			pstmt.setString(2, m.getNickName());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getEmail());
			pstmt.setInt(5, m.getHeight());
			pstmt.setInt(6, m.getWeight());
			pstmt.setString(7, m.getDiseases());
			pstmt.setString(8, m.getInhaleAll());
			pstmt.setString(9, m.getFoodAll());
			pstmt.setString(10, m.getMemId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	
	public Member selectMember(Connection conn, String memId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("MEM_NO"),
							   rset.getString("MEM_ID"),
							   rset.getString("MEM_PWD"),
							   rset.getString("MEM_NAME"),
							   rset.getString("NICKNAME"),
							   rset.getString("PHONE"),
							   rset.getString("INUM"),
							   rset.getString("EMAIL"),
							   rset.getString("GENDER"),
							   rset.getInt("HEIGHT"),
							   rset.getInt("WEIGHT"),
							   rset.getDate("CREATE_DATE"),
							   rset.getDate("MODIFY_DATE"),
							   rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
		
	}
	
	public int updatePwdMember(Connection conn, int memNo, String memPwd, String updatePwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePwd);
			pstmt.setInt(2, memNo);
			pstmt.setString(3, memPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int deleteMember(Connection conn, int memNo, String memPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memNo);
			pstmt.setString(2, memPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	public int idCheck(Connection conn, String checkId) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	}
}
