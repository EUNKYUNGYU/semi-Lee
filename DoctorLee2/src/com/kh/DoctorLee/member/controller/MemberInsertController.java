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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		String memName = request.getParameter("memName");
		String nickName = request.getParameter("nickName");
		String phone = request.getParameter("phone");
		String iNum = request.getParameter("iNum");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		int height = Integer.parseInt(request.getParameter("height"));
		int weight = Integer.parseInt(request.getParameter("weight"));
		String[] diseasesArr = request.getParameterValues("diseases");
		String[] inhaleAllArr = request.getParameterValues("inhaleAll");
		String[] foodAllArr = request.getParameterValues("foodAll");
		
		String diseases = "";
		if(diseasesArr != null) {
			diseases = String.join(",", diseasesArr);
		}
		
		String inhaleAll = "";
		if(inhaleAllArr != null) {
			inhaleAll = String.join(",", inhaleAllArr);
		}
		
		String foodAll = "";
		if(foodAllArr != null) {
			foodAll = String.join(",", foodAllArr);
		}
		
		Member m = new Member();
		m.setMemId(memId);
		m.setMemPwd(memPwd);
		m.setMemName(memName);
		m.setNickName(nickName);
		m.setPhone(phone);
		m.setINum(iNum);
		m.setEmail(email);
		m.setGender(gender);
		m.setHeight(height);
		m.setWeight(weight);
		m.setDiseases(diseases);
		m.setInhaleAll(inhaleAll);
		m.setFoodAll(foodAll);
		
		int result = new MemberService().insertMember(m);
	
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입에 성공하셨습니다.");
			response.sendRedirect(request.getContextPath() + "/views/member/memberEnrollFormAfter.jsp");
			
		} else {
			request.setAttribute("errorMsg", "회원가입에 실패하였습니다");
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
