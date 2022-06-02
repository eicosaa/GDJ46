package goodee.gdj.web1.mapper;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj.web1.vo.Member;

@Mapper
public interface MemberMapper {
	void insertMember(Member member);
}
