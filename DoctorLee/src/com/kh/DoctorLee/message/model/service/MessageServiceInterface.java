package com.kh.DoctorLee.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.message.model.vo.Message;

public interface MessageServiceInterface {

	// 메세지 리스트 카운트
	int selectListCount(String memNo, String type);
	
	// 메세지 리스트 조회
	ArrayList<Message> selectList(String memNo, String type, PageInfo pi);
	
	// 메세지 읽음 상태 업데이트
	int updateReadStatus(int messageNo);
	
	// 메세지 상세보기
	Message selectMessage(int messageNo);
	
	// 메세지 보낼 memberId로 memberNo찾기
	int searchMember(String receiverId);
	
	// 메세지 보내기
	int insertMessage(Message m);
	
	// 메세지 삭제하기
	int deleteMessage(int messageNo);
	
}
