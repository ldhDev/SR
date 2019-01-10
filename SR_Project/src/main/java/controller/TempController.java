package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.BikeService;
import logic.Member;
import logic.Station;

@Controller
public class TempController {
	@Autowired
	BikeService service;
	
	@RequestMapping("temp/*")
	public ModelAndView temp() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping("/main*")//1/10 즐겨찾기 추가중
	public ModelAndView temp2(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Station> stationList = service.stationList();
		//Member member = (Member)session.getAttribute("member");
		//북마크부분 - 해야함********************************************************
		//List<Station> bookmark = service.bookmarkList(member.getUser_id());
		
		mav.addObject("stationList",stationList);
		return mav;
	}
	 
}

