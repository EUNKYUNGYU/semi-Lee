package com.kh.DoctorLee.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.message.model.service.MessageService;
import com.kh.DoctorLee.message.model.vo.Message;

/**
 * Servlet implementation class MessageListController
 */
@WebServlet("/list.ms")
public class MessageListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 받은 쪽지, 보낸 쪽지 리스트 전체보기
		// 요청 받을 때 쿼리 스트링으로 memNo과 type(받은 쪽지를 볼 것인지, 보낸 쪽지를 볼 것인지)를 받음
		// type이 receiver이라면 받은 쪽지 / sender라면 보낸 쪽지의 리스트를 불러 옴
		
		request.setCharacterEncoding("UTF-8");
		
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		String type = request.getParameter("type");
		ArrayList<Message> list = new MessageService().selectList(type, memNo);
				
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/message/messageListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
