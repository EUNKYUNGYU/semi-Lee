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
			pstmt.setString(2, medName);
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
}
