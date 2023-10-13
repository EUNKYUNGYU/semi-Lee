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
	public int insertBookmark(String hosnameWord){
		Connection conn = JDBCTemplate.getConnection();
		int result = new BookmarkDao().insertBookmark(conn,hosnameWord);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	public ArrayList<Bookmark> selectBookmark(){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Bookmark> list = new BookmarkDao().selectBookmark(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}
