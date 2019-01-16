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


	public List<Comment> comment_List(Integer number,int pageNum,int limit) {
		Map<String,Integer> param = new HashMap<String, Integer>();
		int startrow = (pageNum -1) * limit;
		param.put("startrow", startrow);
		param.put("limit", limit);
		param.put("number", number);
		return sqlSession.getMapper(CommentMapper.class).comment_list(param);
	}


	public int comment_maxNo() {
		return sqlSession.getMapper(CommentMapper.class).comment_maxNo();
	}


	public void comment_insert(Comment cmmt) {
		sqlSession.getMapper(CommentMapper.class).comment_insert(cmmt);
	}


	public Comment comment_one(Integer number, String user_id) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("number", number);
		param.put("user_id",user_id);
		return sqlSession.getMapper(CommentMapper.class).comment_one(param); 
	}


	public void comment_delete(int number, String user_id) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("number", number);
		param.put("user_id",user_id);
		sqlSession.getMapper(CommentMapper.class).comment_delete(param);
	}

}
