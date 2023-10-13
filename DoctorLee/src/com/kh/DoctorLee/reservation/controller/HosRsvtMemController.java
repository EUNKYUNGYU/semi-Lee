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
		
		String rsvtDate = request.getParameter("rsvt_date");
		String rsvtH = request.getParameter("rsvtH");
		String rsvtM = request.getParameter("rsvtM");
		String rsvtTime = rsvtH + rsvtM;
		String rsvtName = request.getParameter("rsvtName");
		String rsvtInfo = request.getParameter("rsvtInfo");
		String rsvtDoc = request.getParameter("rsvtDoc");
		String rsvtHos = request.getParameter("hno");
		
		Reservation rsvt = new Reservation();
		rsvt.setRsvtDate(rsvtDate);
		rsvt.setRsvtTime(rsvtTime);
		rsvt.setRsvtMem(rsvtName);
		rsvt.setMemInfo(rsvtInfo);
		rsvt.setRsvtDoc(rsvtDoc);
		rsvt.setRsvtHos(rsvtHos);
		
		int result = new ReservationService().insertRsvt(rsvt); // 예약 insert
		
		if(result > 0) { // insert 성공
			Reservation selectRsvt = new ReservationService().selectRsvt(rsvtName);
			
			if(selectRsvt != null) { // 조회 성공
				
				JSONObject jsonR = new JSONObject();
				jsonR.put("rsvtNo", selectRsvt.getRsvtNo());
				jsonR.put("rsvt_date", selectRsvt.getRsvtDate());
				jsonR.put("rsvtTime", selectRsvt.getRsvtTime());
				jsonR.put("rsvtName", selectRsvt.getRsvtMem());
				jsonR.put("rsvtInfo", selectRsvt.getMemInfo());
				jsonR.put("rsvtHos", selectRsvt.getRsvtHos());
				jsonR.put("rsvtDoc", selectRsvt.getRsvtDoc());
				
				response.setContentType("application/json; charset=UTF-8");
				response.getWriter().print(jsonR);
				
				response.sendRedirect(request.getContextPath() + "/hosDetail.dy?hno=" + rsvt.getRsvtHos());
			}
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
