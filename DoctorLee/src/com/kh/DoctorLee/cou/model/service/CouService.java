package com.kh.DoctorLee.cou.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.cou.model.dao.CouDao;
import com.kh.DoctorLee.cou.model.vo.CouVideo;

public class CouService {
	
	// 게시된 비디오가 총 몇 개인지 계산
	public int selectVideoListCount() {
		Connection conn = getConnection();
		
		int result = new CouDao().selectVideoListCount(conn);
		
		close(conn);
		
		return result;
	}

	// 비디오 목록 가져오기
	public ArrayList<CouVideo> selectVideoList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<CouVideo> list = new CouDao().selectVideoList(conn, pi);
		
		close(conn);
		
		return list;
		
	}

	// 비디오 게시하기
	public int insertVideo(CouVideo cv) {
		Connection conn = getConnection();
		
		int result = new CouDao().insertVideo(conn, cv);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	// 비디오 영상 수정하기 위한 내용 조회하기
	public CouVideo selectCouVideo(int videoNo) {
		Connection conn = getConnection();
		
		CouVideo c = new CouDao().selectCouVideo(conn, videoNo);
		
		close(conn);
		
		return c;
	}
	
	// 비디오 내용 수정
	public int updateCouVideo(CouVideo c) {
		Connection conn = getConnection();
		
		int result = new CouDao().updateCouVideo(conn, c);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
