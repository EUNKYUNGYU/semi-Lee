package com.kh.DoctorLee.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.DoctorLee.board.model.vo.Board;
import com.kh.DoctorLee.common.model.vo.PageInfo;

public interface BoardServiceInterface {

	// 보드 리스트 카운트
	int selectListCount(String type);
		
	// 마이보드 리스트 카운트
	int selectListCountMyBoard(int memNo);
		
	// 보드 리스트 조회
	ArrayList<Board> selectList(String type, PageInfo pi);
		
	// 마이보드 리스트 조회
	ArrayList<Board> selectMyBoardList(int memNo, PageInfo pi);
		
	// 게시글 쓰기
	int insertBoard(Board b);
	
	// 게시글 조회수 업데이트
	int increseViews(HashMap<String, Integer> map);
	
	// 게시글 상세보기
	Board selectBoard(HashMap<String, Integer> map);
		
	// 게시글 삭제
	int deleteBoard(int boardNo);
		
	// 게시글 수정
	int updateBoard(Board b);
		
	// 좋아요 상태 조회
	int selectLike(HashMap<String, Integer> map);
	
	// 좋아요 누르기
	int insertLike(HashMap<String, Integer> map);
		
	// 좋아요 취소
	int deleteLike(HashMap<String, Integer> map);
		
	
}
