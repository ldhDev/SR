package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ReplyMapper;
import logic.Reply;

@Repository
public class ReplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS="dao.mapper.ReplyMapper.";
	
	public List<Reply> list(int board_no) {
		Map<String, Integer> param = new HashMap<String,Integer>();
		param.put("board_no", board_no);
		return sqlSession.selectList(NS+"list",param);
	}

	public int maxNum() {
		Integer i = sqlSession.getMapper(ReplyMapper.class).maxNum();
		return i;
	}

	public void insert(Reply reply) {
		sqlSession.getMapper(ReplyMapper.class).insert(reply);
	}

	///0116Ãß°¡
	public void delete(Integer replynum) {
		Map<String,Integer> param = new HashMap<String,Integer>();
		param.put("reply_no", replynum);
		sqlSession.getMapper(ReplyMapper.class).delete(param);
	}

	//´ë´ñ±Û
	public int max_ref_level(int reply_no) {
		Map<String,Integer> param = new HashMap<String,Integer>();
		param.put("reply_no", reply_no);
		try {
			return sqlSession.getMapper(ReplyMapper.class).max_level(param);
		}
		catch(Exception e){
			System.out.println(e);
			return 0;
		}
		
	}

}
