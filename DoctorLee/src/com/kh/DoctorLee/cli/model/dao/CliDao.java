package com.kh.DoctorLee.cli.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.kh.DoctorLee.cli.model.vo.Category;
import com.kh.DoctorLee.cli.model.vo.CliRes;
import com.kh.DoctorLee.cli.model.vo.CliResTime;
import com.kh.DoctorLee.cli.model.vo.CliRev;
import com.kh.DoctorLee.cli.model.vo.Clinic;

public class CliDao {
	public ArrayList<Category> selectCategoryList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("cliMapper.selectCategoryList");
	}
	
	public ArrayList<Clinic> selectCliList(SqlSession sqlSession, int cateNo){
		return (ArrayList)sqlSession.selectList("cliMapper.selectCliList", cateNo);
	}
	
	public Clinic selectCli(SqlSession sqlSession, int cliNo) {
		return sqlSession.selectOne("cliMapper.selectCli", cliNo);
	}
	
	public int selectResMem(SqlSession sqlSession, CliRes cr) {
		return sqlSession.selectOne("cliMapper.selectResMem", cr);
	}
	
	public int selectRevCount(SqlSession sqlSession, CliRes cr) {
		return sqlSession.selectOne("cliMapper.selectRevCount", cr);
	}
	
	public ArrayList<CliRev> selectCliRevList(SqlSession sqlSession, int cliNo){
		return (ArrayList)sqlSession.selectList("cliMapper.selectCliRevList", cliNo);
	}
	
	public ArrayList<CliResTime> selectResDate(SqlSession sqlSession, int cliNo){
		return (ArrayList)sqlSession.selectList("cliMapper.selectResDate", cliNo);
	}
	
	public ArrayList<CliResTime> selectCliTimeList(SqlSession sqlSession, CliRes cr){
		return (ArrayList)sqlSession.selectList("cliMapper.selectCliTimeList", cr);
	}
	
	public int insertCliRes(SqlSession sqlSession , CliRes c) {
		return sqlSession.insert("cliMapper.insertCliRes", c);
	}
	
	public int insertCliRev(SqlSession sqlSession, CliRev c) {
		return sqlSession.insert("cliMapper.insertCliRev", c);
	}
}
