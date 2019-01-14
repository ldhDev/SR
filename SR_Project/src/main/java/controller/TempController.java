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
	
	@RequestMapping("/main*")//1/10 ���ã�� �߰���
	public ModelAndView temp2(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Station> stationList = service.stationList();
		
		//���ã�� ���� Ȯ��
		Member session_member = (Member)session.getAttribute("member");
				
		if(session_member != null) {
			Member member = service.imformation(session_member);
					
			int bk1 = member.getBookmark1();
			int bk2 = member.getBookmark2();
			int bk3 = member.getBookmark3();
	
			String bookmarks = "('"+bk1+"','"+bk2+"','"+bk3+"')";
			
			//���ã�� ��� ��ȸ
			List<Station> bookmark = service.bookmark_List(bookmarks);
			mav.addObject("bookmark",bookmark);
		}
			
		mav.addObject("stationList",stationList);
		return mav;
	}
	 
}

