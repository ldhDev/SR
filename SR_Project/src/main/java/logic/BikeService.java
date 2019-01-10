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
	
	////////////////////////////////////////////�뿩�� ��ȸ 1.10 �߰�
	public Station stationOne(int number) {
		return stationDao.info_one(number);
	}
	
	//�ش� �뿩�� �ڸ�Ʈ(��) �� ����
	public int score_cnt(Integer number) {
		return commentDao.score_cnt(number);
	}
	
	//�ش� �뿩�� ����
	public Double station_score(Integer number) {
		return commentDao.station_score(number);
	}
	
	//�ش� �뿩�� ��,������
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
