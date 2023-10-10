package com.kh.DoctorLee.mpBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

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
	
	public ArrayList<MyDiary> selectMyDiary(int memNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<MyDiary> list = new DiaryDao().selectMyDiary(conn,memNo);
		JDBCTemplate.close(conn);
		
		
		return list;
	}
	
	public ArrayList<FamDiary> selectFamDiary(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<FamDiary> famList = new DiaryDao().selectFamDiary(conn);
		JDBCTemplate.close(conn);
		return famList;
	}
	public MyDiary detailMyDiary(int diaryNo) {
		Connection conn = JDBCTemplate.getConnection();
		MyDiary md = new DiaryDao().detailMyDiary(conn,diaryNo);
		JDBCTemplate.close(conn);
		return md;
	}

}
