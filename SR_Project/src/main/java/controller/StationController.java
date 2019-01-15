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
	
	
	@RequestMapping("info/*") /* 정보입력 미작성 , 대여소 정보 받아올것? */
	public ModelAndView info(Integer number,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Station> stationList = service.stationList();
		mav.addObject("stationList",stationList);
		
		//즐겨찾기 유무 확인
		Member session_member = (Member)session.getAttribute("member");
		
		mav.addObject("bookmark_limit",0); //즐겨찾기 제한 해제상태 (0) <- 비로그인 + 자리여유

		if(session_member != null) {
			Member member = service.imformation(session_member);
			
			Integer bk1 = member.getBookmark1();
			Integer bk2 = member.getBookmark2();
			Integer bk3 = member.getBookmark3();
			
			if(bk1.equals(number) || bk2.equals(number) || bk3.equals(number)) {
				mav.addObject("bookmark",1);
			}
			
			//즐겨찾기 3번에 값이 있다면 (== 꽉 차 있다면)
			if(!bk3.equals(0)) {
				mav.addObject("bookmark_limit",1); //즐겨찾기 제한 (1)
			}
		}
		
		if(number == null) {
			//여기에 현재위치 위도경도 넣기 - 힘들것으로 보임
			mav.addObject("info_open",0);
		}
		else {
			try {
				
				//한줄평 페이지 조회
				int pageNum = 1;
				int limit = 5;			
				
				int comment_cnt = service.score_cnt(number);	//평가(== 한줄평) 수
				
				if(comment_cnt != 0) {
					List<Comment> commentList = service.commList(number,pageNum,limit);  //핑까 1페이지부터 5개 제한
					
					int maxpage = (int)((double)comment_cnt/limit + 0.95);		//전체 페이지 수
					int startpage = ((int)((pageNum/10.0 + 0.9) -1)) * 10 + 1;	//시작페이지 1,11,21...
					int endpage = startpage + 9;								//마지막 페이지
					if(endpage > maxpage) endpage = maxpage;
					
					mav.addObject("pageNum", pageNum);	//코멘트페이지
					mav.addObject("maxpage",maxpage);
					mav.addObject("startpage",startpage);
					mav.addObject("endpage",endpage);
					mav.addObject("comment",commentList);
					//////////////////////한줄평 페이지 조회 끝					
				}
				
				Station info_one = service.stationOne(number);		//대여소 정보
				Date call_time = new Date();	// 조회시간
				Double station_score = service.station_score(number); //평점
				int count = service.bookmark_count(number); //즐찾 숫자 가져옴
				
				mav.addObject("info",info_one);
				mav.addObject("info_time",call_time);
				mav.addObject("station_score",station_score);
				mav.addObject("count",count); //즐겨찾기 숫자
				mav.addObject("comment_cnt",comment_cnt); // 코멘트(평가) 수
				
				mav.addObject("info_open",1);
			}
			catch(Exception e) {
				mav.addObject("info_open",0);
			}
			
		}
		return mav;
	}
	
	
	//즐겨찾기 등록
	@RequestMapping("info/bookmark_in*")
	public ModelAndView bk_in(int number,HttpSession session) {
		
		ModelAndView mav = new ModelAndView(); 
		
		Member member = service.imformation((Member)session.getAttribute("member")); 
		
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
	
		//등록
		service.bookmark_in(number,member.getUser_id(),order);
		
		//즐찾 숫자 가져옴
		int count = service.bookmark_count(number);
		mav.addObject("count",count);
		
		return mav;
	}
	
	
	//즐겨찾기 취소
		@RequestMapping("info/bookmark_out*")
		public ModelAndView bk_out(int number,HttpSession session) {

			ModelAndView mav = new ModelAndView(); 
			
			Member member = service.imformation((Member)session.getAttribute("member")); 
			
			if(member.getBookmark1() == number) {
				service.bookmark_out(member.getUser_id(),1);
			}
			else if(member.getBookmark2() == number) {
				service.bookmark_out(member.getUser_id(),2);
			}
			else if(member.getBookmark3() == number) {
				service.bookmark_out(member.getUser_id(),3);
			}
			
			//즐찾 숫자 가져옴
			int count = service.bookmark_count(number);
			mav.addObject("count",count);
	
			return mav;
		}
	
	
	


}
