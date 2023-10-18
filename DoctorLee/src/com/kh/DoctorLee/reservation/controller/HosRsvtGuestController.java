package com.kh.DoctorLee.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.DoctorLee.reservation.model.service.ReservationService;
import com.kh.DoctorLee.reservation.model.vo.GuestReservation;

/**
 * Servlet implementation class HosRsvtGuestController
 */
@WebServlet("/hosRsvt.guest")
public class HosRsvtGuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosRsvtGuestController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String rsvtDateG = request.getParameter("rsvtDate_G");
		String rsvtTimeG = request.getParameter("rsvtH_G") + request.getParameter("rsvtM_G");
		String rsvtNameG = request.getParameter("rsvtName_G");
		String rsvtInfoG = request.getParameter("rsvtInfo_G");
		String rsvtDocG = request.getParameter("rsvtDoc_G");
		String hno = request.getParameter("hno");
		
		int checkRsvtResult = new ReservationService().checkRsvtTreatG(rsvtDateG, rsvtTimeG);
		
		GuestReservation g = new GuestReservation();
		g.setGuestRsvtDate(rsvtDateG);
		g.setGuestRsvtTime(rsvtTimeG);
		g.setRsvtGuest(rsvtNameG);
		g.setGuestRsvtInfo(rsvtInfoG);
		g.setGuestRsvtDoc(rsvtDocG);
		g.setGuestRsvtDoc(rsvtDocG);
		g.setGuestRsvtHos(hno);
		
		int result = new ReservationService().insertRsvtG(g);
		
		if(result > 0) {
			
			GuestReservation selectG = new ReservationService().selectRsvtG(rsvtNameG);
			JSONObject jOb = new JSONObject();
			
			response.setContentType("application/json; charset=UTF-8");
			
			jOb.put("checkRsvtTreat", checkRsvtResult);
			jOb.put("rsvtDate_G", selectG.getGuestRsvtDate());
			jOb.put("rsvtTime_G", selectG.getGuestRsvtTime());
			jOb.put("rsvtInfo_G", selectG.getGuestRsvtInfo());
			jOb.put("rsvtDoc_G", selectG.getGuestRsvtDoc());
			jOb.put("rsvtNo_G", selectG.getGuestRsvtNo());
			jOb.put("rsvtGuest", selectG.getRsvtGuest());
			//System.out.println(selectG);
			
			response.getWriter().print(jOb);
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
