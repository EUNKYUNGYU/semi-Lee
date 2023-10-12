package com.kh.DoctorLee.message.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.message.model.dao.MessageDao;
import com.kh.DoctorLee.message.model.vo.Message;

public class MessageService {

	public ArrayList<Message> selectList(String type, int memNo){
		
		Connection conn = getConnection();
		ArrayList<Message> list = new MessageDao().selectList(conn, type, memNo);
		close(conn);
		return list;
	}
	
	public int updateReadStatus(int messageNo) {
		Connection conn = getConnection();
		int result = new MessageDao().updateReadStatus(conn, messageNo);
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
		close(conn);
		return result;
		
	}
	
	
}
