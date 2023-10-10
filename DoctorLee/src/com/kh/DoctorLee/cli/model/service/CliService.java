package com.kh.DoctorLee.cli.model.service;

import static com.kh.DoctorLee.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.DoctorLee.cli.model.dao.CliDao;
import com.kh.DoctorLee.cli.model.vo.Category;

public class CliService {

	public ArrayList<Category> selectCategoryList() {
		Connection conn = getConnection();
		
		ArrayList<Category> list = new CliDao().selectCategoryList(conn);
		
		close(conn);
		
		return list;
	}

}
