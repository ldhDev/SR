package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.BikeService;
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
	
	@RequestMapping("/main*")
	public ModelAndView temp2() {
		ModelAndView mav = new ModelAndView();
		List<Station> stationList = service.stationList();
		mav.addObject("stationList",stationList);
		return mav;
	}
	 
}

