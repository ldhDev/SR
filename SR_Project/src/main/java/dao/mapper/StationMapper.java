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

	@Select("Select * from station where number in ${bookmarks}")
	List<Station> bookmark_List(Map<String, String> param);

	//대여소 통계 월정보
	@Select("Select distinct month from station_info where number = #{number}")
	List<String> info_years(Map<String, Integer> param);

}
