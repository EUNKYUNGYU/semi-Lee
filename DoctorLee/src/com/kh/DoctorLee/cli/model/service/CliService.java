package com.kh.DoctorLee.cli.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.commit;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;
import static com.kh.DoctorLee.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.cli.model.dao.CliDao;
import com.kh.DoctorLee.cli.model.vo.Category;
import com.kh.DoctorLee.cli.model.vo.CliRes;
import com.kh.DoctorLee.cli.model.vo.CliResTime;
import com.kh.DoctorLee.cli.model.vo.CliRev;
import com.kh.DoctorLee.cli.model.vo.Clinic;
import com.kh.DoctorLee.member.model.vo.Member;

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
	public ArrayList<CliResTime> selectResDate(int cliNo){
		Connection conn = getConnection();
		
		ArrayList<CliResTime> list = new CliDao().selectResDate(conn, cliNo);
		
		close(conn);
		
		return list;
	}
	
	// 클리닉 예약 가능 시간 가져오기
	public ArrayList<CliResTime> selectCliTimeList(int cliNo, String resDate){
		Connection conn = getConnection();
		
		ArrayList<CliResTime> list = new CliDao().selectCliTimeList(conn, cliNo, resDate);
		
		close(conn);
		
		return list;
	}

	
	// 클리닉 예약하기
	public int insertCliRes(CliRes c) {
		Connection conn = getConnection();
		
		int result = new CliDao().insertCliRes(conn, c);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 클리닉 예약자 정보 불러오기
	public int selectResMem(int cliNo, Member loginUser){
		Connection conn = getConnection();
		
		int result = new CliDao().selectResMem(conn, cliNo, loginUser);
		
		close(conn);
		
		return result;
	}
	
	// 클리닉 리뷰 작성
	public int insertCliRev(CliRev c) {
		Connection conn = getConnection();
		
		int result = new CliDao().insertCliRev(conn, c);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 클리닉 평점 가져오기
	public Double selectCliScope(int cliNo) {
		Connection conn = getConnection();
		
		Double scope = new CliDao().selectCliScope(conn, cliNo);
		
		close(conn);
		
		return scope;
	}
	
	// 클리닉 리뷰 가져오기
	public ArrayList<CliRev> selectCliRevList(int cliNo){
		Connection conn = getConnection();
		
		ArrayList<CliRev> list = new CliDao().selectCliRevList(conn, cliNo);
		
		close(conn);
		
		return list;
	}
	
	// 한 사람 당 한 번만 리뷰 작성 가능하게
	public int selectRevCount(int cliNo, Member loginUser) {
		Connection conn = getConnection();
		
		int result2 = new CliDao().selectRevCount(conn, cliNo, loginUser);
		
		close(conn);
		
		return result2;
	}

}
