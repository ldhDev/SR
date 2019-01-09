package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;

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

	public List<Board> list(Integer pageNum, Integer limit) {
		Map<String, Object> param = new HashMap<String,Object>();
		int startrow = (pageNum -1) * limit;
		param.put("startrow", startrow);
		param.put("limit", limit);
		return sqlSession.selectList(NS+"list",param);
	}

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

	public int count() {
		Map<String, String> param = new HashMap<String, String>();
		Integer ret = sqlSession.selectOne(NS+"count", param);
		return ret;
	}
}
