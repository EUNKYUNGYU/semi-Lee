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
 * Servlet implementation class MessageSendController
 */
@WebServlet("/insert.ms")
public class MessageSendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageSendController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		int senderNo = Integer.parseInt(request.getParameter("senderNo"));
		String messageTitle = request.getParameter("messageTitle");
		String receiverId = request.getParameter("receiverId");
		String messageContent = request.getParameter("messageContent");
		
		int receiverNo = new MessageService().searchMember(receiverId);
		if(receiverNo > 0) {
			
			Message m = new Message();
			
			m.setSenderNo(senderNo);
			m.setMessageTitle(messageTitle);
			m.setReceiverNo(receiverNo);
			m.setMessageContent(messageContent);
			
			int result = new MessageService().insertMessage(m);
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "메세지를 보냈습니다.");
				response.sendRedirect(request.getContextPath() + "/list.ms?cpage=1&memNo=" + senderNo + "&type=sender");
				
			} else {
				request.getSession().setAttribute("alertMsg", "메세지 보내기에 실패했습니다. 다시 시도해주십시오.");
				response.sendRedirect(request.getContextPath() + "/list.ms?cpage=1&memNo=" + senderNo + "&type=sender");
			}
		} else {
			request.setAttribute("alertMsg", "메세지 보내기에 실패했습니다. 다시 시도해주십시오.");
			response.sendRedirect(request.getContextPath() + "/list.ms?cpage=1&memNo=" + senderNo + "&type=sender");
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
