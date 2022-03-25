-- 1) goodee 사용자 생성 <- DDL
-- 2) goodee 사용자 권한 부여 < DCL
-- 3) goodee 사용자 접속 후 물리 설계 
--      3-1) ERD에서 시퀀스르 사용 할 PK 도출 -> 시퀀스 생성
--      3-2) 관계선 없는 테이블 생성
--      3-3) 관계선 있는 테이블 생성(FK 없는 테이블부터 ...)

drop user goodee cascade;
create user goodee identified by java1004; -- 1)
grant connect, resource, dba to goodee; -- 2)
