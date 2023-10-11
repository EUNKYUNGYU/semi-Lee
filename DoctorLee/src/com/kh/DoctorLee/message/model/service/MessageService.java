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
	
	
}
