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
import com.kh.DoctorLee.member.model.dao.MemberDao;
import com.kh.DoctorLee.mpBoard.model.vo.MedManagement;

public class MedManagementDao {
	
private Properties prop = new Properties();
	
	public MedManagementDao() {
		
		String file = MemberDao.class.getResource("/sql/medi/medi-mapper.xml").getPath();
		//System.out.println(file);
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MedManagement> selectMedManagementList(Connection conn){
		
		ArrayList<MedManagement> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMedManagementList");
		
		
		try {
			pstmt =conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MedManagement mm = new MedManagement();
				mm.setHosName(rset.getString("HOS_NAME"));
				mm.setDoctorName(rset.getString("DOCTOR_NAME"));
				mm.setMediName(rset.getString("MEDI_NAME"));
				mm.setTreateDate(rset.getDate("TREAT_DATE"));
				mm.setPreDate(rset.getDate("PRE_DATE"));
				mm.setMedManNo(rset.getInt("MED_MAN_NO"));
				
				list.add(mm);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		 return list;
		
	}
	
	public MedManagement selectMedManagement(Connection conn, int medManNo) {
		
		MedManagement mm = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMedManagement");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, medManNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mm = new MedManagement();
				mm.setHosName(rset.getString("HOS_NAME"));
				mm.setDoctorName(rset.getString("DOCTOR_NAME"));
				mm.setMediName(rset.getString("MEDI_NAME"));
				mm.setTreateDate(rset.getDate("TREAT_DATE"));
				mm.setPreDate(rset.getDate("PRE_DATE"));
				mm.setMedManNo(rset.getInt("MED_MAN_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return mm;
	}
	
	public int deleteMedManagement(Connection conn, int medManNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMedManagement");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, medManNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public ArrayList<MedManagement> selectMedManagementh(Connection conn,int memNo){
		ArrayList<MedManagement> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMedManagementh");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,memNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				MedManagement mm = new MedManagement();
				mm.setHosName(rset.getString("HOS_NAME"));
				mm.setDoctorName(rset.getString("DOCTOR_NAME"));
				mm.setMediName(rset.getString("MEDI_NAME"));
				mm.setTreateDate(rset.getDate("TREAT_DATE"));
				mm.setPreDate(rset.getDate("PRE_DATE"));
				mm.setMedManNo(rset.getInt("MED_MAN_NO"));
				
				list.add(mm);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return list;
	}
	
}
