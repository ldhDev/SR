package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import logic.Station;

public interface StationMapper {

	@Select("Select * from station where number = #{number}")
	Station info_one(Map<String, Integer> param);

}
