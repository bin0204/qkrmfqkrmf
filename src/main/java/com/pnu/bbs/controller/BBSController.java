package com.pnu.bbs.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.pnu.bbs.dao.BBSDao;
import com.pnu.bbs.dto.BBSDto;
import com.pnu.bbs.service.BBSService;

@Controller
public class BBSController {
	@Autowired // 스프링이 지원하는 애노테이션, 타입으로 빈을 찾음
	private BBSService bbsService;
	private BBSDao mDAO;

	@RequestMapping("/list.bbs")
	public String list(Model model, BBSDto article, @RequestParam(value = "dong", required = false, defaultValue ="장전2동") String dong) {
		model.addAttribute("articleList", bbsService.list(dong));
		return "list";
	}
	
	
	@RequestMapping("/search.bbs")
	public String search() {
		return "search";
	}
	@RequestMapping("/chart.bbs")
	public String chart() {
		return "chart";
	}
	@RequestMapping("/pieChart.bbs")
	public String pieChart() {
		return "pieChart";
	}
	
	@RequestMapping("/dieChart.bbs")
	public String dieChart() {
		return "dieChart";
	}
	
	@RequestMapping("/mlist.bbs")
	public String mlist() {
		return "mlist";
	}
	
	@RequestMapping("/template.bbs")
	public String template() {
		return "template";
	}
	@RequestMapping("/drawingMaps.bbs")
	public String drawingMaps() {
		return "drawingMaps";
	}
	
	//창업자세요?
	@RequestMapping("/index.bbs")
	public String index() {
		return "index";
	}
	
	//어디서 하실꺼에요?
	@RequestMapping("/gudong.bbs")
	public String gudong() {
		return "gudong";
	}
	
	//어떤직종을 계획하고 계세요?
	@RequestMapping("/bubble.bbs")
	public String bubble() {
		return "bubble";
	}

	// -> service로

}
