package com.kh.DoctorLee.cou.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.cou.model.vo.Cou;
import com.kh.DoctorLee.cou.model.vo.CouCar;
import com.kh.DoctorLee.cou.model.vo.CouRes;
import com.kh.DoctorLee.cou.model.vo.CouResTime;
import com.kh.DoctorLee.cou.model.vo.CouRev;
import com.kh.DoctorLee.cou.model.vo.CouVideo;

public class CouDao {
	
	public int selectVideoListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("couMapper.selectVideoListCount");
	}
	
	
	public ArrayList<CouVideo> selectVideoList(SqlSession sqlSession, RowBounds rowBounds) {
		
		return (ArrayList)sqlSession.selectList("couMapper.selectVideoList", null, rowBounds); 
	}
	
	public int insertVideo(SqlSession sqlSession, CouVideo cv) {
		return sqlSession.insert("couMapper.insertVideo", cv);
	}
	
	public CouVideo selectCouVideo(SqlSession sqlSession, int videoNo) {
		return sqlSession.selectOne("couMapper.selectCouVideo", videoNo);
	}
	
	public int updateCouVideo(SqlSession sqlSession, CouVideo c) {
		return sqlSession.update("couMapper.updateCouVideo", c);
	}
	
	public int deleteVideo(SqlSession sqlSession, int videoNo) {
		return sqlSession.delete("couMapper.deleteVideo", videoNo);
	}
	
	public ArrayList<Cou> selectCouList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("couMapper.selectCouList");
	}
	
	public Cou selectCou(SqlSession sqlSession, int couNo) {
		return sqlSession.selectOne("couMapper.selectCou", couNo);
	}
	
	public int selectResMem(SqlSession sqlSession, CouRes cr) {
		return sqlSession.selectOne("couMapper.selectResMem", cr);
	}
	
	public int selectRevCount(SqlSession sqlSession, CouRes cr) {
		return sqlSession.selectOne("couMapper.selectRevCount", cr);
	}
	
	public ArrayList<CouCar> selectCouCarList(SqlSession sqlSession, int couNo){
		return (ArrayList)sqlSession.selectList("couMapper.selectCouCarList", couNo);
	}
	
	public ArrayList<CouResTime> selectCouDate(SqlSession sqlSession, int couNo){
		return (ArrayList)sqlSession.selectList("couMapper.selectCouDate", couNo);
	}
	
	public ArrayList<CouRev> selectCouRevList(SqlSession sqlSession, int couNo) {
		return (ArrayList)sqlSession.selectList("couMapper.selectCouRevList", couNo);
	}

}
