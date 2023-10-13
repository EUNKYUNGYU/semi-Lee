package com.kh.DoctorLee.hospital.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.reservation.model.vo.Reservation;

/**
 * Servlet implementation class HosRsvtMemController
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
		String rsvtTime = rsvtH + rsvtM;
		String rsvtName = request.getParameter("rsvtName");
		String rsvtInfo = request.getParameter("rsvtInfo");
		String rsvtDoc = request.getParameter("rsvtDoc");
		
		Reservation rsvt = new Reservation();
		rsvt.setRsvtDate(rsvtDate);
		rsvt.setRsvtTime(rsvtTime);
		rsvt.setRsvtMem(rsvtMem);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
