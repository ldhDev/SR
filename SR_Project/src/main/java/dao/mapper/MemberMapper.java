package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Member;

public interface MemberMapper {
	@Insert("insert into Member(user_id, name, age, gender, email) "
			+ "value(#{user_id},#{name},#{age},#{gender},#{email})")
	void insert(Member member);

	@Update("Update member set ${order} = #{number} where user_id = #{user_id}")
	void bookmark_in(Map<String, Object> param);

	@Select("select count(*) from member where name=#{name}")
	int select(Map<String, String> map);

	//0116추가
	@Delete("delete from member where user_id =#{user_id}")
	void delete(Map<String, String> param);

	//0116추가
	@Update("update member set name=#{name} where user_id =#{user_id}")
	void update(Member member);
}
