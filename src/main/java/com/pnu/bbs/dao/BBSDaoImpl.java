package com.pnu.bbs.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pnu.bbs.dto.BBSDto;

@Repository
public class BBSDaoImpl implements BBSDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	final String nameSpace="com.pnu.bbs.dao.BBSDao";

	@Override
	public List<BBSDto> list(String dong) {
		return sqlSession.selectList(nameSpace+".selectDong", dong);  
		                                        // ㄴ내가 만들 메소드
	}

	public List<Map<String, Object>> analysis_result(){
		return sqlSession.selectList(nameSpace+".analysis_result");
	}
	public List<Map<String, Object>> analysis_store_peup(){
		return sqlSession.selectList(nameSpace+".analysis_store_peup");
	}
	public List<Map<String, Object>> store(){
		return sqlSession.selectList(nameSpace+".store");
	}
	
	// 리스트를 받으면 자동으로 하나의 레코드를 BBSDTO에 넣는다 
	// 조건) DTO와 테이블의 변수명이같으면
	



}

//  --> mapper.bbs로
// 컨트롤러 -> 서비스 -> dao
// controller -> service -> dao  -> mapper


