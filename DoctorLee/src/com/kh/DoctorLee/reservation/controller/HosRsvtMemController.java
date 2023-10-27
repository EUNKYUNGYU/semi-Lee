package com.kh.DoctorLee.reservation.controller;

import java.io.IOException;
import java.util.HashMap;

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
		ReservationService rsvtService = new ReservationService();
		
		String rsvtDate = request.getParameter("rsvtDate");
		String rsvtH = request.getParameter("rsvtH");
		String rsvtM = request.getParameter("rsvtM");
		String rsvtName = request.getParameter("rsvtName");
		String rsvtInfo = request.getParameter("rsvtInfo");
		String rsvtDoc = request.getParameter("rsvtDoc");
		String hno = request.getParameter("hno");
		String rsvtTime = rsvtH + rsvtM;
		
		// insert하기 전 date + h + m 시간 체크 
		HashMap<String, String> map = new HashMap();
		map.put("rsvtDate", rsvtDate);
		map.put("rsvtTime", rsvtTime);
		int checkRsvtResult = rsvtService.checkRsvtTreat(map);
		
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
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
