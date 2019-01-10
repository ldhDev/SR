package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import logic.BikeService;
import logic.Board;
import logic.Member;
import logic.Station;

@Controller
public class BoardController {
	@Autowired
	BikeService service;
	
	@RequestMapping("board/intro")
	public ModelAndView intro() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping("board/list")
	public ModelAndView board(Integer pageNum, Station station, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		mav.addObject("member",member);
		
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		int limit = 10;							//페이지당 게시물 수
		int listcount = service.boardcount();	//총 게시물 수
		
		List<Board> boardlist = service.boardlist(pageNum, limit);	//페이지의 게시물 리스트
		int maxpage = (int)((double)listcount/limit + 0.95);		//전체 페이지 수
		int startpage = ((int)((pageNum/10.0 + 0.9) -1)) * 10 + 1;	//시작페이지 1,11,21...
		int endpage = startpage + 9;								//마지막 페이지
		if(endpage > maxpage) endpage = maxpage;
		
		int boardcnt = listcount - (pageNum -1)*limit;	//게시물 순서
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("listcount",listcount);
		mav.addObject("boardlist",boardlist);
		mav.addObject("boardcnt",boardcnt);
		
		if(station.getName() != null){
			mav.addObject(station);
		}
		
		return mav;
	}
	
	@RequestMapping(value="board/*", method=RequestMethod.GET)
	public ModelAndView getboard(Integer num, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		
		Member member = (Member)session.getAttribute("member");
		mav.addObject("member",member);
		
		if(num != null) {
			board = service.getBoard(num, request);
			Station station = service.getStation(board.getNumber());
			mav.addObject("station", station);
		}
		
		mav.addObject("member",member);
		mav.addObject("board",board);
		return mav;
	}
	
	@RequestMapping(value="board/writeForm", method=RequestMethod.GET)
	public ModelAndView writeForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		Member member = (Member)session.getAttribute("member");
		
//		대여소별 게시판에서 number값을 가져올 시 입력해야함
		
		board.setUser_id(member.getUser_id());
		board.setUser_name(member.getName());
		
		mav.addObject("board",board);
		return mav;
	}
	
	@RequestMapping(value="board/write", method=RequestMethod.POST)
	public ModelAndView write(Board board) {
		ModelAndView mav = new ModelAndView();
		try {
			service.boardadd(board);
			mav.setViewName("redirect:list.bike");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	//0109
	@RequestMapping(value="board/update", method=RequestMethod.POST)
	public ModelAndView update(Board board, HttpServletRequest request ) {
		ModelAndView mav = new ModelAndView();
		//파라미터 넘으로 디비의 아이디와 세션의 로그인 아이디가 동일하다면 업데이트
		Board dbBoard = service.getBoard(board.getBoard_no(), request);
		try {
			service.boardupdate(board);
			mav.setViewName("redirect:list.bike");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value="board/delete", method=RequestMethod.GET)
	public ModelAndView delete(Integer num, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try{
			service.boarddelete(num);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:list.bike");
		return mav;
	}
}
