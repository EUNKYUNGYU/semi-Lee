package com.kh.DoctorLee.hospital.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.hospital.model.dao.HospitalDao;
import com.kh.DoctorLee.hospital.model.vo.Hospital;

public class HospitalService {
	// 메인 검색창, 응답
	public ArrayList<Hospital> schToIndex(String schKeyword, String hkey){
		Connection conn = getConnection();
		ArrayList<Hospital> list = new HospitalDao().schToIndex(conn, schKeyword, hkey);
		close(conn);
		return list;
	}
	
	// 병원 개수 조회
	public int hosCount() {
		Connection conn = getConnection();
		int hosCount = new HospitalDao().hosCount(conn);
		close(conn);
		return hosCount;
	}
	
}
