package com.kh.DoctorLee.hospital.model.dao;

import static com.kh.DoctorLee.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.hospital.model.vo.Doctor;
import com.kh.DoctorLee.hospital.model.vo.Hospital;

public class HospitalDao {
	
	private Properties prop = new Properties();
	
	public HospitalDao() {
		
		String file = HospitalDao.class.getResource("/sql/hospital/hos-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Hospital> schToIndex(Connection conn, String search, String hkeyH){
		ArrayList<Hospital> list = new ArrayList();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("schToIndex");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, hkeyH);
			rset = pstmt.executeQuery();
			while(rset.next()){
				Hospital h = new Hospital();
				h.setHosNo(rset.getInt("HOS_NO"));
				h.setHosName(rset.getString("HOS_NAME"));
				h.setHosAddress(rset.getString("HOS_ADDRESS"));
				list.add(h);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	
	// 병원 입점 개수 조회
	public int hosCount(Connection conn) {
		int hosCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("hosCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hosCount = rset.getInt("COUNT(*)");
			}
			
			System.out.println(hosCount);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hosCount;
	}
	
	public Hospital hosDetail(Connection conn, int hno) {
		Hospital hos = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("hosDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hos = new Hospital();
				hos.setHosName(rset.getString("HOS_NAME"));
				hos.setHosAddress(rset.getString("HOS_ADDRESS"));
				hos.setTreatDep(rset.getString("TREAT_NAME"));
				hos.setTreatDate(rset.getString("TREAT_DATE"));
				hos.setTreatBegin(rset.getString("TREAT_BEGIN"));
				hos.setTreatEnd(rset.getString("TREAT_END"));
				hos.setHosTel(rset.getString("HOS_TEL"));
				hos.setHosInfo(rset.getString("HOS_INFO"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hos;
	}

	public ArrayList<Doctor> selectDoc(Connection conn, int hno) {
		ArrayList<Doctor> docList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDoc");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hno);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Doctor doc = new Doctor();
				doc.setDocNo(rset.getInt("DOCTOR_NO"));
				doc.setDocName(rset.getString("DOCTOR_NAME"));
				doc.setTreatDep(rset.getString("TREAT_NAME"));
				docList.add(doc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return docList;
	}
}
