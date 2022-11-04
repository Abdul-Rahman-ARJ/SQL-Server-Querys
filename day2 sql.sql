select ename, hiredate,DATEDIFF(year,hiredate,getdate()) as number_of_years
from emp
where DATEDIFF(year,hiredate,getdate())>=40







select ename, job, sal,
CASE
    WHEN sal > 2000 THEN 'The salary is greater than 2000'
    WHEN sal between 2000 and 5000 THEN 'The salary is between 2000 and 5000'
    ELSE 'The less than 2000'
END AS Salary_details
FROM emp;

SELECT RAND(10)


select ename, deptno, hiredate
from emp
where year(hiredate) =1981
order by  hiredate


select ename, deptno, sal, comm
from emp
where comm is null or comm = 0
order by  deptno


select * 
from emp
where MONTH(hiredate) = 2

select ename , job, CONCAT(ename,' ',job) as nameWithJob
from emp


select *
from emp
where ename like 'M%' or ename like '%M'


select * ,sal + ISNULL(comm, 0 ) as total_salary
from emp
where sal + ISNULL(comm, 0 ) > 2000


select ename, job, sal
from emp
order by job, sal

select deptno , count(empno) as EmplyoeSizeByDept
from emp
group by deptno
having count(empno)  > 2;

select *
from emp

select deptno , round(avg(sal),2) as AvrageSalary
from emp
where hiredate > DATEFROMPARTS(1980, 06, 01)
group by deptno

select job , min(sal) as minimum, max(sal)as Maximum,floor(avg(sal)) as Average
from emp
group by job

select *
from emp
where job = 'manager' and year(hiredate) = 1981

select right(ename,15) from emp;

SELECT RIGHT ( REPLICATE(' ', 15) + ename, 15)
from emp

SELECT RIGHT( REPLICATE('*', 15- len(ename)) + ename, 15)
from emp


select *
from emp
where ename not like 'A%'

select *
from emp
where ename not like '%R'


select CHARINDEX(ename,'MA')
from emp

select * , ROUND(sal,2) as RoundedSalary
from emp
where sal = 1000

select *, datediff(MONTH,hiredate,GETDATE()) as "months completed" 
from emp

select *
from emp
order by job desc, sal
use practiceDB
select *
from emp
where DATEDIFF(year,hiredate,GETDATE()) > 1

select *
from emp full outer join dept on emp.deptno = dept.deptno
--where emp.deptno = dept.deptno

select distinct count(job)
from emp 
where job = 'bosses'

select max(sal) - min(sal)
from emp 

select distinct ename, deptno
from emp
group by deptno,ename



select ename, dname,sal,hiredate
from emp e, dept d
where e.deptno=d.deptno and  DATEDIFF(year,hiredate,GETDATE()) > 40

select * from salgrade
select ename, dname, grade,sal
from emp e, dept d, salgrade s
where e.deptno=d.deptno and sal between s.losal and s.hisal

select *
from emp 
full outer join dept 
on emp.deptno = dept.deptno

select *
from emp 
left join dept 
on emp.deptno = dept.deptno
union 

select *
from emp 
right outer join dept 
on emp.deptno = dept.deptno


select w.ename,w.hiredate,m.hiredate
from emp w, emp m
where w.empno=m.mgr and m.hiredate > w.hiredate

select w.ename,m.ename
from emp w
left join emp m 
on w.mgr=m.empno



--Display department name, location name, no. of people working there and average salary. Round average salary to 2 decimal places.

select dname,loc,count(ename) as "No. of People",round(AVG(sal),2) as "average sal"
from emp e, dept d
where e.deptno = d.deptno
group by dname,loc




select *
from emp
where deptno = (
select deptno from emp
where ename = 'BLAKE') and ename != 'blake'


select ename, sal
from emp
where mgr = (
select empno from emp
where ename = 'KING')

--Display name , hire date and salary of all the employees who have both salary and commission same as SCOTT. Donot include Scott in the list.
select ename, hiredate ,sal,comm
from emp
where sal = (
select sal from emp
where ename = 'SCOTT')
and isnull(comm,0) = (
select isnull(comm,0) 
from emp
where ename = 'SCOTT')
and ename != 'SCOTT'


--List different grades of employees working in ‘DALLAS’
select ename,grade
from salgrade, emp
where  sal between losal and hisal and deptno in (
select d.deptno
from emp e, dept d
where e.deptno = d.deptno and d.loc = 'DALLAS'
)

select ename,loc,sal from emp inner join dept on emp.deptno = dept.deptno
where loc= 'DALLAS'
group by loc,ename,sal



select * from emp inner join dept on emp.deptno = dept.deptno

--WAB to display deptt name and loc for inputed deptno

begin
	--declare all variables
	declare @dept_name varchar(20);
	declare @dept_loc varchar(20);
	declare @dept_no int = 10;
	--extracting data from db and storing in local var
	select @dept_name = dname, @dept_loc = loc
	from dept 
	where deptno = @dept_no
	--Printing result
	print 'Dept Name = ' + @dept_name;
	print 'Dept Location = ' + @dept_loc;
end;



--WAB to fetch enmae,job,sal,deptno for all emp who joined before 01-07-1981

begin 
	select e.ename, e.job, e.sal, e.deptno
	into #v_emp_tbl
	from emp e
	where hiredate < '1981-07-01'
	select *
	from #v_emp_tbl
end;




--WAB to fetch details of all such emp who stays in DALLAS

begin 
	select e.ename, e.job, e.sal, e.deptno
	into #v_emp_tbl3
	from emp e, dept d
	where e.deptno = d.deptno and d.loc = 'DALLAS' and hiredate < '1981-07-01'
	select *
	from #v_emp_tbl3
end;


--WAB to print max of 3 numbers

begin 
	declare @num1 int = 10;
	declare @num2 int = 20;
	declare @num3 int = 40;
	if(@num1 > @num2 and @num1>@num3)
		print 'Num 1 is greater than num2 and num3'
	if(@num2 > @num1 and @num2>@num3)
		print 'Num 2 is greater than num1 and num3'
	else
		print 'Num 3 is greater than num1 and num2'
end;




begin
	declare @choice nchar(1)= 'C'
	declare @temp_in_C float = 24;
	declare @temp_in_F float = 98;
	declare @res float;
	if(@choice = 'F')
		begin
			set @res = (@temp_in_F - 32)*5/9;
			print cast(@temp_in_C as varchar(10)) +'F Temp in Celcius = ' + cast(@res as varchar(10))
		end
	else
		begin
			set @res = (@temp_in_C * 9/5)+32
			print cast(@temp_in_C as varchar(10)) +'C Temp in Farenhite= ' + cast(@res as varchar(10))
		end

end


--Find names, job and salaries of all employees and also his immediate boss.

select p.ename, job, sal, t1.ename
from emp p, ()t1
where p.mgr = t1.empno

select w.ename,e.sal, w.job,w.mgr ,e.empno, e.ename as Mangers
from emp w,emp e
where w.mgr = e.empno

--List all the department names along with the names of managers in them , irrespective of the fact whether any manager is there or not.
select e.ename, dname
from emp e right join dept d
on e.deptno = d.deptno
inner join emp w  on w.mgr = e.empno
where e.mgr is null




select distinct dname,Mangers
from 
(select e.ename as Mangers,e.deptno
from emp w,emp e
where w.mgr = e.empno)M right join dept d
on M.deptno = d.deptno



select *
from dept

--Find the names of those employees who earn more than their boss.
select e.ename as Mangers,w.ename as Employee, w.sal as EmployeeSal, e.sal as MangersSal
from emp w,emp e
where w.mgr = e.empno and w.sal > e.sal


select w.ename as emp, e.ename as bossc, w.deptno, e.deptno
from emp w,emp e
where w.mgr = e.empno and e.deptno <> w.deptno

--Count distinct salary figures and number of employees receiving it.
select sal,count(ename) as NumberOfEmplReciving
from emp
group by sal

--Display the  boss and the salary of  lowest paid employee for him. Don’t include minimum salary below Rs. 1000
select distinct e.ename as boss,w.ename, min(w.sal)
from emp w,emp e
where w.mgr = e.empno and w.sal >1000
group by e.ename,w.sal,w.ename
--having min(w.sal) > 1000
ORDER BY MIN(w.sal)

select e1.ename,min(e.sal)
from emp e,emp e1
where e.mgr is not null and e.mgr = e1.empno
group by e1.ename
having min(e.sal) > 1000
order by min(e.sal)


--Find all the department details in which at least one employee is working.
select dname, count(empno)
from emp e,dept d
where e.deptno = d.deptno
group by dname
having count(empno)>=1

--Find all, who are bosses of least one employee.
select e1.ename,count(e.empno)
from emp e,emp e1
where e.mgr is not null and e.mgr = e1.empno
group by e1.ename
having count(e.empno) >=1


--Find average annual salary of all the employees except analysts.
select avg(sal) as avrageSal
from emp
where job != 'analyst'

--Create unique listing of all the jobs that are in dept. 30. Include location of the dept. in the output.
select job,loc
from emp e,dept d
where e.deptno = d.deptno and e.deptno = 30
group by job,loc


select e.ename, e.job, e.sal, dname,loc
	from emp e, dept d
	where e.deptno = d.deptno and d.loc = 'DALLAS'

--List  employee name and hiredate of all employees who  are hired after  BLAKE.
select ename,hiredate
from emp 
where hiredate > (select hiredate
	from emp 
	where ename = 'BLAKE')

--List employee name , hiredate, manager name, manager’s hiredate   of all employees who  are hired before their managers.
select e.ename as Mangers,w.ename as Employee, e.hiredate as mgrHire, w.hiredate as EMPHire
from emp w,emp e
where w.mgr = e.empno and e.hiredate > w.hiredate

--Display the job and the difference between the highest and the lowest salary for each job.
select job , max(sal) - min(sal) as 'difference between the highest and the lowest salary'
from emp
group by job

--Display dept. name, location, no.of employees in the dept. and average salary of the dept. rounded to 2 decima
select dname,loc,count(empno),round(avg(sal),2)
from emp e, dept d
where e.deptno= d.deptno
group by dname,loc

--List employees who earn salary higher than the highest salary of clerks.

use practiceDB
select * 
from emp
where sal > (select max(sal )
		from emp 
		where job = 'CLERK')

--List employees whose  salary is higher than the average salary of employees in department no. 10.

select * 
from emp
where sal > (
		select avg(sal)
		from emp
		where deptno = 10
	)

--Display  the names of employees who are earning minimum and maximum salary in one line.

select ename
from emp
where sal = (
	select min(sal)
	from emp
)
or
sal = (
	select max(sal)
	from emp
)

select sal,ename,min(sal),max(sal)
from emp
group by min(sal)
having min(sal) > max(sal)

--Find out top 4 salaries of the company. Display their rank as well
select top 4 sal,grade
from emp e, salgrade s
where sal between losal and hisal
group by sal,grade
order by sal desc

--Find out earliest 3 employees who have joined the company. Display their rank as well.
select top 3 ename,grade,hiredate
from emp e, salgrade s
where sal between losal and hisal
group by hiredate,ename,grade
order by hiredate

--Print employee name, salary and average salary of his department.


select ename,sal,T1.avg_sal
from
(select deptno,round(avg(sal),2) as avg_sal
from emp
group by deptno)T1
,emp
where T1.deptno = emp.deptno
order by ename

--Display ename, department name and grade of each employee who joined the organization before their boss.
select e.ename,e.hiredate,e2.hiredate,grade,dname
from emp e,emp e2,salgrade,dept d
where e.mgr = e2.empno and e.hiredate < e2.hiredate
and e.sal between losal and hisal
and d.deptno = e.deptno

--Display each deprtment name and the first employee who joined that department.

select dname, ename
from emp e, dept d
where e.deptno = d.deptno
and hiredate in (
	select min(hiredate)
	from emp
	group by deptno
	)

--Display employees who joined in the last month(1st day of last month – Last day of last month). Do not hardcode the month name.
select *
from emp
where day(hiredate) in (
	select day(hiredate)
	from emp
	where day(hiredate) in (30,31)
)

insert into emp values (8888,'abdul','MANAGER',7839,DATEFROMPARTS(1990,05,30),5000,0,10)
delete emp where empno = 8888

--Display the department names where every employee is earning more than 2000.

select dname
from dept
where deptno in (
	select deptno
	from emp
	where sal >2000)

--Display location, highest salary in that location and lowest salary in that location.
select loc , high_sal,low_sal
from dept d,
(select deptno,max(sal) as high_sal,min(sal) as low_sal
from emp
group by deptno)T
where d.deptno = T.deptno


--Display employees who are in that same grade as Miller and do not belong to the place which Miller belongs to.
select ename, s.grade
from emp e,dept d,salgrade s,(
	select grade,loc
	from emp e,salgrade,dept d
	where e.sal between losal and hisal
	and e.deptno = d.deptno
	and ename = 'miller'
	)T
where e.sal between losal and hisal
and s.grade = T.grade and  d.deptno = e.deptno
and d.loc != T.loc

--List analysts and clerks who are either staying at Chicago or Boston and in grade 3 and above.
select ename, job, loc,grade
from emp e, dept d, salgrade s
where e.sal between losal and hisal
and e.deptno = d.deptno
and loc in ('chicago','boston')



--How many employees are there between the highest grade of a clerk and the lowest grade of a manager?
select e.ename, count(e.ename),grade
from emp e, salgrade s
where sal between losal and hisal
and grade = (
		select max(grade)
		from emp e, salgrade s
		where sal between losal and hisal
		and job = 'CLERK'
		)
group by grade,e.ename




select round(sal,-3)
from emp

--Write a query to display name, dept. no, and salary of any employee whose  is not located at DALLAS  but his/her salary and commission match with the   salary and commission of at least one  employee located in DALLAS.


select ename, deptno,sal
from emp
where deptno != (
	SELECT	deptno
	from dept
	where loc ='DALLAS'
	)
	and
	sal + ISNULL(comm,0) in 
	(
	SELECT	sal + ISNULL(comm,0)
	from dept
	where loc ='DALLAS'
	)


--How much more salary does each person need to earn to go in the next grade?

select ename, sal , sal - losal as NextGradeSal
from emp e,salgrade s
where sal between losal and hisal

--List different locations from where employees are reporting to King.
select loc
from dept
where deptno in
(
select deptno
from emp
where mgr = (
select empno
from emp
where ename = 'KING'
))

--Display grade 2 employees in sales department who will complete 36 years in Dec this year.

select ename, grade , hiredate
from salgrade ,emp
where sal between losal and hisal
and grade >2
and year(hiredate)+36 =2023 and month(hiredate) = 12

select year(hiredate)+36, month(hiredate)
from emp

--Display employees who are earning salary more than the average salary of employees in the same grade.

select ename, sal, T.avgsalbygrade
from 
(select  grade , round(avg(sal),2) as avgsalbygrade
from salgrade ,emp
where sal between losal and hisal
group by grade)T, emp e, salgrade s
where sal between losal and hisal
and T.grade = s.grade
and e.sal > T.avgsalbygrade

--How many employees are there between the highest grade of a clerk and the lowest grade of a manager?


select count(ename)
from
(select job, max(grade) as h_g_clerk
from salgrade s,emp e
where sal between losal and hisal
and job = 'clerk'
group by job)C_T,
(select job, min(grade) as min_man
from salgrade s,emp e
where sal between losal and hisal
and job = 'manager'
group by job)M_T,emp e1,salgrade s1
where e1.sal between losal and hisal
and grade between C_T.h_g_clerk and M_T.min_man




select * from salgrade

--Display department name, grade, Max salary offered to each grade at each department.


select dname,grade,T.hisal
from (select d.deptno,grade, hisal
from salgrade s,emp e,dept d
where e.sal between s.losal and s.hisal
and e.deptno = d.deptno
group by d.deptno,grade,hisal)T,
dept
where dept.deptno = T.deptno

--Who’s earning the best salary in each grade and where do they live?

select ename,sal,salgrade.grade
from (select grade, max(sal) as bestsal
from emp , salgrade
where sal between losal and hisal
group by grade)T,emp,salgrade
where sal = T.bestsal
and salgrade.grade = T.grade

--Display the locations where total salary of grade 3 employees is greater than total salary of grade 4 employee

select loc,grade,sal +isnull(comm,0) as totalsal
from emp e, dept d,salgrade
where e.deptno = d.deptno
and sal between losal and hisal
and grade in (3,4)







(select sum(sal) as G3_sal
from emp e,salgrade s
where sal between losal and hisal
and grade = 3)

(select sum(sal) as G4_sal
from emp e,salgrade s
where sal between losal and hisal
and grade = 4)















begin
	--declare all variables
	declare @dept_no1 int = 30;
	declare @avg_sal float;
	
	--extracting data from db and storing in local var
	select @avg_sal = round(avg(sal),2)
	from emp 
	where deptno = @dept_no1
	if(@avg_sal > 2000)
	begin
		print 'Avg sal is greater than 2000';
	end
	else
	begin
		print 'Avg sal is lesser than 2000';
	end
end;



select avg(sal)
from emp
where deptno = 30




begin
	declare @str varchar(20) = 'MADAM';
	declare @length int = len(@str);
	declare @rev varchar(20) = '';
	while @length !=0 
	begin
		 set @rev = @rev + SUBSTRING(@str,@length,1)
		 set @length = @length-1
	end	   
	if(@str = @rev)
		print 'Pallindrome'
	else
		print 'Not pallindrome'
end






begin
	declare @str1 varchar(20) = 'MADAM';
	declare @length1 int = len(@str);
	declare @rev1 varchar(20) = '';
	while @length !=0 
	begin
	if SUBSTRING(@str,@length,1) = Upper(SUBSTRING(@str,@length,1))
		 set @rev = @rev + SUBSTRING(@str,@length,1)
		 set @length = @length-1
	end	   
	if(@str = @rev)
		print 'Pallindrome'
	else
		print 'Not pallindrome'
end

begin
	declare @mixed_str varchar(40) = 'ShaHRukH'
	declare @lenS int = len(@mixed_str);
	declare @char varchar(1)=''
	declare @mixed_res varchar(40) = ''
	declare @index int = 0
	while @index <= @lenS
	begin 
		set @char = SUBSTRING(@mixed_str,@index,1)
		set @index = @index +1
		if(ASCII(@char) >=65 and ASCII(@char) <=90 )
			set @mixed_res = @mixed_res + lower(@char)
		else
			set @mixed_res = @mixed_res + upper(@char)
	end
	print @mixed_res
end
select char(ASCII('a')-32)









BEGIN
	DECLARE @V_EMPNAME VARCHAR(30), @V_EMPJOB VARCHAR(15);
	DECLARE EMP_CURSOR CURSOR 
	FOR SELECT ENAME
	FROM EMP WHERE JOB='SALESMAN' AND MONTH(HIREDATE)=2
	OPEN EMP_CURSOR;
	fetch NEXT
	from EMP_CURSOR
	into @V_EMPNAME;
	PRINT ' '
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT '  ' + @V_EMPNAME
		fetch NEXT from EMP_CURSOR into @V_EMPNAME;
	END
	CLOSE EMP_CURSOR;
	DEALLOCATE EMP_CURSOR;
END;



BEGIN
DECLARE @V_EMPNO INT, @V_EMPNAME VARCHAR(15);
 
DECLARE EMP_CURSOR CURSOR 
FOR SELECT EMPNO,ENAME
FROM EMP
ORDER BY ENAME;
 
OPEN EMP_CURSOR;
 
fetch NEXT
from EMP_CURSOR
into @V_EMPNO,@V_EMPNAME;
 
PRINT 'EMPLOYEEiD     EMPNAME '
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT '  ' + CAST(@V_EMPNO AS VARCHAR(10)) + '    '  +  @V_EMPNAME
    fetch NEXT from EMP_CURSOR into @V_EMPNO,@V_EMPNAME;
END
CLOSE EMP_CURSOR;
DEALLOCATE EMP_CURSOR;
END;







BEGIN
	DECLARE @ename VARCHAR(30), @job VARCHAR(15),@sal int,@bonus INT;
	DECLARE EMP_CURSOR CURSOR 
	FOR
	SELECT ename, sal,job
	FROM EMP
	OPEN EMP_CURSOR;
	fetch NEXT
	from EMP_CURSOR
	into @ename,@sal,@job;
	print 'Position		Emp Name	Salary		Diwali Bonus		Total Salary'
	WHILE @@FETCH_STATUS = 0
	BEGIN
		if @job = 'SALESMAN'
		begin
			PRINT 'Salesman		' + @ename + '		'+cast(@sal as varchar) + '		' +cast(@sal*0.1 as varchar(10))+' 10% bonus		'+cast(@sal*1.1 as varchar(10));
		end
		if @job = 'MANAGER'
		begin
			PRINT 'Manager			' + @ename + '		'+cast(@sal as varchar) + '		' +cast(@sal*0.2 as varchar(10))+' 20% bonus		'+ cast(@sal*1.2 as varchar(10));
		end
		if @job = 'ANALYST'
		begin
			PRINT 'ANALYST			' + @ename + '		'+cast(@sal as varchar) + '		' +cast(@sal*0.25 as varchar(10))+' 25% bonus	'+ cast(@sal*1.25 as varchar(10));
		end
		fetch NEXT from EMP_CURSOR into @ename,@sal,@job;
	END
	CLOSE EMP_CURSOR;
	DEALLOCATE EMP_CURSOR;
END



--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------


create or alter function AvgSalOfGivenDept(@dept_no int)
returns float
begin
	declare @avragesal float ;
	select @avragesal = round(AVG(sal),2)
	from emp
	where deptno = @dept_no
	return @avragesal
end


use practiceDB
select dbo.AvgSalOfGivenDept(30)

	
create or alter function CheckEmpNo(@emp_no int)
returns int
begin
	declare @emp_stats int = 0;
	select @emp_stats = count(empno)
	from emp
	where empno = @emp_no
	return @emp_stats
end
select dbo.CheckEmpNo(7369)
select * from emp

create or alter function CheckEmpSal(@emp_sal int)
returns int
begin
	declare @emp_stats int = 0;
	select @emp_stats = count(empno)
	from emp
	where @emp_sal >2000
	return @emp_stats
end

select dbo.CheckEmpSal(2001)

create or alter function CheckEmpJob(@emp_job varchar(20))
returns varchar(20)
begin
	declare @emp_stats int = 0;
	select @emp_stats = count(*)
	from emp
	where @emp_job in ('MANAGER','ANALYST','SALESMAN')
	return @emp_stats
end

select dbo.CheckEmpJob('clerk')






select * from emp




create procedure AddEmp(@emp_no int,@emp_name varchar(20),@emp_sal int,@emp_job varchar(20))
as 
begin
	declare @flag int = 0;
	if(dbo.CheckEmpNo(@emp_no) != 0)
	begin
		print 'Employee with ID ' + cast(@emp_no as varchar(20)) + ' Exists'
		set @flag = @flag +1
	end
	if(dbo.CheckEmpSal(@emp_sal) = 0)
	begin
		print 'Employee Salary is less than 2000 '
		set @flag = @flag +1
	end
	if(dbo.CheckEmpJob(@emp_job) = 0)
	begin
		print 'Employee with '+@emp_job+' is Not Allowed'
		set @flag = @flag +1
	end
	if(@flag = 0)
		insert into emp(empno,ename,job,sal) values (@emp_no,@emp_name,@emp_job,@emp_sal)	
end

exec dbo.AddEmp @emp_no=9999,@emp_name='Deepika',@emp_job='MANAGER',@emp_sal=8000

update emp
set deptno = 10
where empno =9999

use practiceDB

alter procedure FireEmp(@emp_no int)
as
begin
	if(dbo.CheckEmpNo(@emp_no) != 0)
	begin
		print 'Employee with ID ' + cast(@emp_no as varchar(20)) + ' Exists'
		delete from emp where empno=@emp_no
		print 'No. of rows deleted '+ cast(@@rowcount as varchar(20))
	end
	else
		print 'Employee with ID ' + cast(@emp_no as varchar(20)) + ' Do not Exists'
end

exec dbo.FireEmp @emp_no = 1111


--WAT which will prompt error message if anyopne tries to insert a recrds after working woring hrs other than 8 to 6
create table empLog
(
logID int identity(1,1) not null,
empid int not null,
operation varchar(10) not null,
updatedDate Datetime not null
)
 
select * from EmpLog
 
create trigger trgEmployeeInsert
on emp
for insert
as
insert into emplog(empid,operation,updatedDate) 
select empno,'Insert',getdate() from inserted

exec dbo.AddEmp @emp_no=1234,@emp_name='Deepika',@emp_job='MANAGER',@emp_sal=8000


alter trigger trgErrAfter
on emp
for insert
as
begin
	if( DATEPART(HH,GETDATE()) >8 and  DATEPART(HH,GETDATE()) < 18 or DATEPART(DW,GETDATE()) = 1 or DATEPART(DW,GETDATE()) = 7 )
		print 'Not allowed to insert'
	else
	begin
		insert into emplog(empid,operation,updatedDate) 
		select empno,'Insert',getdate() from inserted
	end
end


select * from emp
delete from emp where ename = 'Deepika'
select * from EmpLog
exec dbo.AddEmp @emp_no=1239,@emp_name='Deepika',@emp_job='MANAGER',@emp_sal=8000