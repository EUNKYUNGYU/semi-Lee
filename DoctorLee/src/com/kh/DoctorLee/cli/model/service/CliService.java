package com.kh.DoctorLee.cli.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.cli.model.dao.CliDao;
import com.kh.DoctorLee.cli.model.vo.Category;
import com.kh.DoctorLee.cli.model.vo.CliRes;
import com.kh.DoctorLee.cli.model.vo.CliResTime;
import com.kh.DoctorLee.cli.model.vo.CliRev;
import com.kh.DoctorLee.cli.model.vo.Clinic;
import com.kh.DoctorLee.common.template.Template;

public class CliService implements CliServiceI{
	
	private CliDao cliDao = new CliDao();

	@Override
	public ArrayList<Category> selectCategoryList() {
		SqlSession sqlSession = Template.getSqlSession();
		
		ArrayList<Category> list = cliDao.selectCategoryList(sqlSession);
		
		sqlSession.close();
		
		return list;
	}

	@Override
	public ArrayList<Clinic> selectCliList(int cateNo) {
		SqlSession sqlSession = Template.getSqlSession();
		
		ArrayList<Clinic> list = cliDao.selectCliList(sqlSession, cateNo);
		
		sqlSession.close();
		
		return list;
	}

	@Override
	public Clinic selectCli(int cliNo) {
		SqlSession sqlSession = Template.getSqlSession();
		
		Clinic c = cliDao.selectCli(sqlSession, cliNo);
		
		sqlSession.close();
		
		return c;
	}
	
	@Override
	public int selectResMem(CliRes cr) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = cliDao.selectResMem(sqlSession, cr);
		
		sqlSession.close();
		
		return result;
	}
	
	@Override
	public int selectRevCount(CliRes cr) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = cliDao.selectRevCount(sqlSession, cr);
		
		sqlSession.close();
		
		return result;
	}
	
	@Override
	public ArrayList<CliRev> selectCliRevList(int cliNo) {
		SqlSession sqlSession = Template.getSqlSession();
		
		ArrayList<CliRev> list = cliDao.selectCliRevList(sqlSession, cliNo);
		
		sqlSession.close();
		
		return list;
	}

	@Override
	public ArrayList<CliResTime> selectResDate(int cliNo) {
		SqlSession sqlSession = Template.getSqlSession();
		
		ArrayList<CliResTime> list = cliDao.selectResDate(sqlSession, cliNo);
		
		sqlSession.close();
		
		return list;
	}

	@Override
	public ArrayList<CliResTime> selectCliTimeList(CliRes cr) {
		SqlSession sqlSession = Template.getSqlSession();
		
		ArrayList<CliResTime> list = cliDao.selectCliTimeList(sqlSession, cr);
		
		sqlSession.close();
		
		return list;
	}

	@Override
	public int insertCliRes(CliRes c) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = cliDao.insertCliRes(sqlSession, c);
		
		if(result > 0) sqlSession.commit();
		
		sqlSession.close();
		
		return result;
	}

	@Override
	public int insertCliRev(CliRev c) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = cliDao.insertCliRev(sqlSession, c);
		
		if(result > 0) sqlSession.commit();
		
		sqlSession.close();
		
		return result;
	}


}
