package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import logic.BikeService;
import logic.Board;

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
	public ModelAndView board(Integer pageNum) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		int limit = 10;							//�������� �Խù� ��
		int listcount = service.boardcount();	//�� �Խù� ��
		
		List<Board> boardlist = service.boardlist(pageNum, limit);	//�������� �Խù� ����Ʈ
		int maxpage = (int)((double)listcount/limit + 0.95);		//��ü ������ ��
		int startpage = ((int)((pageNum/10.0 + 0.9) -1)) * 10 + 1;	//���������� 1,11,21...
		int endpage = startpage + 9;								//������ ������
		if(endpage > maxpage) endpage = maxpage;
		
		int boardcnt = listcount - (pageNum -1)*limit;	//�Խù� ����
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
	public ModelAndView getboard(Integer num, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		if(num != null) {
			board = service.getBoard(num, request);
		}
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
	
}
