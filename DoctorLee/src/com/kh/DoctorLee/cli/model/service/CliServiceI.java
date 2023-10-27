package com.kh.DoctorLee.cli.model.service;

import java.util.ArrayList;

import com.kh.DoctorLee.cli.model.vo.Category;
import com.kh.DoctorLee.cli.model.vo.CliRes;
import com.kh.DoctorLee.cli.model.vo.CliResTime;
import com.kh.DoctorLee.cli.model.vo.CliRev;
import com.kh.DoctorLee.cli.model.vo.Clinic;
import com.kh.DoctorLee.member.model.vo.Member;

public interface CliServiceI {
	
	ArrayList<Category> selectCategoryList();
	
	ArrayList<Clinic> selectCliList(int cateNo);
	
	Clinic selectCli(int cliNo);
	
	ArrayList<CliResTime> selectResDate(int cliNo);

	ArrayList<CliResTime> selectCliTimeList(int cliNo, String resDate);
	
	int insertCliRes(CliRes c);
	
	int selectResMem(int cliNo, Member loginUser);
	
	int insertCliRev(CliRev c);
	
	Double selectCliScope(int cliNo);
	
	ArrayList<CliRev> selectCliRevList(int cliNo);
	
	int selectRevCount(int cliNo, Member loginUser);
}
