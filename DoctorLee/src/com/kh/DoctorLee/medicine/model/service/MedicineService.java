package com.kh.DoctorLee.medicine.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.medicine.model.dao.MedicineDao;
import com.kh.DoctorLee.medicine.model.vo.Medicine;

public class MedicineService {
	
	public ArrayList<Medicine> selectMedicine(String medName){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Medicine> medList = new MedicineDao().selectMedicine(conn,medName);
		return medList;
	}
	public Medicine detailMedicine(String medName) {
		Connection conn = JDBCTemplate.getConnection();
		Medicine med = new MedicineDao().detailMedicine(conn,medName);
		return med;
	}
	

}
