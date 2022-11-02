use practiceDB

create table dept(  
  deptno     int,  
  dname      varchar(14),  
  loc        varchar(13),  
  constraint pk_dept primary key (deptno)  
);
 

create table emp(  
  empno    int,  
  ename    varchar(10),  
  job      varchar(9),  
  mgr      int,  
  hiredate date,  
  sal      float(15),  
  comm     int,  
  deptno   int,  
  constraint pk_emp primary key (empno),  
  constraint fk_deptno foreign key (deptno) references dept (deptno)  
);
 
CREATE TABLE salgrade(
  grade int,
  losal int,
  hisal int
);
 
 
insert into DEPT (DEPTNO, DNAME, LOC)
values(10, 'ACCOUNTING', 'NEW YORK');
 
insert into dept  
values(20, 'RESEARCH', 'DALLAS');
 
insert into dept  
values(30, 'SALES', 'CHICAGO');
 
insert into dept  
values(40, 'OPERATIONS', 'BOSTON');
 
TRUNCATE TABLE EMP;
 
insert into emp  
values(  
 7839, 'KING', 'PRESIDENT', null,  
 '1981-11-17',  
 5000, null, 10  
);
 

insert into emp  
values(  
 7698, 'BLAKE', 'MANAGER', 7839,  
 '1981-05-01',  
 2850, null, 30  
);
 
insert into emp  
values(  
 7782, 'CLARK', 'MANAGER', 7839,  
 '1981-06-09', 
 2450, null, 10  
);
 
insert into emp  
values(  
 7566, 'JONES', 'MANAGER', 7839,  
'1981-04-02',  
 2975, null, 20  
);
 
insert into emp  
values(  
 7788, 'SCOTT', 'ANALYST', 7566,  
 '1987-07-13',  
 3000, null, 20  
);
 
insert into emp  
values(  
 7902, 'FORD', 'ANALYST', 7566,  
 '1981-12-03'  ,
 3000, null, 20  
);
 
insert into emp  
values(  
 7369, 'SMITH', 'CLERK', 7902,  
 '1980-12-17',  
 800, null, 20  
);
 
insert into emp  
values(  
 7499, 'ALLEN', 'SALESMAN', 7698,  
 '1981-02-20', 
 1600, 300, 30  
);
 
insert into emp  
values(  
 7521, 'WARD', 'SALESMAN', 7698,  
'1981-02-22',
 1250, 500, 30  
);
 
insert into emp  
values(  
 7654, 'MARTIN', 'SALESMAN', 7698,  
 '1981-09-28',  
 1250, 1400, 30  
);
 
insert into emp  
values(  
 7844, 'TURNER', 'SALESMAN', 7698,  
'1981-08-09',  
 1500, 0, 30  
);
 
insert into emp  
values(  
 7876, 'ADAMS', 'CLERK', 7788,  
'1987-07-13',   
 1100, null, 20  
);
 
insert into emp  
values(  
 7900, 'JAMES', 'CLERK', 7698,  
 '1981-12-03',  
 950, null, 30  
);
 

insert into emp  
values(  
 7934, 'MILLER', 'CLERK', 7782,  
 '1982-01-23', 
 1300, null, 10  
);
 
INSERT INTO salgrade VALUES (1, 700, 1200);
INSERT INTO salgrade VALUES (2, 1201, 1400);
INSERT INTO salgrade VALUES (3, 1401, 2000);
INSERT INTO salgrade VALUES (4, 2001, 3000);
INSERT INTO salgrade VALUES (5, 3001, 9999);
 
COMMIT;

select * from dbo.dept 

select * from dbo.emp

select * from dbo.salgrade










--All rows and all columns:
select * from dbo.emp
 
-- Specific columns but all rows:
select ename,job
from dbo.emp
 
--specific column and specific rows
select ename,job,deptno
from dbo.emp
where deptno=30
 
--all columns but specific rows
select * from dbo.emp
where deptno=30
 
--=======================
--Operators:
--Arithmatic: +,-,*
select (9*8+2)
 
select sal * 12 as "Annual sal"
from dbo.emp
 
select ename, sal,comm,sal + isnull(comm,0) as "Total sal"
from dbo.emp
 
select ename, sal,comm,sal + coalesce(comm,0) as "Total sal"
from dbo.emp
 
--Relational operator(<, >, <=, >=, <>)
select ename,sal,deptno
from dbo.emp
where sal > 2000;
 
select ename,sal,deptno
from dbo.emp
where deptno != 20;
 
--Logical Operator:AND OR NOT
select ename,sal,deptno
from dbo.emp
where sal >= 2000 and sal <=3000
 
select ename,sal,deptno,job
from dbo.emp
where job='CLERK' or job='salesman';
 
--Other operators:
 
select ename,sal,deptno
from dbo.emp
where sal between 2000 and 3000
 
select ename,sal,deptno
from dbo.emp
where NOT sal between 2000 and 3000
 
select ename,sal,deptno,job
from dbo.emp
where job in ('CLERK' , 'salesman');
 
--%: any char any no of times
select ename
from dbo.emp
where ename like 'K%G';
 
--_: exactly one char
select ename
from dbo.emp
where ename like 'K___';
 
select ename
from dbo.emp
where ename NOT like 'A%';


select *
from emp
where job ='salesman' and sal> 1500;


select *  
from emp
where  comm IS NULL or comm = 0 and comm <100


select *  
from emp
where job in ('manager')or (job = 'clerk'  and deptno=20); 


select *  
from emp
where sal between 1200 and 1400; 

select *  
from emp


select *  
from emp
where deptno = 20 and job not in ('manager', 'clerk')  ; 


select *,sal + isnull(comm,250) as "Net Earning"
from dbo.emp


select *
from dbo.emp
where comm > sal * (0.6);


select *, sal * (0.6)
from dbo.emp
where comm > sal * (0.6);
