package com.kh.DoctorLee.medicine.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.medicine.model.vo.Medicine;
import com.kh.DoctorLee.mpBoard.model.dao.DiaryDao;

public class MedicineDao {
	private Properties prop = new Properties();
	public MedicineDao() {
		String fileName = DiaryDao.class.getResource("/sql/medicine/medicine-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Medicine> selectMedicine(Connection conn,String medName){
		ArrayList<Medicine> medList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMedicine");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, medName);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Medicine med = new Medicine();
				med.setMedName(rset.getString("MED_NAME"));
				medList.add(med);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return medList;
	}
	public Medicine detailMedicine(Connection conn,String medName) {
		Medicine med = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMedicineDetail");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, medName);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				med = new Medicine();
				med.setMedName(rset.getString("MED_NAME"));
				med.setPreInfo(rset.getString("PRE_INFO"));
				med.setCauction(rset.getString("CAUCTION"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return med;
		
	}
	public int insertMedicine(Connection conn, Medicine med) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMedicine");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, med.getMedName());
			pstmt.setString(2, med.getPreInfo());
			pstmt.setString(3, med.getCauction());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		
		return result;
	}
}
