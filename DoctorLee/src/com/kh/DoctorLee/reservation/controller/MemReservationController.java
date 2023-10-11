package com.kh.DoctorLee.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.member.model.vo.Member;
import com.kh.DoctorLee.reservation.model.service.ReservationService;
import com.kh.DoctorLee.reservation.model.vo.Reservation;

/**
 * Servlet implementation class MemReservationController
 */
@WebServlet("/hosRsvt.mem")
public class MemReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemReservationController() {
        super();
        // TODO Auto-generated constructor stub
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
		
		Reservation rsvt = new Reservation();
		rsvt.setRsvtDate(rsvtDate);
		rsvt.setRsvtTime(rsvtTime);
		rsvt.setRsvtDoc(rsvtDoc);
		rsvt.setRsvtMem(rsvtName);
		rsvt.setMemInfo(rsvtInfo);
		rsvt.setRsvtHos(hno);
		
		int result = new ReservationService().insertRsvt(rsvt);
		
		Reservation rsvtResult = new ReservationService().selectRsvt(rsvtName);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/hosDetail.dy?hno=" + hno);
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
