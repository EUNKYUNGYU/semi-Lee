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

import com.kh.DoctorLee.reservation.model.vo.GuestReservation;
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
	
	// 예약 조회
	public Reservation selectRsvt(Connection conn, String rsvtName) {
		Reservation selectRsvt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRsvt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rsvtName);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				selectRsvt = new Reservation();
				selectRsvt.setRsvtNo(rset.getInt("RSVT_NO"));
				selectRsvt.setRsvtMem(rset.getString("RSVT_MEM"));
				selectRsvt.setRsvtDoc(rset.getString("RSVT_DOC"));
				selectRsvt.setRsvtHos(rset.getString("RSVT_HOS"));
				selectRsvt.setRsvtDate(rset.getString("RSVT_DATE"));
				selectRsvt.setRsvtTime(rset.getString("RSVT_TIME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return selectRsvt;
	}
	
	// ----- 비회원 예약 코드 ----
	
	public int checkRsvtTreatG(Connection conn, String rsvtDateG, String rsvtTimeG) {
		int checkRsvtResult = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkRsvtTreat_G");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rsvtDateG);
			pstmt.setString(2, rsvtTimeG);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				checkRsvtResult = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return checkRsvtResult;
			
	}
	
	public int insertRsvtG(Connection conn, GuestReservation gRsvt) {
		int result = 0;
		PreparedStatement pstmt =  null;
		String sql = prop.getProperty("insertRsvt_G");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gRsvt.getGuestRsvtDate());
			pstmt.setString(2, gRsvt.getGuestRsvtTime());
			pstmt.setString(3, gRsvt.getGuestRsvtInfo());
			pstmt.setString(4, gRsvt.getGuestRsvtHos());
			pstmt.setString(5, gRsvt.getRsvtGuest());
			pstmt.setString(6, gRsvt.getGuestRsvtDoc());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public GuestReservation selectRsvtG(Connection conn, String rsvtNameG) {
		GuestReservation rsvtG = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRsvt_G");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rsvtNameG);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				rsvtG = new GuestReservation();
				rsvtG.setGuestRsvtNo(rset.getInt("GUEST_RSVT_NO"));
				rsvtG.setRsvtGuest(rset.getString("RSVT_GUEST"));
				rsvtG.setGuestRsvtDoc(rset.getString("GUEST_RSVT_DOC"));
				rsvtG.setGuestRsvtHos(rset.getString("GUEST_RSVT_HOS"));
				rsvtG.setGuestRsvtDate(rset.getString("GUEST_RSVT_DATE"));
				rsvtG.setGuestRsvtTime(rset.getString("GUEST_RSVT_TIME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rsvtG;
	}
	
}
