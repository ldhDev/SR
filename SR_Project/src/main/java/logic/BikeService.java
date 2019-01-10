package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import dao.CommentDao;
import dao.MemberDao;
import dao.StationDao;

@Service
public class BikeService {
	@Autowired
	private StationDao stationDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private CommentDao commentDao;

	public List<Station> stationList() {
		return stationDao.list();
	}
	
	////////////////////////////////////////////대여소 조회 1.10 추가
	public Station stationOne(int number) {
		return stationDao.info_one(number);
	}
	
	//해당 대여소 코멘트(평가) 총 갯수
	public int score_cnt(Integer number) {
		return commentDao.score_cnt(number);
	}
	
	//해당 대여소 점수
	public Double station_score(Integer number) {
		return commentDao.station_score(number);
	}
	
	//해당 대여소 평가,한줄평
	public List<Comment> commList(Integer number) {
		return commentDao.comment_List(number);
	}
	////////////////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	public void boardadd(Board board) {
		int max = boardDao.maxNum();
		board.setBoard_no(++max);
		boardDao.insert(board);
	}

	public List<Board> boardlist(Integer pageNum, Integer limit) {
		return boardDao.list(pageNum,limit);
	}

	public Board getBoard(Integer num, HttpServletRequest request) {
		if(request.getRequestURI().contains("detail")) {
			boardDao.readcntadd(num);
		}
		return boardDao.select(num);
	}

	public int boardcount() {
		return boardDao.count();
	}

	

	




}
