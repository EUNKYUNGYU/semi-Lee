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

import com.kh.DoctorLee.hospital.model.vo.Hospital;

public class HospitalDao {
	
	private Properties prop = new Properties();
	
	public HospitalDao() {
		
		try {
			prop.loadFromXML(new FileInputStream("sql/hospital/hos-mapper.xml"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Hospital selectTreatTime(Connection conn) {
		
		Hospital hos = new Hospital();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTreatTime");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				hos.setHosNo(rset.getInt("HOS_NO"));
				hos.setTreatBegin(rset.getString("TREAT_BEGIN"));
				hos.setTreatEnd(rset.getString("TREAT_END"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return hos;
	}
	
	public ArrayList<Hospital> searchHos(Connection conn, String keyword){
		ArrayList<Hospital> hosList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("schHos");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Hospital hos = new Hospital();
				hos.setHosNo(rset.getInt("HOS_NO"));
				hos.setHosName(rset.getString("HOS_NAME"));
				hos.setHosAddress(rset.getString("HOS_ADDRESS"));
				
				hosList.add(hos);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hosList;
	}

}
