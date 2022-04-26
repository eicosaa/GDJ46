package dao;

import java.util.ArrayList;
import java.util.List;

import vo.Member;

public class MemberDao {
	List<Member> db;
	
	public MemberDao() {
		this.db = new ArrayList<Member>();
		this.db.add(new Member("guest", "1234", 1));
		this.db.add(new Member("admin", "1234", 6));
	}
	
	public Member login(Member member) {
		for(Member m : this.db) {
			if(m.getId().equals(member.getId()) && m.getPw().equals(m.getPw())) {
				return m; // 로그인 성공 시
			}
		}
		return null; // 로그인 실패 시
	}
	
	// 단위테스트 코드
	public static void main(String[] args) {
		MemberDao dao = new MemberDao();
		System.out.println("dao.db.size() : " + dao.db.size()); // 2
		for(Member m : dao.db) {
			System.out.println(m); // m.toString()
			// 결과
			// Member [id=guest, pw=1234, level=1]
			// Member [id=admin, pw=1234, level=6]
		}
		
		System.out.println(dao.login(new Member("admin", "1234", 0))); // 로그인 성공
		System.out.println(dao.login(new Member("guest", "1234", 0))); // 로그인 성공
		System.out.println(dao.login(new Member("test", "1234", 0))); // 로그인 실패
	}
}
