package controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.BikeService;
import logic.Comment;
import logic.Station;

@Controller
public class StationController {
	@Autowired
	BikeService service;
	
	@RequestMapping("info/*") /* �����Է� ���ۼ� , �뿩�� ���� �޾ƿð�? */
	public ModelAndView info(Integer number) {
		ModelAndView mav = new ModelAndView();
		List<Station> stationList = service.stationList();
		mav.addObject("stationList",stationList);
		
		if(number == null) {
			//���⿡ ������ġ �����浵 �ֱ� - ��������� ����
			mav.addObject("info_open",0);
		}
		else {
			try {
				Station info_one = service.stationOne(number);
				Date call_time = new Date();
				int score_cnt = service.score_cnt(number);
				Double station_score = service.station_score(number);
				List<Comment> commentList = service.commList(number);
				
				mav.addObject("info",info_one);
				mav.addObject("info_time",call_time);
				mav.addObject("score_cnt",score_cnt);
				mav.addObject("station_score",station_score);
				mav.addObject("comment",commentList);
				mav.addObject("info_open",1);
			}
			catch(Exception e) {
				mav.addObject("info_open",0);
			}
			
		}
		return mav;
	}


}
