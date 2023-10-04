package com.kh.DoctorLee.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		
		Member m = new Member();
		m.setMemId(memId);
		m.setMemPwd(memPwd);
		m.setMemName(memName);
		m.setNickName(nickName);
		m.setPhone(phone);
		m.setiNum(iNum);
		m.setEmail(email);
		m.setGender(gender);
		m.setHeight(height);
		m.setWeight(weight);
		
		new MemberService().insertMember(m);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
