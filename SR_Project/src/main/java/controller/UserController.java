package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;
import logic.BikeService;
import logic.Member;
import logic.Station;

@Controller
public class UserController {
	@Autowired
	BikeService service;
	
	@RequestMapping("user/mypage")
	public ModelAndView intro(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		if(member != null){
			mav.addObject("member", member);
		}else {
			throw new LoginException("로그인 후 거래하세요.","../main.bike");
		}
		member = service.imformation(member);
		session.setAttribute("member", member);
		mav.addObject("member",member);
		
		Station station = new Station();
		station = service.getStation(member.getBookmark1());
		mav.addObject("station1",station);
		
		station = service.getStation(member.getBookmark2());
		mav.addObject("station2",station);
		
		station = service.getStation(member.getBookmark3());
		mav.addObject("station3",station);
		
		
		return mav;
	}
	
	@RequestMapping(value="user/delete", method=RequestMethod.GET)
	public ModelAndView delete(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		try {
			service.userdelete(member.getUser_id());
			request.getSession().invalidate();
			mav.setViewName("redirect:../main.bike");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping("user/update")
	public ModelAndView update(HttpSession session, Member mem) {
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		member.setName(mem.getName());
		try {
			service.userupdate(member);
			mav.setViewName("redirect:mypage.bike");
		}catch(Exception e) {
			throw new LoginException("이미있는 아이디 입니다.","../user/mypage.bike");
		}
		return mav;
	}
	
	//0117상원 삭제 추가
	@RequestMapping(value="user/bookmark_delete", method = RequestMethod.GET)
	public ModelAndView bk_delete(int number,HttpSession session) {
		ModelAndView mav = new ModelAndView(); 
		Member member = service.imformation((Member)session.getAttribute("member")); 
		
		if(member.getBookmark1() == number) {
			service.bookmark_out(member.getUser_id(),1);
			System.out.println("1 들어옴");
		}
		else if(member.getBookmark2() == number) {
			service.bookmark_out(member.getUser_id(),2);
			System.out.println("2 들어옴");
		}
		else if(member.getBookmark3() == number) {
			service.bookmark_out(member.getUser_id(),3);
			System.out.println("3 들어옴");
		}
		
		member = service.imformation(member);
		session.setAttribute("member", member);
		mav.addObject("member",member);
		mav.setViewName("redirect:../user/mypage.bike");

		return mav;
	}
}
