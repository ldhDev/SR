package logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import dao.CommentDao;
import dao.MemberDao;
import dao.ReplyDao;
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
	@Autowired
	private ReplyDao replyDao;

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
	public List<Comment> commList(Integer number,int pageNum,int limit) {
		return commentDao.comment_List(number,pageNum,limit);
	}
	
	//�뿩�� ���ã�� ���
	public void bookmark_in(int number, String user_id, String order) {
		stationDao.bookmark_in(number,user_id,order);
	}
	
	//�뿩�� ���ã�� ���
	public void bookmark_out(String user_id, int way) {
		stationDao.bookmark_out(user_id,way);
	}
	
	//�뿩�� ���ã�� ��ϼ���
	public int bookmark_count(int number) {
		return stationDao.bookmark_count(number);
	}
	
	//�뿩�� ȸ�� ���ã�� ���
	public List<Station> bookmark_List(String bookmarks) {
		return stationDao.bookmark_List(bookmarks);
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
	//0109
	public void boardupdate(Board board) {
		boardDao.update(board);
	}
	public void boarddelete(Integer num) {
		boardDao.delete(num);
	}
	public Station getStation(int num) {
		return boardDao.selectStation(num);
	}
	
	///////�Խù� ���۰���
	public List<Reply> replyList(Integer board_no) {
		return replyDao.list(board_no);
	}

	public void replyadd(Reply reply) {
		int max = replyDao.maxNum();
		reply.setReply_no(++max);
		reply.setRef(++max);
		replyDao.insert(reply);
	}

	
	
///////////////////////////ȸ������
	public boolean memberexist(Member member) {
		return memberDao.exist(member);
	}

	public Member imformation(Member member) {
		return memberDao.imformation(member);
	}
	public void memberinsert(Member member) {
		memberDao.meminsert(member);
	}





}
