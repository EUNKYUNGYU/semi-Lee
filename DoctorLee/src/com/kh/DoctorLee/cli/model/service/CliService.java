package com.kh.DoctorLee.cli.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.close;
import static com.kh.DoctorLee.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.cli.model.dao.CliDao;
import com.kh.DoctorLee.cli.model.vo.Category;
import com.kh.DoctorLee.cli.model.vo.Clinic;

public class CliService {

	public ArrayList<Category> selectCategoryList() {
		Connection conn = getConnection();
		
		ArrayList<Category> list = new CliDao().selectCategoryList(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Clinic> selectCliList(){
		Connection conn = getConnection();
		
		ArrayList<Clinic> cliList = new CliDao().selectCliList(conn);
		
		close(conn);
		
		return cliList;
	}

}
