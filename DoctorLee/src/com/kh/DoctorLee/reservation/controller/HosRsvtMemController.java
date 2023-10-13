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
		rsvt.setRsvtMem(rsvtName);
		rsvt.setMemInfo(rsvtInfo);
		rsvt.setRsvtDoc(rsvtDoc);
		
		int result = new ReservationService().insertRsvt(rsvt); // ¿¹¾à insert
		
		rsvt = new ReservationService().selectRsvt(rsvtName);
		
		JSONObject jsonR = new JSONObject();
		jsonR.put("rsvtNo", rsvt.getRsvtNo());
		jsonR.put("rsvtDate", rsvt.getRsvtDate());
		jsonR.put("rsvtTime", rsvt.getRsvtTime());
		jsonR.put("rsvtName", rsvt.getRsvtMem());
		jsonR.put("rsvtInfo", rsvt.getMemInfo());
		jsonR.put("rsvtHos", rsvt.getRsvtHos());
		jsonR.put("rsvtDoc", rsvt.getRsvtDoc());
		
		if(result > 0) {
			request.setAttribute("rsvt", rsvt);
			response.sendRedirect(request.getContextPath() + "hosDetail.jsp");
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(jsonR);
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
