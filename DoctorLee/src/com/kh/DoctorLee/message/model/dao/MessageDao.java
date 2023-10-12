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
					+ "MESSAGE_NO, MEM_ID, MESSAGE_TITLE, SEND_DATE, READ_STATUS " 
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
				msg.setMessageNo(rset.getInt("MESSAGE_NO"));
				msg.setReceiver(rset.getString("MEM_ID"));
				msg.setMessageTitle(rset.getString("MESSAGE_TITLE"));
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
	
	public int updateReadStatus(Connection conn, int messageNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReadStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageNo);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	public Message selectMessage(Connection conn, int messageNo) {
		Message m = new Message();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageNo);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				m.setMessageTitle(rset.getString("MESSAGE_TITLE"));
				m.setSender(rset.getString("MEM_ID"));
				m.setSendDate(rset.getString("SEND_DATE"));
				m.setMessageContent(rset.getString("MESSAGE_CONTENT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int insertMessage(Connection conn) {
		
		int result = 0;
		
		
		return result;
	}
	
	
}
