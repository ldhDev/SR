package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
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

	public List<Station> stationList() {
		return stationDao.list();
	}
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
