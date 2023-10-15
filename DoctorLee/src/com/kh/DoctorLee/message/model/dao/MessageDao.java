package com.kh.DoctorLee.message.model.dao;

import static com.kh.DoctorLee.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.DoctorLee.common.model.vo.PageInfo;
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
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public ArrayList<Message> selectList(Connection conn, String type, int memNo, PageInfo pi){
		ArrayList<Message> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = 
				
					"SELECT * "
					+ "FROM ( "
					+ "SELECT ROWNUM RNUM, A.* "
					+ "FROM( "
					+ "SELECT "
					+ "MESSAGE_NO, MEM_ID, MESSAGE_TITLE, SEND_DATE, READ_STATUS " 
					+ "FROM " 
					+ "TB_MESSAGE "
					+ "JOIN " 
					+ "TB_MEMBER ON(MEM_NO = SENDER) " 
					+ "WHERE " 
					+ type
					+ " = ? " 
					+ "AND " 
					+ "TB_MESSAGE.STATUS = 'Y' " 
					+ "ORDER BY SEND_DATE DESC ) A ) "
					+ "WHERE " 
					+ "RNUM BETWEEN ? AND ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
			System.out.println("메세지 디테일 Dao m : " + m);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int searchMember(Connection conn, String receiverId) {
		
		System.out.println("searchMember Dao " + receiverId);
		int receiverNo = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchMember");
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, receiverId);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				receiverNo = rset.getInt("MEM_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return receiverNo;
		
	}
			
			
	public int insertMessage(Connection conn, Message m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMessage");
		System.out.println("메세지 Dao insertMessage : " + m);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getSenderNo());
			pstmt.setInt(2, m.getReceiverNo());
			pstmt.setString(3, m.getMessageTitle());
			pstmt.setString(4, m.getMessageContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteMessage(Connection conn, int messageNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMessage");
		System.out.println("메세지 삭제 Dao: " + messageNo);
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
	
	
}
