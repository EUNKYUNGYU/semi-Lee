package com.kh.DoctorLee.mpBoard.model.service;

import java.sql.Connection;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.mpBoard.model.dao.DiaryDao;
import com.kh.DoctorLee.mpBoard.model.vo.FamDiary;
import com.kh.DoctorLee.mpBoard.model.vo.MyDiary;

public class DiaryService {
	
	public int insertMyDiary(MyDiary md) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DiaryDao().insertMyDiary(conn,md);
		if(result > 0) {
			JDBCTemplate.commit(conn);
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
		
	}
	public int insertFamDiary(FamDiary fd) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new DiaryDao().insertFamDiary(conn,fd);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		
		return result;
	}

}
