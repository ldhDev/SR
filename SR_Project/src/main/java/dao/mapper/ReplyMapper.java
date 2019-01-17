package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Reply;

public interface ReplyMapper {

	@Select("select ifnull(max(reply_no),0) from reply")
	Integer maxNum();
	
	@Insert("insert into reply(reply_no ,board_no, user_id, user_name, content, regdate, ref, reflevel) "
			+ "values (#{reply_no},#{board_no},#{user_id},#{user_name},#{content},now(),#{ref},0)")
	void insert(Reply reply);

	@Delete("delete from reply where reply_no =#{reply_no}")
	void delete(Map<String, Integer> param);
}
