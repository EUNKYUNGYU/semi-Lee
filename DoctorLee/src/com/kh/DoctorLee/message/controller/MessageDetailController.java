package com.kh.DoctorLee.message.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.message.model.service.MessageService;
import com.kh.DoctorLee.message.model.service.MessageServiceImpl;
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

		int messageNo = Integer.parseInt(request.getParameter("messageNo"));
		int result = 0;
		String type = request.getParameter("type");
		
		
		if("receiver".equals(type)) { // 쪽지를 받은 사람이 조회 했을 때만 READ_STATUS를 'Y'로 바꾸기
			result = new MessageServiceImpl().updateReadStatus(messageNo);
		} else { // 쪽지를 읽는 사람이 조회 한 경우는 바로 다음 단계인 쪽지 조회로 넘어가기 위해 result에 1을 대입했음
			result = 1;
		}
		
		if(result > 0) { // READ_STATUS를 'Y'로 바꾸기 성공 했을 경우
			
			Message m = new MessageServiceImpl().selectMessage(messageNo);
			
			if(m != null) { // 메세지 조회에 성공 했을 경우
				request.setAttribute("m", m);
				request.setAttribute("messageNo", messageNo);
				request.getRequestDispatcher("views/message/messageDetailView.jsp").forward(request, response);
			} else { // 메세지 조회에 실패 했을 경우
				request.getSession().setAttribute("alertMsg", "쪽지 조회에 실패 했습니다. 다시 시도해주십시오.");
				response.sendRedirect(request.getContextPath() + "/list.ms");
			}
			
		} else { // READ_STATUS를 'Y'로 바꾸기 실패 했을 경우
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
