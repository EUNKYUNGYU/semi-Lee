package com.kh.DoctorLee.cou.model.service;

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
	@Override
	public int insertVideo(CouVideo cv) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = couDao.insertVideo(sqlSession, cv);
		
		if(result > 0) sqlSession.commit();
		
		sqlSession.close();
		
		return result;
	}
	
	// 비디오 영상 수정하기 위한 내용 조회하기
	@Override
	public CouVideo selectCouVideo(int videoNo) {
		SqlSession sqlSession = Template.getSqlSession();
		
		CouVideo v = couDao.selectCouVideo(sqlSession, videoNo);
		
		sqlSession.close();
		
		return v;
	}
	
	// 비디오 내용 수정
	@Override
	public int updateCouVideo(CouVideo c) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = couDao.updateCouVideo(sqlSession, c);
		
		if(result > 0) sqlSession.commit();
		
		sqlSession.close();
		
		return result;
	}
	
	// 비디오 삭제
	@Override
	public int deleteVideo(int videoNo) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = couDao.deleteVideo(sqlSession, videoNo);
		
		if(result > 0) sqlSession.commit();
		
		sqlSession.close();
		
		return result;
	}
	
	// 상담사 목록 출력
	@Override
	public ArrayList<Cou> selectCouList(){
		SqlSession sqlSession = Template.getSqlSession();
		
		ArrayList<Cou> list = couDao.selectCouList(sqlSession);
		
		sqlSession.close();
		
		return list;
	}
	
	// 상담사 상세보기
	@Override
	public Cou selectCou(int couNo) {
		SqlSession sqlSession = Template.getSqlSession();
		
		Cou c = couDao.selectCou(sqlSession, couNo);
		
		sqlSession.close();
		
		return c;
	}
	
	@Override
	public int selectResMem(CouRes cr) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = couDao.selectResMem(sqlSession, cr);
		
		sqlSession.close();
		
		return result;
	}
	
	// 리뷰는 한 사람당 한 번만 작성 가능하게
	@Override
	public int selectRevCount(CouRes cr) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = couDao.selectRevCount(sqlSession, cr);
		
		sqlSession.close();
		
		return result;
	}
	
	// 상담사 경력 및 자격 가져오기
	@Override
	public ArrayList<CouCar> selectCouCarList(int couNo){
		SqlSession sqlSession = Template.getSqlSession();
		
		ArrayList<CouCar> list = couDao.selectCouCarList(sqlSession, couNo);
		
		sqlSession.close();
		
		return list;
	}
	
	////////////////////////////////////////////////////////////
	
	// 상담 리뷰 목록 출력
	@Override
	public ArrayList<CouRev> selectCouRevList(int couNo){
		SqlSession sqlSession = Template.getSqlSession();
			
		ArrayList<CouRev> list = couDao.selectCouRevList(sqlSession, couNo);
			
		sqlSession.close();
			
		return list;
	}
	
	// 상담사 예약 가능 날짜 출력
	@Override
	public ArrayList<CouResTime> selectCouDate(int couNo){
		SqlSession sqlSession = Template.getSqlSession();
		
		ArrayList<CouResTime> list = couDao.selectCouDate(sqlSession, couNo);
		
		sqlSession.close();
		
		return list;
	}
	
	@Override
	public ArrayList<CouResTime> selectCouTimeList(CouRes cr) {
		SqlSession sqlSession = Template.getSqlSession();
		
		ArrayList<CouResTime> list = couDao.selectCouTimeList(sqlSession, cr);
		
		sqlSession.close();
		
		return list;
	}

	// 상담 예약하기
	@Override
	public int insertCouRes(CouRes c) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = couDao.insertCouRes(sqlSession, c);
		
		if(result > 0) sqlSession.commit();
		
		sqlSession.close();
		
		return result;
	}

	
	
	// 상담 예약 후 리뷰 작성
	@Override
	public int insertCouRev(CouRev c) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = couDao.insertCouRev(sqlSession, c);
		
		if(result > 0) sqlSession.commit();
		
		sqlSession.close();
		
		return result;
	}


}
