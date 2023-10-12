package com.kh.DoctorLee.mpBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.hospital.model.vo.Hospital;
import com.kh.DoctorLee.mpBoard.model.dao.BookmarkDao;

public class BookmarkService {
	public ArrayList<Hospital> selectHospital(String hosName) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Hospital> list = new BookmarkDao().selectHospital(conn,hosName);
		JDBCTemplate.close(conn);
		
		return list;
	}

}
