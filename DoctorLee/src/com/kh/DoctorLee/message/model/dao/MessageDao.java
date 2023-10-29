package com.kh.DoctorLee.message.model.dao;

import static com.kh.DoctorLee.common.JDBCTemplate.close;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.message.model.vo.Message;

public class MessageDao {

	public int selectListCountReciever(SqlSession sqlSession, String memNo) {
		 
		return sqlSession.selectOne("messageMapper.selectListCountReciever", memNo);
	}
	
	public int selectListCountSender(SqlSession sqlSession, String memNo) {
		 
		return sqlSession.selectOne("messageMapper.selectListCountSender", memNo);
	}
	
	public ArrayList<Message> selectListReciever(SqlSession sqlSession, String memNo, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("messageMapper.selectListReciever", memNo, rowBounds);
		
	}
	
	public ArrayList<Message> selectListSender(SqlSession sqlSession, String memNo, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("messageMapper.selectListSender", memNo, rowBounds);
		
	}
	
	public int updateReadStatus(SqlSession sqlSession, int messageNo) {
		
		return sqlSession.update("messageMapper.updateReadStatus", messageNo);
	}
	
	
	
	public Message selectMessage(SqlSession sqlSession, int messageNo) {

		System.out.println("selectMessage Dao에서 " + sqlSession.selectList("messageMapper.selectMessage", messageNo));
		
		return sqlSession.selectOne("messageMapper.selectMessage", messageNo);
	}
	
	
	public int searchMember(SqlSession sqlSession, String receiverId) {
		
		return sqlSession.selectOne("messageMapper.searchMember", receiverId);
	}
			
			
	public int insertMessage(SqlSession sqlSession, Message m) {
		
		System.out.println(m);
		return sqlSession.insert("messageMapper.insertMessage", m);
	}
	
	public int deleteMessage(SqlSession sqlSession, int messageNo) {
		System.out.println(messageNo);
		System.out.println("deleteMessage Dao "+sqlSession.delete("messageMapper.deleteMessage", messageNo));
		return sqlSession.delete("messageMapper.deleteMessage", messageNo);
	}
	
	
}
