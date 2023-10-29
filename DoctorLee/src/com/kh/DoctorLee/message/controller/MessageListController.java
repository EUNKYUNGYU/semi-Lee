package com.kh.DoctorLee.message.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.common.model.vo.PageInfo;
import com.kh.DoctorLee.common.template.Pagination;
import com.kh.DoctorLee.message.model.service.MessageServiceImpl;
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
		
		String memNo = request.getParameter("memNo");
		String type = request.getParameter("type");
		
		int listCount = new MessageServiceImpl().selectListCount(memNo, type);
		
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Message> list = new MessageServiceImpl().selectList(memNo, type, pi);
		
		request.setAttribute("type", type);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
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
