package com.kh.DoctorLee.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.board.model.vo.Board;
import com.kh.DoctorLee.common.model.vo.PageInfo;

public class BoardDao {
	
	public int selectListCount(SqlSession sqlSession, String type) {
		return sqlSession.selectOne("boardMapper.selectListCount", type);
	}
	
	public int selectListCountMyBoard(SqlSession sqlSession, int memNo) {
		return sqlSession.selectOne("boardMapper.selectListCountMyBoard", memNo);
	}
	
	public ArrayList<Board> selectList(SqlSession sqlSession, String type, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", type, rowBounds);
	}
	
	public ArrayList<Board> selectMyBoardList(SqlSession sqlSession, int memNo, PageInfo pi){

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectMyBoardList", memNo, rowBounds);
	}
	
	public int insertBoard(SqlSession sqlSession, Board b) {
		
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	public int increseViews(SqlSession sqlSession, HashMap<String, Integer> map) {
		
		return sqlSession.update("boardMapper.increseViews", map);
	}
	
	
	public Board selectBoard(SqlSession sqlSession, HashMap<String, Integer> map) {
		
		return sqlSession.selectOne("boardMapper.selectBoard", map);
		
	}
	
	public int deleteBoard(SqlSession sqlSession, int boardNo) {

		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}
	
	public int updateBoard(SqlSession sqlSession, Board b) {
		
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int selectLike(SqlSession sqlSession, HashMap<String, Integer> map) {

		return sqlSession.selectOne("boardMapper.selectLike", map);
		
	}
	
	public int insertLike(SqlSession sqlSession, HashMap<String, Integer> map) {
		
		System.out.println("좋아요하기 결과 Dao " + map +sqlSession.insert("boardMapper.insertLike", map));
		return sqlSession.insert("boardMapper.insertLike", map);
		
	}
	
	public int deleteLike(SqlSession sqlSession, HashMap<String, Integer> map) {
		
		return sqlSession.delete("boardMapper.deleteLike", map);
		
	}
	
}
