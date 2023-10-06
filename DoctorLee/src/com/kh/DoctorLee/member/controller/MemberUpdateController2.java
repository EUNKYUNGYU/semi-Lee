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
 * Servlet implementation class MemberUpdateController2
 */
@WebServlet("/update2.me")
public class MemberUpdateController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memName = request.getParameter("memName");
		String nickName = request.getParameter("nickName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String memId = request.getParameter("memId");
		
		Member m = new Member();
		m.setMemName(memName);
		m.setNickName(nickName);
		m.setPhone(phone);
		m.setEmail(email);
		m.setMemId(memId);
		
		int result = new MemberService().updateMember(m);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원 정보 수정 성공");
			
			Member updateMem = new MemberService().selectMember(memId);
			session.setAttribute("loginUser", updateMem);
			
			response.sendRedirect(request.getContextPath() + "/myPage.me");
			
		} else {
			request.setAttribute("errorMsg", "다시 수정 해주세요.");
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
