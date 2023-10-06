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
		
		String file = HospitalDao.class.getResource("/sql/hospital/hos-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Hospital> schToIndex(Connection conn, String schKeyword, String hkey){
		ArrayList<Hospital> list = new ArrayList();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("schToIndex");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + schKeyword + "%");
			pstmt.setString(2, hkey);
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
	

}
