package main;

// import java.util.Scanner;
// import java.util.ArrayList;
import java.util.*;
import vo.Record;

public class Ex1 {

	public static void main(String[] args) {
		// 자료를 저장하는 방법
		// 1) 메모리(배열, 리스트, ... --> 휘발성 메모리(램) ->전원off 시 모두 삭제
		// 2) 파일(txt, 엑셀, ...) --> 비휘발성 --> 파일에 따라 규칙이 다르다 --> 비정형화
		// 3) 데이터베이스 관리 시스템(Oracle, mysql ,mssql, mariadb, ...) --> SQL문법 학습이 필요(학습커브)
		
		
		// 1) 메모리를 이용하여 프로그램을 구현
		// 성적을 저장할 데이터타입(변수) --> Record.class
		// 여러 명의 성적을 저장 할 자료 구조 --> 배열 Record[] --> 배열(정적 배열) 불편 --> 동적 배열을 사용 --> ArrayList<Score>
		
		ArrayList<Record> list = new ArrayList<Record>();
		// sample 데이터 하나만 입력
		/*
		Record record = new Record();
		record.studentName = "구인이";
		record.subject = "국어";
		record.score = 100;
		list.add(record);
		*/
		
		// 메인 메소드의 역할 : 프로그램의 시작점(진입단) --> 메인 메소드의 종료 --> 단일스레드의 경우 프로그램의 종료 --> 이 프로그램에 사용한 메모리가 삭제
		// --> 무한루프가 필요 -> 무한루트를 탈출(break) --> 메인종료 --> 프로그램 종료
		// while(true) { }
		for(;;) { // for문을 이용한 무한루프 --> 무한루프 탈출을 위한 break;키워드가 필요
			
			// 메인 메뉴 출력
			System.out.println("");
			System.out.println("[학생 성적 관리]");
			System.out.println("1. 학생 성적 출력");
			System.out.println("2. 학생 성적 입력");
			System.out.println("3. 학생 성적 수정");
			System.out.println("4. 학생 성적 삭제");
			System.out.println("5. 학생 성적 관리 종료");
			System.out.println("1 ~ 5번 중 선택하세요 : ");
			
			// 사용자 메인 메뉴 선택
			Scanner s = new Scanner(System.in);
			int mainMenuNum = s.nextInt();
			// 메인 메뉴 선택에 따른 분기 --> switch문 사용이 불편 --> mainMenuNum == 5일때 break 실행 때문에
			if(mainMenuNum == 1) {
				// System.out.println("1번을 선택"); // 디버깅
				// 학생의 성적을 출력
				if(list.size() == 0) { // 자료구조(list)안에 데이터가 없을 때
					System.out.println("성적 데이터가 없습니다.");
				} else { // 자료구조(list)안에 데이터가 있을 때
					for(Record r : list) { // list안에 데이터를 foreach문을 사용하여 출력
						System.out.println(r.studentName + ", " + r.subject + ", " + r.score);
					}
				}
			} else if(mainMenuNum == 2) {
				// System.out.println("2번을 선택");
				// 학생의 성적을 입력
				System.out.println("학생 이름을 입력하세요.");
				String studentName = s.next();
				System.out.println("과목을 입력하세요.");
				String subject = s.next();
				System.out.println("점수를 입력하세요.");
				int score = s.nextInt();
				// 입력 받은 값들을 하나의 Record 값으로 저장 후 리스트에 추가
				Record r = new Record();
				r.studentName = studentName;
				r.subject = subject;
				r.score = score;
				list.add(r);
				System.out.println("입력 성공. 현재 " + list.size() + "명");
			
			} else if(mainMenuNum == 3) {
				// System.out.println("3번을 선택");
				// 학생의 성적을 수정
				if(list.size() == 0) {
					System.out.println("데이터의 크기가 0 입니다.");
				} else {
					System.out.println("수정 할 학생 이름을 입력하세요.");
					String studentName = s.next();
					System.out.println("수정 할 과목을 입력하세요.");
					String subject = s.next();
					System.out.println("수정 할 점수를 입력하세요.");
					int score = s.nextInt();
					
					// list를 순환 검색 후 조건에 맞으면 수정(쓰기) --> foreach문 사용 불가 (-foreach문은 읽기만)
					for(int i=0; i<list.size(); i=i+1) {
						if(list.get(i).studentName.equals(studentName) && list.get(i).subject.equals(subject)) {
							list.get(i).score = score;
							System.out.println("데이터가 수정되었습니다.");
							break;
						} else {
							System.out.println("수정 할 데이터가 존재하지 않습니다.");
						}
					}
				}
				
			} else if(mainMenuNum == 4) { 
				// System.out.println("4번을 선택");
				// 학생의 성적을 삭제
				if(list.size() == 0) {
					System.out.println("데이터의 크기가 0 입니다.");
				} else {
					System.out.println("삭제 할 학생 이름을 입력하세요.");
					String studentName = s.next();
					System.out.println("삭제 할 과목을 입력하세요.");
					String subject = s.next();
										
					// list를 순환 검색 후 조건에 맞으면 삭제
					for(int i=0; i<list.size(); i=i+1) {
						if(list.get(i).studentName.equals(studentName) && list.get(i).subject.equals(subject)) {
							list.remove(i); // remove : 리스트의 특정 값 삭제
							System.out.println("데이터가 삭제되었습니다.");
							break;
						} else {
							System.out.println("삭제 할 데이터가 존재하지 않습니다.");
						}
					}
				}
			} else if(mainMenuNum == 5) {
				System.out.println("5번을 선택(프로그램 종료)");
				// 반복문 탈출 --> 메인이 종료 --> 프로그램이 종료
				break;
			} else {
				System.out.println("1 ~ 5번을 선택하세요!");
			}
		}
		// for문과 if문을 사용 --> while문과 switch문을 사용
	}

}
