package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import logic.Station;

public interface StationMapper {

	@Select("Select * from station where number = #{number}")
	Station info_one(Map<String, Integer> param);

	@Select("Select count(*) from member where #{number} in (bookmark1,bookmark2,bookmark3)")
	int bookmark_count(Map<String, Integer> param);

}
