package com.kh.DoctorLee.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		int rsvtDoc = Integer.parseInt(request.getParameter("rsvtDoc")); // value or text?
		
		
		String rsvtTime = rsvtH + rsvtM;
		
		Reservation rsvt = new Reservation();
		rsvt.setRsvtDate(rsvtDate);
		rsvt.setRsvtTime(rsvtTime);
		rsvt.setRsvtMem(Integer.parseInt(rsvtName));
		rsvt.setMemInfo(rsvtInfo);
		rsvt.setRsvtDoc(rsvtDoc);
		
		int result = new ReservationService().insertRsvt(rsvt);
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
