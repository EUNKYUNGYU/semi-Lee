package com.kh.DoctorLee.reservation.model.dao;

import static com.kh.DoctorLee.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.DoctorLee.reservation.model.vo.Reservation;

public class ReservationDao {
	
	private Properties prop = new Properties();

	public ReservationDao() {
		String file = ReservationDao.class.getResource("/sql/reservation/rsvt-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 진료 시간 체크 
	public int checkRsvtTreat(Connection conn, String rsvtDate, String rsvtTime) {
		int checkRsvtResult = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkRsvtTreat");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rsvtDate);
			pstmt.setString(2, rsvtTime);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				checkRsvtResult = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return checkRsvtResult;
	}
	
	
	// 예약 insert
	public int insertRsvt(Connection conn, Reservation rsvt) {
		int result = 0;
		PreparedStatement pstmt =  null;
		String sql = prop.getProperty("insertRsvt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rsvt.getRsvtDate());
			pstmt.setString(2, rsvt.getRsvtTime());
			pstmt.setString(3, rsvt.getMemInfo());
			pstmt.setString(4, rsvt.getRsvtHos());
			pstmt.setString(5, rsvt.getRsvtMem());
			pstmt.setString(6, rsvt.getRsvtDoc());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 예약 확인
	public Reservation selectRsvt(Connection conn, String rsvtName) {
		Reservation rsvtResult = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRsvt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rsvtName);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				rsvtResult = new Reservation();
				rsvtResult.setRsvtNo(rset.getInt("RSVT_NO"));
				rsvtResult.setRsvtMem(rset.getString("RSVT_MEM"));
				rsvtResult.setRsvtDoc(rset.getString("RSVT_DOC"));
				rsvtResult.setRsvtHos(rset.getString("RSVT_HOS"));
				rsvtResult.setRsvtDate(rset.getString("RSVT_DATE"));
				rsvtResult.setRsvtTime(rset.getString("RSVT_TIME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rsvtResult;
	}
}
