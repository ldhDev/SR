package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.MemberMapper;
import dao.mapper.StationMapper;
import logic.Station;


@Repository
public class StationDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS="dao.mapper.StationMapper.";
	
	public Station selectOne(String station_no) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("station_no", station_no);
		return sqlSession.selectOne(NS + "list",map);
	}

	public List<Station> list() {
		Map<String,String> map = new HashMap<String,String>();
		return sqlSession.selectList(NS + "list",map);
	}

	public Station info_one(int number) {
		Map<String,Integer> param = new HashMap<String, Integer>();
		param.put("number", number);
		return sqlSession.getMapper(StationMapper.class).info_one(param);
	}

	public void bookmark_in(int number, String user_id, String order) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("number", number);
		param.put("user_id", user_id);
		param.put("order", order);
		sqlSession.getMapper(MemberMapper.class).bookmark_in(param);
	}

	public void bookmark_out(String user_id, int way) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("user_id", user_id);
		param.put("way", way);
		sqlSession.update(NS+"bookmark", param);
	}

	public int bookmark_count(int number) {
		Map<String,Integer> param = new HashMap<String, Integer>();
		param.put("number", number);
		return sqlSession.getMapper(StationMapper.class).bookmark_count(param);
	}

	public List<Station> bookmark_List(String bookmarks) {
		Map<String,String> param = new HashMap<String, String>();
		param.put("bookmarks", bookmarks);
		return sqlSession.getMapper(StationMapper.class).bookmark_List(param);
	}
	

	
	
	
	
	
	
	
	
	
}
