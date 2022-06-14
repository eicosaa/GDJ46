package kr.co.gdu.restapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.restapp.mapper.MemberMapper;
import kr.co.gdu.restapp.vo.Member;

@RestController
public class MemberController {
    @Autowired private MemberMapper memberMapper;
    
    @GetMapping("/getMembers")
    public List<Member> getMembers() {
        System.out.println("/getMembers 요청");
        List<Member> list = memberMapper.selectMemberList();
        System.out.println("memberMapper.selectMemberList().size : "+list.size());
        return list;
    }
    @PostMapping("/addMember")
    public void addMember(Member member) {
        System.out.println("/addMember 요청");
        System.out.println("MemberController.addMember member : "+member);
        memberMapper.insertMember(member);
    }
    @PostMapping("/removeMember")
    public void removeMember(@RequestParam(value="ck[]") String[] ck) { // List<String> ck
         System.out.println("/removeMember 요청");
        System.out.println(ck);
        for(String id : ck) {
            Member member = new Member();
            member.setId(id);
            memberMapper.deleteMember(member);
        }
    }
    @PostMapping("/modifyMember")
    public void modifyMember(Member member) {
        System.out.println("/modifyMember 요청");
        System.out.println("MemberController.modifyMember member : "+member);
        memberMapper.updateMember(member);
    }
}