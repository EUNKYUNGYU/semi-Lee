package com.kh.DoctorLee.board.model.service;

import static com.kh.DoctorLee.common.template.Template.getSqlSession;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.board.model.dao.BoardDao;
import com.kh.DoctorLee.board.model.vo.Board;
import com.kh.DoctorLee.common.model.vo.PageInfo;

public class BoardServiceImpl implements BoardServiceInterface {

	BoardDao boardDao = new BoardDao();
		
	@Override
	public int selectListCount(String type) {
		SqlSession sqlSession = getSqlSession();
		int listCount = boardDao.selectListCount(sqlSession, type);
		sqlSession.close();
		return listCount;
	}

	@Override
	public int selectListCountMyBoard(int memNo) {
		SqlSession sqlSession = getSqlSession();
		int listCount = boardDao.selectListCountMyBoard(sqlSession, memNo);
		sqlSession.close();
		return listCount;
	}

	@Override
	public ArrayList<Board> selectList(String type, PageInfo pi) {
		SqlSession sqlSession = getSqlSession();
		ArrayList<Board> list = boardDao.selectList(sqlSession, type, pi);
		sqlSession.close();
		return list;
	}

	@Override
	public ArrayList<Board> selectMyBoardList(int memNo, PageInfo pi) {
		SqlSession sqlSession = getSqlSession();
		ArrayList<Board> list = boardDao.selectMyBoardList(sqlSession, memNo, pi);
		sqlSession.close();
		return list;
	}

	@Override
	public Board selectBoard(HashMap<String, Integer> map) {
		
		SqlSession sqlSession = getSqlSession();
		int result = boardDao.increseViews(sqlSession, map);
		Board b = null;
		if(result > 0) {
			b = boardDao.selectBoard(sqlSession, map);
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		return b;
	}

	@Override
	public int insertBoard(Board b) {
		SqlSession sqlSession = getSqlSession();
		int result = boardDao.insertBoard(sqlSession, b);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	@Override
	public int deleteBoard(int boardNo) {
		SqlSession sqlSession = getSqlSession();
		int result = boardDao.deleteBoard(sqlSession, boardNo);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

	@Override
	public int updateBoard(Board b) {
		SqlSession sqlSession = getSqlSession();
		int result = boardDao.updateBoard(sqlSession, b);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

	@Override
	public int selectLike(HashMap<String, Integer> map) {
		SqlSession sqlSession = getSqlSession();
		int result = boardDao.selectLike(sqlSession, map);
		sqlSession.close();
		return result;
	}

	@Override
	public int insertLike(HashMap<String, Integer> map) {
		SqlSession sqlSession = getSqlSession();
		int result = boardDao.insertLike(sqlSession, map);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

	@Override
	public int deleteLike(HashMap<String, Integer> map) {
		SqlSession sqlSession = getSqlSession();
		int result = boardDao.deleteLike(sqlSession, map);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

	@Override
	public int increseViews(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return 0;
	}


	
}
