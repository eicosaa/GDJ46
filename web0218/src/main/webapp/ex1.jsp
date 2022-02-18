<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 블랙잭 게임 점수 계산 알고리즘
	// 1) 카드 번호는 1 ~ 13, 같은 숫자 3장 가능(중복 가능)
	// 2) 11, 12, 13 -> 10
 	// 3) 1 -> 1  or 11
	// 4) 3장의 카드 합이 21을 넘기지 않으면서 21에 가장 근접한 수를 출력

	int[] num = new int[3];
	// 여러 경우의 값을 대입 후 테스트
	num[0] = 10;
	num[1] = 1;
	num[2] = 1;
	
	// 코드 구현
	
	// for문 or foreach문
	int sum = 0;
	int oneCount = 0; // 1의 횟수가 아니고 1을 11로 치환한 횟수
	for(int i = 0; i < num.length; i = i + 1) { // i++;
		if(num[i] == 1) {
			oneCount = oneCount + 1; // oneCount++;
			sum = sum + 11;
		} else if(num[i] > 10) {
			sum = sum + 10; // 11, 12, 13인 경우는 10으로 합산한다.
		} else {
			sum = sum + num[i];
		}
		
		if(i == 1 && sum >= 21) { // 2번째 조건식
			if(oneCount > 0) {
				sum = sum - 10;
				oneCount = oneCount - 1; // oneCount--;
			}
		} else if(i == 2 && sum > 21) { // 3번째 조건식
			if(oneCount > 0) {
				sum = sum - 10;
				oneCount = oneCount - 1; // oneCount--;
			}
		}
		System.out.println(sum + " <-- for>sum");
	}
	
	System.out.println(sum + " <-- sum");
%>