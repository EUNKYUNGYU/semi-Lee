package com.kh.DoctorLee.message.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.DoctorLee.common.JDBCTemplate.*;
import com.kh.DoctorLee.message.model.vo.Message;

public class MessageDao {

	private Properties prop = new Properties();
	
	public MessageDao() {
		String filePath = MessageDao.class.getResource("/sql/message/message-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Message> selectList(Connection conn, String type, int memNo){
		ArrayList<Message> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT "
					+ "MEM_ID, MESSAGE_CONTENT, SEND_DATE, READ_STATUS " 
					+ "FROM " 
					+ "TB_MESSAGE "
					+ "JOIN " 
					+ "TB_MEMBER ON(MEM_NO = SENDER) " 
					+ "WHERE " 
					+ type
					+ " = ?" 
					+ "AND " 
					+ "TB_MESSAGE.STATUS = 'Y' " 
					+ "ORDER BY SEND_DATE DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Message msg = new Message();
				msg.setReceiver(rset.getString("MEM_ID"));
				msg.setMessageContent(rset.getString("MESSAGE_CONTENT"));
				msg.setSendDate(rset.getString("SEND_DATE"));
				msg.setReadStatus(rset.getString("READ_STATUS"));
				list.add(msg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	
}
