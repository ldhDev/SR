package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {
	
	@Select("select ifnull(max(board_no),0) from board")
	Integer maxNum();
	
	@Insert("insert into board(board_no, number, user_id, type, title, user_name, content, readcnt, regdate) values (#{board_no},#{number},#{user_id},#{type},#{title},#{user_name},#{content},0,now())")
	void insert(Board board);
	
	@Update("update board set readcnt=readcnt+1 where board_no=#{board_no}")
	void readcntadd(Map<String, Integer> param);
	//0109
	@Update("update board set title=#{title}, type=#{type}, content=#{content}, regdate=now() where board_no=#{board_no}")
	void update(Board board);
	
	@Delete("delete from board where board_no =#{board_no} ")
	void delete(Map<String, Integer> param);
	
}
