package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import dao.mapper.MemberMapper;
import logic.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS="dao.mapper.MemberMapper.";
	public boolean exist(Member member) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", member.getUser_id());
		if(Integer.parseInt(sqlSession.selectOne(NS + "exist",map).toString())==1) {
			return true;
		}else {
			return false;
		}
	}
	public Member imformation(Member member) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", member.getUser_id());
		return sqlSession.selectOne(NS + "imformation",map);
	}
	public void meminsert(Member member) {
		Map<String,Member> map = new HashMap<String,Member>();
		map.put("member", member);
		sqlSession.getMapper(MemberMapper.class).insert(member);
	}
	//0116 삭제 상원추가
	public void memdelete(String user_id) {
		Map<String,String> param = new HashMap<String,String>();
		param.put("user_id", user_id);
		sqlSession.getMapper(MemberMapper.class).delete(param);
	}
	
	//0116 수정/ 상원 추가
	public void memupdate(Member member) {
		sqlSession.getMapper(MemberMapper.class).update(member);
	}	
	
	public int memSelect(String name)
	{
		Map<String, String> map = new HashMap<String,String>();
		map.put("name",name);
		return sqlSession.getMapper(MemberMapper.class).select(map);
	}


}
