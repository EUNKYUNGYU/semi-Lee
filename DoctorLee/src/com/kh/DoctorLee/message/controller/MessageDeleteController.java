package com.kh.DoctorLee.message.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.message.model.service.MessageService;

/**
 * Servlet implementation class MessageDeleteController
 */
@WebServlet("/delete.ms")
public class MessageDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int messageNo = Integer.parseInt(request.getParameter("messageNo"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		System.out.println("메세지 삭제 컨트롤러: " + messageNo);
		int result = new MessageService().deleteMessage(messageNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "메세지 삭제에 성공했습니다.");
			response.sendRedirect(request.getContextPath() + "/list.ms?cpage=1&memNo=" + memberNo + "&type=sender");
		} else {
			request.getSession().setAttribute("alertMsg", "메세지 삭제에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/list.ms?cpage=1&memNo=" + memberNo + "&type=sender");
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
