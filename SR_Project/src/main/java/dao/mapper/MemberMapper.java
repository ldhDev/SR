package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import logic.Member;

public interface MemberMapper {
	@Insert("insert into Member(user_id, name, age, gender, email) "
			+ "value(#{user_id},#{name},#{age},#{gender},#{email})")
	void insert(Member member);

	@Update("Update member set #{order} = #{number} where user_id = #{user_id}")
	void bookmark_in(Map<String, Object> param);
}
