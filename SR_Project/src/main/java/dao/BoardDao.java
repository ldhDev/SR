package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;
import logic.Station;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS="dao.mapper.BoardMapper.";
	
	public int maxNum() {
		Integer i = sqlSession.getMapper(BoardMapper.class).maxNum();
		return i;
	}

	public void insert(Board board) {
		sqlSession.getMapper(BoardMapper.class).insert(board);
	}

	//0115 상원변경
	public List<Board> list(Integer pageNum, Integer limit, int number) {
		Map<String, Object> param = new HashMap<String,Object>();
		int startrow = (pageNum -1) * limit;
		param.put("startrow", startrow);
		param.put("limit", limit);
	
		if(number != -1) {
			param.put("number", number);
		}
		return sqlSession.selectList(NS+"list",param);
	}
	//

	public void readcntadd(Integer num) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("board_no", num);
		sqlSession.getMapper(BoardMapper.class).readcntadd(param);
	}

	public Board select(Integer num) {
		Map<String,Integer> param = new HashMap<String,Integer>();
		param.put("board_no", num);
		param.put("startrow", 0);
		param.put("limit", 1);
		return sqlSession.selectOne(NS+"list",param);
	}
	
	////0115 상원변경
	public int count(int number, int type) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		if(number != -1) {
			param.put("number", number);
		}
		if(type == 0) {
			param.put("type", type);
		}
		Integer ret = sqlSession.selectOne(NS+"count", param);
		return ret;
	}
	//
	
	//0109
	public void update(Board board) {
		sqlSession.getMapper(BoardMapper.class).update(board);
	}

	public void delete(Integer num) {
		Map<String,Integer> param = new HashMap<String,Integer>();
		param.put("board_no", num);
		sqlSession.getMapper(BoardMapper.class).delete(param);
	}

	public Station selectStation(int num) {
		Map<String,Integer> param = new HashMap<String,Integer>();
		param.put("number", num);
		return sqlSession.selectOne("dao.mapper.StationMapper.list",param);
	}

	//0117 쌍원추가 공지사항리스트
	public List<Board> noticelist(Integer pageNum, int limit) {
		Map<String, Object> param = new HashMap<String,Object>();
		int startrow = (pageNum -1) * limit;
		param.put("startrow", startrow);
		param.put("limit", limit);
		param.put("type", 0);
		return sqlSession.selectList(NS+"list",param);
	}
}
