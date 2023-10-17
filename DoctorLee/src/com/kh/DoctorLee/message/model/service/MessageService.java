package com.kh.DoctorLee.message.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.commit;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;
import static com.kh.DoctorLee.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.message.model.dao.MessageDao;
import com.kh.DoctorLee.message.model.vo.Message;

public class MessageService {
	
	public int selectListCount(String type, int memNo) {
		
		Connection conn = getConnection();
		int listCount = new MessageDao().selectListCount(conn, type, memNo);
		close(conn);
		return listCount;
	}
	
	//@@type = 메지지를 받는 사람인지, 보내는 사람인지 나타내는 변수 (sender/receiver)
	public ArrayList<Message> selectList(String type, int memNo, PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Message> list = new MessageDao().selectList(conn, type, memNo, pi);
		close(conn);
		return list;
	}
	
	public int updateReadStatus(int messageNo) {
		
		Connection conn = getConnection();
		int result = new MessageDao().updateReadStatus(conn, messageNo);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Message selectMessage(int messageNo){
		
		Connection conn = getConnection();
		Message m = new MessageDao().selectMessage(conn, messageNo);
		close(conn);
		return m;
	}
	
	public int searchMember(String receiverId) {
		System.out.println("searchMember Service " + receiverId);
		Connection conn = getConnection();
		int receiverNo = new MessageDao().searchMember(conn, receiverId);
		close(conn);
		return receiverNo;
		
	}
	
	public int insertMessage(Message m) {
		Connection conn = getConnection();
		int result = new MessageDao().insertMessage(conn, m);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	public int deleteMessage(int messageNo) {
		Connection conn = getConnection();
		int result = new MessageDao().deleteMessage(conn, messageNo);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
}
