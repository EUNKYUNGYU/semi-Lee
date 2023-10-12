package com.kh.DoctorLee.mpBoard.model.service;

import java.sql.Connection;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.mpBoard.model.dao.BookmarkDao;

public class BookmarkService {
	public void selectHospital(String searchContent) {
		Connection conn = JDBCTemplate.getConnection();
		new BookmarkDao().selectHospital(searchContent);
	}

}
