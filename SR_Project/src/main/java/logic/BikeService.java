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
	public List<Comment> commList(Integer number,int pageNum,int limit) {
		return commentDao.comment_List(number,pageNum,limit);
	}
	
	//한줄평 작성
	public void comment_insert(Comment cmmt) {
		int max_no = commentDao.comment_maxNo();
		cmmt.setComment_no(++max_no);
		commentDao.comment_insert(cmmt);
	}
	
	//한줄평 삭제
	public void comment_delete(int number, String user_id) {
		commentDao.comment_delete(number,user_id);
	}
	
	//회원 한줄평 조회
	public Comment comment_one(Integer number, String user_id) {
		return commentDao.comment_one(number,user_id);
	}
	
	//대여소 즐겨찾기 등록
	public void bookmark_in(int number, String user_id, String order) {
		stationDao.bookmark_in(number,user_id,order);
	}
	
	//대여소 즐겨찾기 취소
	public void bookmark_out(String user_id, int way) {
		stationDao.bookmark_out(user_id,way);
	}
	
	//대여소 즐겨찾기 등록숫자
	public int bookmark_count(int number) {
		return stationDao.bookmark_count(number);
	}
	
	//대여소 회원 즐겨찾기 목록
	public List<Station> bookmark_List(String bookmarks) {
		return stationDao.bookmark_List(bookmarks);
	}
	
	//대여소 통계 년도 확인
	public List<String> info_years(Integer number) {
		return stationDao.info_years(number);
	}
	
	//대여소 통계 데이터 가져옴
	public Station_Info chart_data(int number, String years) {
		return stationDao.chart_data(number,years);
	}
	
	
	////////////////////////////////////////////
	
	

	
	public void boardadd(Board board) {
		int max = boardDao.maxNum();
		board.setBoard_no(++max);
		boardDao.insert(board);
	}

	//0115 상원 변경
	public List<Board> boardlist(Integer pageNum, Integer limit, int number) {
		return boardDao.list(pageNum,limit,number);
	}

	public Board getBoard(Integer num, HttpServletRequest request) {
		if(request.getRequestURI().contains("detail")) {
			boardDao.readcntadd(num);
		}
		return boardDao.select(num);
	}
	
	//0115 상원변경
	public int boardcount(int number, int type) {
		return boardDao.count(number, type);
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
	//공지사항리스트 상원 추가
	public List<Board> boardnoticelist(Integer pageNum, int limit) {
		return boardDao.noticelist(pageNum,limit);
	}
	
	///////게시물 덧글관련
	public List<Reply> replyList(Integer board_no) {
		return replyDao.list(board_no);
	}

	public void replyadd(Reply reply) {
		int max = replyDao.maxNum();
		reply.setReply_no(++max);
		reply.setRef(max);
		replyDao.insert(reply);
	}
	
	//대댓글 순서 파악
	public int Max_ref_level(int reply_no) {
		return replyDao.max_ref_level(reply_no);
	}
	
	//대댓글 작성
	public void re_replyadd(Reply reply) {
		int max = replyDao.maxNum();
		reply.setReply_no(++max);
		replyDao.insert(reply);
	}
	
	/////0116츄가
	public void replydelete(Integer replynum) {
		replyDao.delete(replynum);
		
	}
	
	
///////////////////////////회원관련
	public boolean memberexist(Member member) {
		return memberDao.exist(member);
	}

	public Member imformation(Member member) {
		return memberDao.imformation(member);
	}
	public void memberinsert(Member member) {
		memberDao.meminsert(member);
	}
	
	//0116 삭제//상원
	public void userdelete(String user_id) {
		memberDao.memdelete(user_id);
	}
	
	//0116 수정/상원
	public void userupdate(Member member) {
		memberDao.memupdate(member);
	}

	public int nameCheck(String name)
	{	
		return memberDao.memSelect(name);
	}

	

	

	
	









}
