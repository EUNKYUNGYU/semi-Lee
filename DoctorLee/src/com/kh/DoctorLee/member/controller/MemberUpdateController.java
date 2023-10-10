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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		System.out.println("넌 할 수 있어");
		
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
		
		System.out.println(memId);
		
		int result = new MemberService().updateMember(m);
		System.out.println(result);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원 정보 수정 성공");
			
			//case1
			//Member updateMem = new MemberService().selectMember(memId);
			
			//case2
			String memPwd = ((Member)session.getAttribute("loginUser")).getMemPwd();
			Member updateMem = new MemberService().loginMember(memId, memPwd);
			
			//리다이렉트
			session.setAttribute("loginUser", updateMem);
			
			//정보 수정 성공하고나서 나올 화면
			response.sendRedirect(request.getContextPath() + "/updateForm.me");
			
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
