package kr.co.gdu.restapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.restapp.vo.Member;

@Mapper
public interface MemberMapper {
    public List<Member> selectMemberList();
    public int insertMember(Member member);
    public int deleteMember(Member member);
    public int updateMember(Member member);
}