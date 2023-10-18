package com.kh.DoctorLee.mpReservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.DoctorLee.mpReservation.model.service.MpReservationService;
import com.kh.DoctorLee.mpReservation.model.vo.MpReservation;

/**
 * Servlet implementation class ReservationHistoryController
 */
@WebServlet("/reservation.h")
public class ReservationHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationHistoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		 int memNo = Integer.parseInt(request.getParameter("mno"));
		 ArrayList<MpReservation> list = new MpReservationService().selectReservation(memNo);
		 request.setAttribute("list", list);
		 
		 
		 RequestDispatcher view = request.getRequestDispatcher("/views/medicalHistory/reservationHistory.jsp");
		 view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
