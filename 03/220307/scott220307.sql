-- 서브 쿼리 : 다른 쿼리(메인 쿼리) 안에 내장된 SELECT 문장(서브 쿼리)

-- ex) KING의 부서 정보를 알고 싶다.(조인도 가능)
select deptno from emp
where ename = 'KING'; -- 10번 부서

select * from dept
where deptno = 10; -- 10번 부서 정보를 출력하는데 2번의 질의가 필요하다. 한번에 하는 방법은?

-- 서브 쿼리로 한번에 조회하는 방법
-- 1) 서브쿼리가 값을 대신 
-- -> insert ... values()안에도 값 대신 사용
-- -> update ... set 컬럼명 = 값 값 대신 사용
select * from dept                     -- 메인 쿼리
where deptno = (select deptno from emp
                where ename = 'KING'); -- 서브 쿼리

-- 2) 서브 쿼리가 테이블 대신 -> "인라인뷰"
select rownum, empno, ename -- 실행순서2
from emp -- 실행순서1
order by ename asc; -- 실행순서3 order by 마지막 수행되면서 출력결과의 rownum은 순차적이지 않게 된다.

select rownum, t.empno, t.ename
from (select empno, ename
from emp
order by ename asc) t; -- 인라인뷰도 서브쿼리의 한 종류다.

-- 3) select 뒤에 컬럼명 대신 -> 스칼라 서브쿼리(꼭 단일행(스칼라)결과를 조회하는 select)
-- 사원의 sal출력하고 추가로 sal의 전체평균 출력해주세요.
select floor(avg(sal)) 평균 
from emp;

select empno, ename, sal, 1994 sal평균 
from emp; -- 2번의 쿼리

select empno, ename, sal, (select floor(avg(sal)) 평균 from emp) sal평균
from emp; -- 서브 쿼리를 사용해 한번에 조회

-- 서브 쿼리는 위치에 따라서 1)스칼라서브쿼리 2)인라인뷰 3)서브쿼리의 결과값비교
-- 3-1) 서브쿼리의 결과 한 행일 때 사용하는 연산자(=, !=, ^-, <>, >, >=, <, <=)
-- CHICAGO에 일하는 사원 출력
select *
from emp
where deptno = (select deptno 
          from dept
          where loc = 'CHICAGO'); -- 서브쿼리 결과물은 1행
          
select *
from emp
where sal < (select avg(sal)
             from emp); -- 서브쿼리 결과물은 1행

-- KING과 GOODEE가 sal, deptno이 동일하게...
update emp set sal = 5000, deptno = 10 where ename = 'GOODEE';
commit;
select ename, deptno, sal from emp;

select *
from emp
where ename != 'KING' and deptno = 10 and sal = 5000;
-- 결과 열의 개수는 연산자와는 관계가 없다
select *
from emp
where ename != 'KING' and (dept, sal) = (select deptno, sal from emp where ename = 'KING');

-- 3-2) 서브쿼리의 결과가 여러 행일 때 사용하는 연산자
-- in (여러 행의 결과값 중에 하나의 행만 일치(=)하면 참)
-- any (여러 행의 결과값 중에 하나의 행값이라도 만족(<, >)하면 참)
-- all (여러 행의 결과값 중에 하나의 행값이라도 만족(<, >)하면 참)
-- exists, not exists : in이랑 결과값은 같다. in보다 속도 빠르다.

-- 사원 중에 각 부서의(본인 부서가 아니어도) 최대값과 같은 사원
select max(sal) from emp group by deptno;

select * from emp where sal = 2850 or sal = 3000 or sal = 5000;
select * from emp where sal in(2850, 3000, 5000);
select * from emp
where sal in (select max(sal) from emp group by deptno); -- 서브쿼리 결과가 3행
-- where sal in (select max(sal) from emp group by deptno); in대신 =, <, > 단일행 결과에 사용하는 연산자는 사용이 안된다.

select * from emp
where sal = any (select max(sal) from emp group by deptno);
select * from emp
where sal = some (select max(sal) from emp group by deptno);
-- =any나 =some은 in과 동일하다

select * from emp
where sal < any (select max(sal) from emp group by deptno);
-- any 뒷값 중하나라도 만족하면 참
-- <any 제일 큰 값보다 작은 값 모두
-- >any 제일 작은 값보다 큰 값 모두

select * from emp
where sal < all (select max(sal) from emp group by deptno);
-- all 뒷값 모두를 만족하면 참

-- * 서브쿼리의 결과 열의 수는 비교연산자와는 관계없다. 
-- (ex> 2열1행 -> 1행에 사용하는 비교연산자, 3행3열 -> 다중행 비교연산자 사용

-- emp 중에 관리자 역할을 하는 사람만 출력
select distinct mgr from emp
where mgr is not null;
-- 1) join
select ename 
from emp e inner join (select distinct mgr from emp where mgr is not null) t
on e.empno = t.mno;
-- 2) subquery로 해결
select ename from emp
where empno in (select distinct mgr from emp
                where mgr is not null);
                
select ename from emp
where exists (select distinct mgr from emp
              where mgr is not null);




















