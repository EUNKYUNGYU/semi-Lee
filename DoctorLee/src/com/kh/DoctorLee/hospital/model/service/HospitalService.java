package com.kh.DoctorLee.hospital.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.hospital.model.dao.HospitalDao;
import com.kh.DoctorLee.hospital.model.vo.Hospital;

public class HospitalService {
	
	public Hospital selectTreatTime() {
		Connection conn = getConnection();
		Hospital hos = new HospitalDao().selectTreatTime(conn);
		close(conn);
		return hos;
	}

	public ArrayList<Hospital> searchHos(String keyword){
		Connection conn = getConnection();
		ArrayList<Hospital> hosList = new HospitalDao().searchHos(conn, keyword);
		close(conn);
		return hosList;
	}
	
	public ArrayList<Hospital> schHosList(String indexSch){
		Connection conn = getConnection();
		ArrayList<Hospital> list = new HospitalDao().schHosList(conn, indexSch);
		close(conn);
		return list;
	}
}
