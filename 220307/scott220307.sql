-- ���� ���� : �ٸ� ����(���� ����) �ȿ� ����� SELECT ����(���� ����)

-- ex) KING�� �μ� ������ �˰� �ʹ�.(���ε� ����)
select deptno from emp
where ename = 'KING'; -- 10�� �μ�

select * from dept
where deptno = 10; -- 10�� �μ� ������ ����ϴµ� 2���� ���ǰ� �ʿ��ϴ�. �ѹ��� �ϴ� �����?

-- ���� ������ �ѹ��� ��ȸ�ϴ� ���
-- 1) ���������� ���� ��� 
-- -> insert ... values()�ȿ��� �� ��� ���
-- -> update ... set �÷��� = �� �� ��� ���
select * from dept                     -- ���� ����
where deptno = (select deptno from emp
                where ename = 'KING'); -- ���� ����

-- 2) ���� ������ ���̺� ��� -> "�ζ��κ�"
select rownum, empno, ename -- �������2
from emp -- �������1
order by ename asc; -- �������3 order by ������ ����Ǹ鼭 ��°���� rownum�� ���������� �ʰ� �ȴ�.

select rownum, t.empno, t.ename
from (select empno, ename
from emp
order by ename asc) t; -- �ζ��κ䵵 ���������� �� ������.

-- 3) select �ڿ� �÷��� ��� -> ��Į�� ��������(�� ������(��Į��)����� ��ȸ�ϴ� select)
-- ����� sal����ϰ� �߰��� sal�� ��ü��� ������ּ���.
select floor(avg(sal)) ��� 
from emp;

select empno, ename, sal, 1994 sal��� 
from emp; -- 2���� ����

select empno, ename, sal, (select floor(avg(sal)) ��� from emp) sal���
from emp; -- ���� ������ ����� �ѹ��� ��ȸ

-- ���� ������ ��ġ�� ���� 1)��Į�󼭺����� 2)�ζ��κ� 3)���������� �������
-- 3-1) ���������� ��� �� ���� �� ����ϴ� ������(=, !=, ^-, <>, >, >=, <, <=)
-- CHICAGO�� ���ϴ� ��� ���
select *
from emp
where deptno = (select deptno 
          from dept
          where loc = 'CHICAGO'); -- �������� ������� 1��
          
select *
from emp
where sal < (select avg(sal)
             from emp); -- �������� ������� 1��

-- KING�� GOODEE�� sal, deptno�� �����ϰ�...
update emp set sal = 5000, deptno = 10 where ename = 'GOODEE';
commit;
select ename, deptno, sal from emp;

select *
from emp
where ename != 'KING' and deptno = 10 and sal = 5000;
-- ��� ���� ������ �����ڿʹ� ���谡 ����
select *
from emp
where ename != 'KING' and (dept, sal) = (select deptno, sal from emp where ename = 'KING');

-- 3-2) ���������� ����� ���� ���� �� ����ϴ� ������
-- in (���� ���� ����� �߿� �ϳ��� �ุ ��ġ(=)�ϸ� ��)
-- any (���� ���� ����� �߿� �ϳ��� �ప�̶� ����(<, >)�ϸ� ��)
-- all (���� ���� ����� �߿� �ϳ��� �ప�̶� ����(<, >)�ϸ� ��)
-- exists, not exists : in�̶� ������� ����. in���� �ӵ� ������.

-- ��� �߿� �� �μ���(���� �μ��� �ƴϾ) �ִ밪�� ���� ���
select max(sal) from emp group by deptno;

select * from emp where sal = 2850 or sal = 3000 or sal = 5000;
select * from emp where sal in(2850, 3000, 5000);
select * from emp
where sal in (select max(sal) from emp group by deptno); -- �������� ����� 3��
-- where sal in (select max(sal) from emp group by deptno); in��� =, <, > ������ ����� ����ϴ� �����ڴ� ����� �ȵȴ�.

select * from emp
where sal = any (select max(sal) from emp group by deptno);
select * from emp
where sal = some (select max(sal) from emp group by deptno);
-- =any�� =some�� in�� �����ϴ�

select * from emp
where sal < any (select max(sal) from emp group by deptno);
-- any �ް� ���ϳ��� �����ϸ� ��
-- <any ���� ū ������ ���� �� ���
-- >any ���� ���� ������ ū �� ���

select * from emp
where sal < all (select max(sal) from emp group by deptno);
-- all �ް� ��θ� �����ϸ� ��

-- * ���������� ��� ���� ���� �񱳿����ڿʹ� �������. 
-- (ex> 2��1�� -> 1�࿡ ����ϴ� �񱳿�����, 3��3�� -> ������ �񱳿����� ���

-- emp �߿� ������ ������ �ϴ� ����� ���
select distinct mgr from emp
where mgr is not null;
-- 1) join
select ename 
from emp e inner join (select distinct mgr from emp where mgr is not null) t
on e.empno = t.mno;
-- 2) subquery�� �ذ�
select ename from emp
where empno in (select distinct mgr from emp
                where mgr is not null);
                
select ename from emp
where exists (select distinct mgr from emp
              where mgr is not null);




















