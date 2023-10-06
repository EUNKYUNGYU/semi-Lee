package com.kh.DoctorLee.hospital.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.hospital.model.dao.HospitalDao;
import com.kh.DoctorLee.hospital.model.vo.Hospital;

public class HospitalService {
	
	public ArrayList<Hospital> schToIndex(String schKeyword, String hkey){
		Connection conn = getConnection();
		ArrayList<Hospital> list = new HospitalDao().schToIndex(conn, schKeyword, hkey);
		close(conn);
		return list;
	}
	
}
