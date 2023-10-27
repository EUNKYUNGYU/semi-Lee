package com.kh.DoctorLee.cou.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.cou.model.vo.CouVideo;

public class CouDao {
	
	public int selectVideoListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("couMapper.selectVideoListCount");
	}
	
	
	public ArrayList<CouVideo> selectVideoList(SqlSession sqlSession, RowBounds rowBounds) {
		
		return (ArrayList)sqlSession.selectList("couMapper.selectVideoList", null, rowBounds); 
	}

}
