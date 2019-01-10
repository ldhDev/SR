package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	

	
	
	
	
	
	
	
	
	
}
