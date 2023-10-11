package com.kh.DoctorLee.reservation.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
	
	// 예약 insert
	public int insertRsvt(Connection conn, Reservation rsvt) {
		int result = 0;
		PreparedStatement pstmt =  null;
		String sql = prop.getProperty("insertRsvt");
		
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

}
