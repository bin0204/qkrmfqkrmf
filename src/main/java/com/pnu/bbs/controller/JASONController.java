package com.pnu.bbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.pnu.bbs.dao.BBSDao;

@RestController
@RequestMapping("/json")
public class JASONController {
	// 여기는 데이터를 공급해주는 용도

	// 사용할 DAO를 객체를 만듬
	@Autowired
	private BBSDao mDAO;
	
	@RequestMapping(value = "/result", method = RequestMethod.GET, produces = "application/json")
	public Map<String, List<Map<String, Object>>> chart1(HttpServletResponse response) {

		// 크로스 도메인 : 서버와 클라이언트가 물리적으로 분리되어 있을경우 데이터를 받지 못함..
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
		response.setHeader("Access-Control-Max-Age", "3600");
		response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setCharacterEncoding("UTF-8");

		List<Map<String, Object>> list1 = mDAO.analysis_result();
		List<Map<String, Object>> list2 = mDAO.analysis_store_peup();
		
		
		Map<String,List<Map<String, Object>>> jsonList = new HashMap<String, List<Map<String,Object>>>();
		jsonList.put("analysis_result", list1);
		jsonList.put("analysis_store_peup", list2);
		

		return jsonList; 
	}
	
	@RequestMapping(value = "/store", method = RequestMethod.GET, produces = "application/json")
	public Map<String, List<Map<String, Object>>> store(HttpServletResponse response) {

		// 크로스 도메인 : 서버와 클라이언트가 물리적으로 분리되어 있을경우 데이터를 받지 못함..
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
		response.setHeader("Access-Control-Max-Age", "3600");
		response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setCharacterEncoding("UTF-8");

		List<Map<String, Object>> list= mDAO.store();
		
		Map<String,List<Map<String, Object>>> jsonList = new HashMap<String, List<Map<String,Object>>>();
		jsonList.put("store", list);

		return jsonList; 
	}

}  