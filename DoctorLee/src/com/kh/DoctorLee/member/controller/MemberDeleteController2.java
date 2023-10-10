package com.kh.DoctorLee.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.DoctorLee.member.model.service.MemberService;
import com.kh.DoctorLee.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController2
 */
@WebServlet("/delete2.me")
public class MemberDeleteController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String memPwd = request.getParameter("userPwd");
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int result = new MemberService().deleteMember(memNo, memPwd);
		if(result > 0) {
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("errorMsg", "실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
