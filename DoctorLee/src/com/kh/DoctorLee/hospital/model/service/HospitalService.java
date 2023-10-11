package com.kh.DoctorLee.hospital.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.hospital.model.dao.HospitalDao;
import com.kh.DoctorLee.hospital.model.vo.Doctor;
import com.kh.DoctorLee.hospital.model.vo.Hospital;

public class HospitalService {
	// 메인 검색창, 응답
	public ArrayList<Hospital> schToIndex(String search, String hkeyH){
		Connection conn = getConnection();
		ArrayList<Hospital> list = new HospitalDao().schToIndex(conn, search, hkeyH);
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
	
	// 병원 상세 조회
	public Hospital hosDetail(int hno) {
		Connection conn = getConnection();
		Hospital hos = new HospitalDao().hosDetail(conn, hno);
		close(conn);
		
		return hos;
	}
	
	// 의료진 조회
	public ArrayList<Doctor> selectDoc(int hno) {
		Connection conn = getConnection();
		ArrayList<Doctor> docList = new HospitalDao().selectDoc(conn, hno);
		close(conn);
		return docList;
	}
	
}
