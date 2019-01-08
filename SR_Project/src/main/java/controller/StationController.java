package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.BikeService;
import logic.Station;

@Controller
public class StationController {
	@Autowired
	BikeService service;
	
	@RequestMapping("info/*") /* �����Է� ���ۼ� , �뿩�� ���� �޾ƿð�? */
	public ModelAndView info() {
		ModelAndView mav = new ModelAndView();
		List<Station> stationList = service.stationList();
		mav.addObject("stationList",stationList);
		return mav;
	}

}
