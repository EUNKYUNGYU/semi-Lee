package com.kh.DoctorLee.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MessageSendFromMyBoardController
 */
@WebServlet("/insertMem.ms")
public class MessageSendFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageSendFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String receiverId = request.getParameter("receiverId");
		int receiverNo = Integer.parseInt(request.getParameter("receiverNo"));
		
		System.out.println("messageEnrollFormMy컨트롤러에서 receiverId "+ receiverId +"receiverNo "+receiverNo);
		request.getSession().setAttribute("receiverId", receiverId);
		request.getSession().setAttribute("receiverNo", receiverNo);
		request.getRequestDispatcher(request.getContextPath() + "/views/message/messageEnrollFormMyBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
