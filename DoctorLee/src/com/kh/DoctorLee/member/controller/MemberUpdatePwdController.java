package com.kh.DoctorLee.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.DoctorLee.member.model.service.MemberService;
import com.kh.DoctorLee.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class MemberUpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		String memId = loginUser.getMemId();
		int num = Integer.parseInt(request.getParameter("memNo"));
		
		// 값 뽑기
		String memPwd = request.getParameter("memPwd");
		String updatePwd = request.getParameter("updatePwd");
		
		// 서비스 넘기기
		int result = new MemberService().updatePwdMember(memNo, memPwd, updatePwd);
	
		
		if(result > 0) {
			session.setAttribute("alertMsg", "비밀번호 변경 성공");
			session.setAttribute("loginUser", new MemberService().selectMember(memId));
		} else {
			session.setAttribute("alertMsg", "비밀번호 변경 실패");
		}
		
		// 돌려줄 페이지
		response.sendRedirect(request.getContextPath() + "/updateForm.me");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
