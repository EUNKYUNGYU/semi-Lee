package com.kh.DoctorLee.mpReservation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.mpReservation.model.vo.MpReservation;

public class MpReservationDao {
	private Properties prop = new Properties();
	public MpReservationDao() {
		String fileName = MpReservationDao.class.getResource("/sql/mpReservation/mpReservation-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<MpReservation> selectReservation(Connection conn,int memNo){
		ArrayList<MpReservation> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MpReservation mr = new MpReservation();
				mr.setRsvtDate(rset.getString("RSVT_DATE"));
				mr.setRsvtTime(rset.getString("RSVT_TIME"));
				mr.setRsvtHos(rset.getString("HOS_NAME"));
				mr.setRsvtDoc(rset.getString("DOCTOR_NAME"));
				list.add(mr);
				
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
