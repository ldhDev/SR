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
import logic.Reply;
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
	public ModelAndView board(Integer pageNum, Station station, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		mav.addObject("member",member);
		
		int number = -1;
		if(request.getParameter("num") != null) {
			String num = request.getParameter("num");
			num = num.replace("'", "");
			number = Integer.parseInt(num);
			station = service.stationOne(number);
			mav.addObject("station", station);
		}
		
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		int limit = 10;							//페이지당 게시물 수
		int listcount = service.boardcount(number,1);	//총 게시물 수
		
		List<Board> boardlist = service.boardlist(pageNum, limit, number);	//페이지의 게시물 리스트
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
	
	@RequestMapping("board/writeForm")
	public ModelAndView writeForm(HttpSession session, Station station, HttpServletRequest requset) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		Member member = (Member)session.getAttribute("member");
		
		board.setNumber(station.getNumber());
		board.setUser_id(member.getUser_id());
		board.setUser_name(member.getName());
		
		mav.addObject("board",board);
		return mav;
	}
	
	@RequestMapping(value="board/write", method=RequestMethod.POST)
	public ModelAndView write(Board board) {
		ModelAndView mav = new ModelAndView();
		Station station = new Station();
		mav.addObject(station);
		try {
			service.boardadd(board);
			if(board.getNumber() == 0) {
				mav.setViewName("redirect:list.bike");
			}else {
				mav.setViewName("redirect:list.bike?num="+board.getNumber());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	//0109
	@RequestMapping(value="board/update", method=RequestMethod.POST)
	public ModelAndView update(Board board, HttpServletRequest request ) {
		ModelAndView mav = new ModelAndView();
		try {
			service.boardupdate(board);
			if(board.getNumber() != 0) {
				mav.setViewName("redirect:list.bike?num="+board.getNumber());
			}else {
				mav.setViewName("redirect:list.bike");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value="board/delete", method=RequestMethod.GET)
	public ModelAndView delete(Integer num, HttpServletRequest request, String number) {
		ModelAndView mav = new ModelAndView();
		try{
			service.boarddelete(num);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(!number.equals("0")) {
			mav.setViewName("redirect:list.bike?num="+number);
		}else {
			mav.setViewName("redirect:list.bike");
		}
		
		return mav;
	}
	
	@RequestMapping(value="board/detail", method=RequestMethod.GET)
	public ModelAndView detail(Integer num, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		Reply reply = new Reply();
		
		Member member = (Member)session.getAttribute("member");
		mav.addObject("member",member);
		
		board = service.getBoard(num, request);
		Station station = service.getStation(board.getNumber());
		List<Reply> replylist = service.replyList(board.getBoard_no());
		
		reply.setBoard_no(num);
		
		mav.addObject("station", station);
		mav.addObject("member",member);
		mav.addObject("board",board);
		mav.addObject("reply",reply);
		mav.addObject("replylist", replylist);
		return mav;
	}
	
	@RequestMapping("board/addreply")
	public ModelAndView addreply(Reply reply, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		reply.setUser_id(member.getUser_id());
		reply.setUser_name(member.getName());
		reply.setReflevel(0);

		try{
			service.replyadd(reply);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:detail.bike?num="+reply.getBoard_no());
		return mav;
	}
	
	@RequestMapping("board/re_reply")
	public ModelAndView add_re_reply(String content,int reply_no,int board_no, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Reply reply = new Reply();
		
		Member member = (Member)session.getAttribute("member");
		reply.setUser_id(member.getUser_id());
		reply.setUser_name(member.getName());
		reply.setBoard_no(board_no);
		reply.setContent(content);
		reply.setRef(reply_no);
		
		int ref_level= service.Max_ref_level(reply_no);
		reply.setReflevel(++ref_level);

		try{
			service.re_replyadd(reply);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:detail.bike?num="+reply.getBoard_no());
		return mav;
	}	
	
	@RequestMapping(value="board/replydelete", method=RequestMethod.GET)
	public ModelAndView replydelete(Integer num, HttpServletRequest request, String number, Integer replynum) {
		ModelAndView mav = new ModelAndView();
		try{
			service.replydelete(replynum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(number == null) {
			mav.setViewName("redirect:detail.bike?num="+num);
		}else {
			mav.setViewName("redirect:detail.bike?num="+num+"&number="+number);
		}
		return mav;
	}
	
	@RequestMapping("board/notice")
	public ModelAndView notice(Integer pageNum, Station station, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		mav.addObject("member",member);
		
		int number = -1;
		int type = 0;
		
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		
		int limit = 10;							//페이지당 게시물 수
		int listcount = service.boardcount(number,type);	//총 게시물 수
		
		List<Board> boardlist = service.boardnoticelist(pageNum, limit);	//페이지의 게시물 리스트
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
		
		return mav;
	}
	
	@RequestMapping("board/noticewriteForm")
	public ModelAndView noticewriteForm(HttpSession session, HttpServletRequest requset) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		Member member = (Member)session.getAttribute("member");
		
		board.setUser_id(member.getUser_id());
		board.setUser_name(member.getName());
		board.setType(0);
		
		mav.addObject("board",board);
		return mav;
	}
	
	@RequestMapping(value="board/noticewrite", method=RequestMethod.POST)
	public ModelAndView noticewrite(Board board) {
		ModelAndView mav = new ModelAndView();
		try {
			service.boardadd(board);
			mav.setViewName("redirect:notice.bike");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value="board/notice_detail", method=RequestMethod.GET)
	public ModelAndView notice_detail(Integer num, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		
		Member member = (Member)session.getAttribute("member");
		mav.addObject("member",member);
		
		board = service.getBoard(num, request);
		
		
		mav.addObject("member",member);
		mav.addObject("board",board);
		return mav;
	}
	
	@RequestMapping(value="board/notice_update", method=RequestMethod.POST)
	public ModelAndView notice_update(Board board, HttpServletRequest request ) {
		ModelAndView mav = new ModelAndView();
		try {
			service.boardupdate(board);
			if(board.getNumber() != 0) {
				mav.setViewName("redirect:notice.bike?num="+board.getNumber());
			}else {
				mav.setViewName("redirect:notice.bike");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value="board/noticedelete", method=RequestMethod.GET)
	public ModelAndView noticedelete(Integer num, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try{
			service.boarddelete(num);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:notice.bike");
		
		return mav;
	}
	
	
}
