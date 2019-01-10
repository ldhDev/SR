package dao.mapper;

import org.apache.ibatis.annotations.Insert;

import logic.Member;

public interface MemberMapper {
	@Insert("insert into Member(user_id, name, age, gender, email) "
			+ "value(#{user_id},#{name},#{age},#{gender},#{email})")
	void insert(Member member);
}
