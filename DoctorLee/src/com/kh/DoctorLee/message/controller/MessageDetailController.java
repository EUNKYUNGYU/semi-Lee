package com.kh.DoctorLee.message.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.message.model.service.MessageService;
import com.kh.DoctorLee.message.model.vo.Message;

/**
 * Servlet implementation class MessageDetailController
 */
@WebServlet("/detail.ms")
public class MessageDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int messageNo = Integer.parseInt(request.getParameter("messageNo"));
		
		int result = new MessageService().updateReadStatus(messageNo);
		if(result > 0) {
			
			Message m = new MessageService().selectMessage(messageNo);
			request.setAttribute("m", m);
			request.setAttribute("messageNo", messageNo);
			request.getRequestDispatcher("views/message/messageDetailView.jsp").forward(request, response);
			
		} else {
			request.getSession().setAttribute("alertMsg", "쪽지 조회에 실패 했습니다. 다시 시도해주십시오.");
			response.sendRedirect(request.getContextPath() + "/list.ms");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
