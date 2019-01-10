package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.CommentMapper;
import logic.Comment;


@Repository
public class CommentDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS="dao.mapper.CommentMapper.";
	
	
	public int score_cnt(Integer number) {
		Map<String,Integer> param = new HashMap<String, Integer>();
		param.put("number", number);
		return sqlSession.getMapper(CommentMapper.class).score_cnt(param);
	}


	public Double station_score(Integer number) {
		Map<String,Integer> param = new HashMap<String, Integer>();
		param.put("number", number);
		return sqlSession.getMapper(CommentMapper.class).station_score(param);
	}


	public List<Comment> comment_List(Integer number) {
		Map<String,Integer> param = new HashMap<String, Integer>();
		param.put("number", number);
		return sqlSession.getMapper(CommentMapper.class).comment_list(param);
	}

}
