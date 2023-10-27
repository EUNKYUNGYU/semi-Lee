package com.kh.DoctorLee.cou.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.commit;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;
import static com.kh.DoctorLee.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.common.template.Template;
import com.kh.DoctorLee.cou.model.dao.CouDao;
import com.kh.DoctorLee.cou.model.vo.Cou;
import com.kh.DoctorLee.cou.model.vo.CouCar;
import com.kh.DoctorLee.cou.model.vo.CouRes;
import com.kh.DoctorLee.cou.model.vo.CouResTime;
import com.kh.DoctorLee.cou.model.vo.CouRev;
import com.kh.DoctorLee.cou.model.vo.CouVideo;
import com.kh.DoctorLee.member.model.vo.Member;

public class CouService implements CouServiceI {
	
	private CouDao couDao = new CouDao();
	
	// 게시된 비디오가 총 몇 개인지 계산
	@Override
	public int selectVideoListCount() {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = couDao.selectVideoListCount(sqlSession);
		
		sqlSession.close();
		
		return result;
	}

	// 비디오 목록 가져오기
	@Override
	public ArrayList<CouVideo> selectVideoList(PageInfo pi) {
		SqlSession sqlSession = Template.getSqlSession();
		
		RowBounds rowBounds = new RowBounds(((pi.getCurrentPage() - 1)*pi.getBoardLimit()), pi.getBoardLimit());
		
		ArrayList<CouVideo> list = couDao.selectVideoList(sqlSession, rowBounds);
		
		sqlSession.close();
		
		return list;
	}

	// 비디오 게시하기
	public int insertVideo(CouVideo cv) {
		
		return 0;
	}
	
	// 비디오 영상 수정하기 위한 내용 조회하기
	public CouVideo selectCouVideo(int videoNo) {
		
		return null;
	}
	
	// 비디오 내용 수정
	public int updateCouVideo(CouVideo c) {
		
		return 0;
	}
	
	// 비디오 삭제
	public int deleteVideo(int videoNo) {
		
		return 0;
	}
	
	// 상담사 목록 출력
	public ArrayList<Cou> selectCouList(){
		
		return null;
	}
	
	// 상담사 상세보기
	public Cou selectCou(int couNo) {
		
		return null;
	}
	
	// 상담사 예약 가능 날짜 출력
	public ArrayList<CouResTime> selectCouDate(int couNo){
		
		return null;
	}
	
	// 상담사 예약 가능 시간 출력
	public ArrayList<CouResTime> selectCouTimeList(int couNo, String resDate){
		
		return null;
	}
	
	// 상담 예약하기
	public int insertCouRes(CouRes c) {
		
		return 0;
	}

	public int selectResMem(int couNo, Member loginUser) {
		
		return 0;
	}
	
	// 상담 예약 후 리뷰 작성
	public int insertCouRev(CouRev c) {
		
		return 0;
	}
	
	// 상담 리뷰 목록 출력
	public ArrayList<CouRev> selectCouRevList(int couNo){
		
		return null;
	}
	
	// 리뷰는 한 사람당 한 번만 작성 가능하게
	public int selectRevCount(int couNo, Member loginUser) {
		
		return 0;
	}
	
	// 상담사 경력 및 자격 가져오기
	public ArrayList<CouCar> selectCouCarList(int couNo){
		
		return null;
	}
	
	// 상담사 평점 가져오기
	public Double selectCouScope(int couNo) {
		
		return 0.0;
	}

}
