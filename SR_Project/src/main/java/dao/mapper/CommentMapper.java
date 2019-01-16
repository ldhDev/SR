package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Comment;

public interface CommentMapper {

	@Select("Select count(*) from comment where number = #{number}")
	int score_cnt(Map<String, Integer> param);

	@Select("Select round(avg(score), 1) from comment where number=#{number} group by number")
	Double station_score(Map<String, Integer> param);

	@Select("Select * from comment where number=#{number} order by comment_no DESC limit #{startrow},#{limit}")
	List<Comment> comment_list(Map<String, Integer> param);

	@Select("Select ifnull(max(comment_no),0) from comment")
	int comment_maxNo();

	@Insert("insert into comment values(#{comment_no},#{user_id},#{number},#{score},#{comment},#{user_name},now())")
	void comment_insert(Comment cmmt);

	@Select("Select * from comment where number = #{number} and user_id = #{user_id}")
	Comment comment_one(Map<String, Object> param);

	@Delete("Delete from comment where number = #{number} and user_id = #{user_id}")
	void comment_delete(Map<String, Object> param);


}
