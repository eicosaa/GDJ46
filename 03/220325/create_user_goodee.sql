-- 1) goodee ����� ���� <- DDL
-- 2) goodee ����� ���� �ο� < DCL
-- 3) goodee ����� ���� �� ���� ���� 
--      3-1) ERD���� �������� ��� �� PK ���� -> ������ ����
--      3-2) ���輱 ���� ���̺� ����
--      3-3) ���輱 �ִ� ���̺� ����(FK ���� ���̺���� ...)

drop user goodee cascade;
create user goodee identified by java1004; -- 1)
grant connect, resource, dba to goodee; -- 2)
