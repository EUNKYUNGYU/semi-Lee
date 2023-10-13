package com.kh.DoctorLee.mpBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.mpBoard.model.dao.MedManagementDao;
import com.kh.DoctorLee.mpBoard.model.vo.MedManagement;

public class MedManagementService {
	
	public ArrayList<MedManagement> selectMedManagementList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<MedManagement> list = new MedManagementDao().selectMedManagementList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}

	public MedManagement selectMedManagement(int medManNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		MedManagement mm = new MedManagementDao().selectMedManagement(conn, medManNo);
		
		JDBCTemplate.close(conn);
		
		return mm;
	}
	
	public int deleteMedManagement(int medManNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MedManagementDao().deleteMedManagement(conn, medManNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
}
