package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Select;

public interface CommentMapper {

	@Select("Select count(*) from comment where number = #{number}")
	int score_cnt(Map<String, Integer> param);

	@Select("Select round(avg(score), 1) from comment where number=#{number} group by number")
	Double station_score(Map<String, Integer> param);

}
