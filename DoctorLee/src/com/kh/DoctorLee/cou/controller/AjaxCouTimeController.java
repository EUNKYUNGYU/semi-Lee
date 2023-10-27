package com.kh.DoctorLee.cou.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.DoctorLee.cou.model.service.CouService;
import com.kh.DoctorLee.cou.model.vo.CouRes;
import com.kh.DoctorLee.cou.model.vo.CouResTime;

/**
 * Servlet implementation class AjaxTimeController
 */
@WebServlet("/ajaxTime.cou" )
public class AjaxCouTimeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCouTimeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 값 뽑기
		int couNo = Integer.parseInt(request.getParameter("couNo"));
		String resDate = (request.getParameter("resDate")).replace(".", "-");
		
		// Service 요청
		CouRes cr = new CouRes();
		cr.setCouNo(couNo);
		cr.setResDate(resDate);
		ArrayList<CouResTime> timeList = new CouService().selectCouTimeList(cr);
//		System.out.println(timeList);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(timeList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
