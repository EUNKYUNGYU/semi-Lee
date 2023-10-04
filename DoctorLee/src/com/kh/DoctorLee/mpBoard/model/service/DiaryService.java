package com.kh.DoctorLee.mpBoard.model.service;

import java.sql.Connection;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.mpBoard.model.dao.DiaryDao;
import com.kh.DoctorLee.mpBoard.model.vo.MyDiary;

public class DiaryService {
	
	public void insertMyDiary(MyDiary md) {
		Connection conn = JDBCTemplate.getConnection();
		new DiaryDao().insertMyDiary(conn,md);
		
	}

}
