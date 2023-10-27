package com.kh.DoctorLee.cli.model.service;

import java.util.ArrayList;

import com.kh.DoctorLee.cli.model.vo.Category;
import com.kh.DoctorLee.cli.model.vo.CliRes;
import com.kh.DoctorLee.cli.model.vo.CliResTime;
import com.kh.DoctorLee.cli.model.vo.CliRev;
import com.kh.DoctorLee.cli.model.vo.Clinic;
import com.kh.DoctorLee.cou.model.vo.CouRes;
import com.kh.DoctorLee.member.model.vo.Member;

public interface CliServiceI {
	
	ArrayList<Category> selectCategoryList();
	
	ArrayList<Clinic> selectCliList(int cateNo);
	
	Clinic selectCli(int cliNo);
	
	ArrayList<CliResTime> selectResDate(int cliNo);

	ArrayList<CliResTime> selectCliTimeList(CliRes cr);
	
	int insertCliRes(CliRes c);
	
	int selectResMem(CliRes cr);
	
	int insertCliRev(CliRev c);
	
	ArrayList<CliRev> selectCliRevList(int cliNo);
	
	int selectRevCount(CliRes cr);
}
