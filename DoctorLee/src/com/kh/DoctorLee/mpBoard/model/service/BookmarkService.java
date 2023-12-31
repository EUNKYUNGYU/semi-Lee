package com.kh.DoctorLee.mpBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.common.JDBCTemplate;
import com.kh.DoctorLee.hospital.model.vo.Hospital;
import com.kh.DoctorLee.mpBoard.model.dao.BookmarkDao;
import com.kh.DoctorLee.mpBoard.model.vo.Bookmark;

public class BookmarkService {
	public ArrayList<Hospital> selectHospital(String hosName) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Hospital> list = new BookmarkDao().selectHospital(conn,hosName);
		JDBCTemplate.close(conn);
		
		return list;
	}
	public Hospital selectHosWord(String hosnameWord) {
		Connection conn = JDBCTemplate.getConnection();
		Hospital hos = new BookmarkDao().selectHosWord(conn,hosnameWord);
		JDBCTemplate.close(conn);
		return hos;
	}
	public int insertBookmark(String hosnameWord,int memNo){
		Connection conn = JDBCTemplate.getConnection();
		int result = new BookmarkDao().insertBookmark(conn,hosnameWord,memNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public ArrayList<Bookmark> selectBookmark(int memNo){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Bookmark> list = new BookmarkDao().selectBookmark(conn,memNo);
		JDBCTemplate.close(conn);
		return list;
	}
	public int deleteBookmark(String hosName,int memNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BookmarkDao().deleteBookmark(conn,hosName,memNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
