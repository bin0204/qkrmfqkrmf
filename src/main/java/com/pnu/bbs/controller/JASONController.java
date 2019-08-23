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
	// ����� �����͸� �������ִ� �뵵

	// ����� DAO�� ��ü�� ����
	@Autowired
	private BBSDao mDAO;
	
	@RequestMapping(value = "/result", method = RequestMethod.GET, produces = "application/json")
	public Map<String, List<Map<String, Object>>> chart1(HttpServletResponse response) {

		// ũ�ν� ������ : ������ Ŭ���̾�Ʈ�� ���������� �и��Ǿ� ������� �����͸� ���� ����..
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

		// ũ�ν� ������ : ������ Ŭ���̾�Ʈ�� ���������� �и��Ǿ� ������� �����͸� ���� ����..
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