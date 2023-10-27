package com.kh.DoctorLee.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.DoctorLee.reservation.model.service.ReservationService;
import com.kh.DoctorLee.reservation.model.vo.Reservation;

/**
 * Servlet implementation class MemReservationController
 */
@WebServlet("/hosRsvt.mem")
public class HosRsvtMemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosRsvtMemController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String rsvtDate = request.getParameter("rsvtDate");
		String rsvtH = request.getParameter("rsvtH");
		String rsvtM = request.getParameter("rsvtM");
		String rsvtName = request.getParameter("rsvtName");
		String rsvtInfo = request.getParameter("rsvtInfo");
		String rsvtDoc = request.getParameter("rsvtDoc");
		String hno = request.getParameter("hno");
		String rsvtTime = rsvtH + rsvtM;
		// System.out.println(hno);
		// System.out.println(rsvtTime);
		
		// insert하기 전 date + h + m 시간 체크 
		int checkRsvtResult = new ReservationService().checkRsvtTreat(rsvtDate, rsvtTime);
		//System.out.println(rsvtDate);
		//System.out.println(rsvtTime);
		System.out.println(checkRsvtResult);
		
		
		// result가 0보다 크면 겹치는 예약
		/*
		if(checkRsvtResult > 0) {
			// response.sendRedirect(request.getContextPath() + "/hosDetail.dy?hno=" + hno);
			request.setAttribute("checkRsvtResult", checkRsvtResult);
			System.out.println(checkRsvtResult);
			//request.setAttribute("error", "다른 날짜(시간)를 선택해주세요.");
			//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

		} else {
		*/
			Reservation rsvt = new Reservation();
			rsvt.setRsvtDate(rsvtDate);
			rsvt.setRsvtTime(rsvtTime);
			rsvt.setRsvtDoc(rsvtDoc);
			rsvt.setRsvtMem(rsvtName);
			rsvt.setMemInfo(rsvtInfo);
			rsvt.setRsvtHos(hno);
			
			int result = new ReservationService().insertRsvt(rsvt);
			
			if(result > 0) {
				
				response.setContentType("application/json; charset=UTF-8");
				JSONObject jO = new JSONObject();
				
				Reservation selectRsvt = new ReservationService().selectRsvt(rsvtName);
				
				jO.put("rsvtDate", selectRsvt.getRsvtDate());
				jO.put("rsvtTime", selectRsvt.getRsvtTime());
				jO.put("rsvtName", selectRsvt.getRsvtMem());
				jO.put("rsvtInfo", selectRsvt.getMemInfo());
				jO.put("rsvtDoc", selectRsvt.getRsvtDoc());
				jO.put("rsvtNo", selectRsvt.getRsvtNo());
				jO.put("checkRsvtResult", checkRsvtResult);
				
				// request.setAttribute("rsvtResult", rsvtResult);
				// response.sendRedirect(request.getContextPath() + "/hosDetail.dy?hno=" + hno);
				response.getWriter().print(jO);
				System.out.println(selectRsvt.getMemInfo());
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
