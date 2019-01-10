package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import logic.Comment;

public interface CommentMapper {

	@Select("Select count(*) from comment where number = #{number}")
	int score_cnt(Map<String, Integer> param);

	@Select("Select round(avg(score), 1) from comment where number=#{number} group by number")
	Double station_score(Map<String, Integer> param);

	@Select("Select * from comment where number=#{number}")
	List<Comment> comment_list(Map<String, Integer> param);

}
