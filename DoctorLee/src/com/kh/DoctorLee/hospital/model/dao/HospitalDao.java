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

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.hospital.model.vo.Doctor;
import com.kh.DoctorLee.hospital.model.vo.Hospital;
import com.kh.DoctorLee.review.model.vo.Review;

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
	
	// 병원 검색
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
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hosCount;
	}
	
	// 병원 상세페이지 시 필요한 데이터 조회
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
				hos.setHosNo(rset.getInt("HOS_NO"));
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

	// 의료진 조회
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
	
	// 리뷰 조회
	public ArrayList<Review> selectReview(Connection conn, int hno) {
		ArrayList<Review> reviewList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hno);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review rv = new Review();
				rv.setReviewNo(rset.getInt("REVIEW_NO"));
				rv.setReviewWriter(rset.getString("NICKNAME"));
				rv.setContent(rset.getString("CONTENT"));
				rv.setScope(rset.getInt("SCOPE"));
				rv.setCreateDate(rset.getDate("CREATE_DATE"));
				
				reviewList.add(rv);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewList;
	}
	
	/*
	public ArrayList<Hospital> selectHospital(Connection conn, PageInfo pInfo){
		ArrayList<Hospital> pList = new ArrayList();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql =  prop.getProperty("selectHosList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			while(rset.next()) {
				Hospital hos = new Hospital();
				hos.setHosNo(rset.getInt("HOS_NO"));
				hos.setHosName(rset.getString("HOS_NAME"));
				hos.setHosAddress(rset.getString("HOS_ADDRESS"));
				hos.setTreatDep(rset.getString("TREAT_NAME"));
				hos.setTreatDate(rset.getString("TREAT_DATE"));
				hos.setTreatBegin(rset.getString("TREAT_BEGIN"));
				hos.setTreatEnd(rset.getString("TREAT_END"));
				hos.setHosTel(rset.getString("HOS_TEL"));
				hos.setHosInfo(rset.getString("HOS_INFO"));
				pList.add(hos);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pList;
		
	}
	*/
	
}
