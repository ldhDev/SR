package controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.BikeService;
import logic.Comment;
import logic.Member;
import logic.Station;

@Controller
public class StationController {
	@Autowired
	BikeService service;
	
	
	@RequestMapping("info/*") /* �����Է� ���ۼ� , �뿩�� ���� �޾ƿð�? */
	public ModelAndView info(Integer number,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Station> stationList = service.stationList();
		mav.addObject("stationList",stationList);
		
		//���ã�� ���� Ȯ��
		Member session_member = (Member)session.getAttribute("member");
		
		mav.addObject("bookmark_limit",0); //���ã�� ���� �������� (0) <- ��α��� + �ڸ�����

		if(session_member != null) {
			Member member = service.imformation(session_member);
			
			Integer bk1 = member.getBookmark1();
			Integer bk2 = member.getBookmark2();
			Integer bk3 = member.getBookmark3();
			
			if(bk1.equals(number) || bk2.equals(number) || bk3.equals(number)) {
				mav.addObject("bookmark",1);
			}
			
			//���ã�� 3���� ���� �ִٸ� (== �� �� �ִٸ�)
			if(!bk3.equals(0)) {
				mav.addObject("bookmark_limit",1); //���ã�� ���� (1)
			}
		}
		
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
	
	
	//���ã�� ���
	@RequestMapping("/bookmark_in*")
	public ModelAndView bk_in(int number,HttpSession session) {
		
		Member member = service.imformation((Member)session.getAttribute("member")); 
		ModelAndView mav = new ModelAndView(); 
		
		String order = "";
		if(member.getBookmark1() == 0) {
			order = "Bookmark1";
		}
		else if(member.getBookmark2() == 0) {
			order = "Bookmark2";
		}
		else if(member.getBookmark3() == 0) {
			order = "Bookmark3";
		}

		
		//���
		service.bookmark_in(number,member.getUser_id(),order);
		
		
		return mav;
	}


}
