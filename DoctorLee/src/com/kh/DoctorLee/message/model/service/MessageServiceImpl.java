package com.kh.DoctorLee.message.model.service;

import static com.kh.DoctorLee.common.template.Template.getSqlSession;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.message.model.dao.MessageDao;
import com.kh.DoctorLee.message.model.vo.Message;

public class MessageServiceImpl implements MessageServiceInterface{

	MessageDao messageDao = new MessageDao();
	
	@Override
	public int selectListCount(String memNo, String type) {
		
		SqlSession sqlSession = getSqlSession();
		int listCount = 0;
		if("receiver".equals(type)) {
			listCount = messageDao.selectListCountReciever(sqlSession, memNo);
		} else {
			listCount = messageDao.selectListCountSender(sqlSession, memNo);
		}
		sqlSession.close();
		return listCount;
	}
	
	@Override
	public ArrayList<Message> selectList(String memNo, String type, PageInfo pi) {
		
		SqlSession sqlSession = getSqlSession();
		ArrayList<Message> list = new ArrayList();
		if("receiver".equals(type)) {
			list = messageDao.selectListReciever(sqlSession, memNo, pi);
		} else {
			list = messageDao.selectListSender(sqlSession, memNo, pi);
		}
		sqlSession.close();
		return list;
	}

	@Override
	public int updateReadStatus(int messageNo) {

		SqlSession sqlSession = getSqlSession();
		System.out.println("updateReadStatus 서비스에서 " + messageDao.updateReadStatus(sqlSession, messageNo));
		int result = messageDao.updateReadStatus(sqlSession, messageNo);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

	@Override
	public Message selectMessage(int messageNo) {

		SqlSession sqlSession = getSqlSession();	
		Message m = messageDao.selectMessage(sqlSession, messageNo);
		System.out.println("selectMessage 서비스에서 " + m);
		sqlSession.close();
		return m;
	}

	@Override
	public int searchMember(String receiverId) {

		SqlSession sqlSession = getSqlSession();
		int receiverNo = messageDao.searchMember(sqlSession, receiverId);
		sqlSession.close();
		return receiverNo;
	}

	@Override
	public int insertMessage(Message m) {
		
		SqlSession sqlSession = getSqlSession();
		int result = messageDao.insertMessage(sqlSession, m);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

	@Override
	public int deleteMessage(int messageNo) {
		
		SqlSession sqlSession = getSqlSession();
		int result = messageDao.deleteMessage(sqlSession, messageNo);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

}
