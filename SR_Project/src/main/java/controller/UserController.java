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
			throw new LoginException("�α����� �ʿ��� �������Դϴ�.","../main.bike");
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
	public ModelAndView update(HttpSession session, Member mem,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		System.out.println(req.getParameter("name").length());
		System.out.println(req.getParameter("name"));
		System.out.println(req.getParameter("name").trim().length()+"���鿡���� ��");
		if(service.nameCheck(req.getParameter("name"))!=1)
		{
			char checkChar =' ';
			for(int i=0; i<req.getParameter("name").length(); i++)
			{
				System.out.print(req.getParameter("name").charAt(i));
				checkChar = req.getParameter("name").charAt(i);
				if(checkChar == ' ')
				{
					mav.setViewName("alert");
					mav.addObject("message","������ ����� �� �����ϴ�.");
					mav.addObject("url","mypage.bike");
					return mav;
				}
			}
			if(req.getParameter("name").trim().length() == 0 )
			{
				mav.setViewName("alert");
				mav.addObject("message","������ ����� �� �����ϴ�.");
				mav.addObject("url","mypage.bike");
				return mav;
			}
			
			if(req.getParameter("name").length() < 3 || req.getParameter("name").length() > 10 )
			{
				mav.setViewName("alert");
				mav.addObject("message","3�����̻� 10�̸��� �г����� ����ؾ� �մϴ�.");
				mav.addObject("url","mypage.bike");
				return mav;
			}
			Member member = (Member)session.getAttribute("member");
			member.setName(mem.getName());
				service.userupdate(member);
				mav.setViewName("alert");
				mav.addObject("message","����Ǿ����ϴ�.");
				mav.addObject("url","mypage.bike");
			return mav;
		}
		else if(service.nameCheck(req.getParameter("name"))==1)
		{
			mav.setViewName("alert");
			mav.addObject("message","�̹� ������� ���̵� �Դϴ�.");
			mav.addObject("url","mypage.bike");
			return mav;
		}
		else
		{
			mav.setViewName("alert");
			mav.addObject("message","���濡 �����Ͽ����ϴ�.");
			mav.addObject("url","mypage.bike");
			return mav;
		}
		
	}
	

	@RequestMapping(value="user/bookmark_delete", method = RequestMethod.GET)
	public ModelAndView bk_delete(int number,HttpSession session) {
		ModelAndView mav = new ModelAndView(); 
		Member member = service.imformation((Member)session.getAttribute("member")); 
		
		if(member.getBookmark1() == number) {
			service.bookmark_out(member.getUser_id(),1);
			System.out.println("1 ����");
			mav.setViewName("alert");
			mav.addObject("message","���� �Ǿ����ϴ�.");
		}
		else if(member.getBookmark2() == number) {
			service.bookmark_out(member.getUser_id(),2);
			System.out.println("2 ����");
			mav.setViewName("alert");
			mav.addObject("message","���� �Ǿ����ϴ�.");
		}
		else if(member.getBookmark3() == number) {
			service.bookmark_out(member.getUser_id(),3);
			System.out.println("3 ����");
			mav.setViewName("alert");
			mav.addObject("message","���� �Ǿ����ϴ�.");
		}
		
		member = service.imformation(member);
		session.setAttribute("member", member);
		mav.addObject("member",member);
		mav.addObject("url","../user/mypage.bike");
		//mav.setViewName("redirect:../user/mypage.bike");

		return mav;
	}
}
