package com.kh.DoctorLee.cli.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.cli.model.dao.CliDao;
import com.kh.DoctorLee.cli.model.vo.Category;
import com.kh.DoctorLee.cli.model.vo.CliResDate;
import com.kh.DoctorLee.cli.model.vo.CliResTime;
import com.kh.DoctorLee.cli.model.vo.Clinic;

public class CliService {

	public ArrayList<Category> selectCategoryList() {
		Connection conn = getConnection();
		
		ArrayList<Category> list = new CliDao().selectCategoryList(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Clinic> selectCliList(int cateNo){
		Connection conn = getConnection();
		
		ArrayList<Clinic> cliList = new CliDao().selectCliList(conn, cateNo);
		
		close(conn);
		
		return cliList;
	}
	
	public Clinic selectCli(int cliNo) {
		Connection conn = getConnection();
		
		Clinic c = new CliDao().selectCli(conn, cliNo);
		
		close(conn);
		return c;
	}
	
	// 클리닉 예약 가능 날짜 가져오기
	public ArrayList<CliResDate> selectCliDateList(int cliNo){
		Connection conn = getConnection();
		
		ArrayList<CliResDate> list = new CliDao().selectCliDateList(conn, cliNo);
		
		close(conn);
		
		return list;
	}
	
	// 클리닉 예약 가능한 시간 가져오기
	public ArrayList<CliResTime> selectCliTimeList(int cliNo){
		Connection conn = getConnection();
		
		ArrayList<CliResTime> timeList = new CliDao().selectCliTimeList(conn, cliNo);
		
		close(conn);
		
		return timeList;
	}

}
