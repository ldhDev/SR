package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.BikeService;

@Controller
public class StationController {
	@Autowired
	BikeService service;
	
	@RequestMapping("info/*") /* �����Է� ���ۼ� , �뿩�� ���� �޾ƿð�? */
	public ModelAndView temp() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

}
