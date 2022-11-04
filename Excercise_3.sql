--1.	Convert a given number of days to measure of the given in years , weeks & days. For example 375 days : 1 year 1 week & 3 days. ( Ignore leap year).

begin 
	declare @given_days int = 1095;
	declare @days int=0;
	declare @week int=0;
	declare @year int=0;
	if(@given_days<=365 )
	begin 
		set @week = @given_days/7;
		set @days = @given_days-(@week*7)
	end
	else if(@given_days>365)
	begin 
		set @year= @given_days/365;
		set @week = (@given_days-(@year*365))/7;
		set @days = @given_days-(@year*365)-(@week*7)
	end
	print 'No, of Years = ' + cast(@year as varchar(5)) +' No, of weeks = ' + cast(@week as varchar(5)) +' No, of days = ' + cast(@days as varchar(5))
end



--2.	Declare and initialize a number from the user and display its factorial 


--begin 
--	declare @user_num int = 5;
--	declare @fact int = 0;

--	print 'No, of Years = ' + cast(@year as varchar(5)) +' No, of weeks = ' + cast(@week as varchar(5)) +' No, of days = ' + cast(@days as varchar(5))
--end

-----------factorial---------------------
begin
    declare @v_n int = 4;
    declare @v_fact int=1;
    declare @i int = 1;
    while(@i<=@v_n)
    begin
    Set @v_fact = @v_fact * @i
    Set @i += 1
    end
    print 'Factorial of '+cast(@v_n as varchar(15))+' is '+cast(@v_fact as varchar(15));
end



-----Area of square-----
begin
    declare @v_side int = 16;
    declare @v_area int;
    Set @v_area=@v_side*@v_side
    print 'Area of side '+cast(@v_side as varchar(15))+' square is '+cast(@v_area as varchar(15));
end




-------Fibonacci series--------



BEGIN
    declare @v_n1 int = 0,@v_n2 int =1,@v int=0,@max int=7;
    declare @temp int;
    print @v_n1;
    print @v_n2;
    while(@v<@max-2)
    begin
        set @temp = @v_n2
        set @v_n2 = @v_n2 + @v_n1
        set @v_n1 = @temp
        print @v_n2
        Set @v += 1
    end    
end




--------Prime Number-----------------



begin
    declare @r bit = 1,@v_p int =2;
    declare @num int=9;
    while (@v_p<@num)
    begin
        if(@num % @v_p = 0)
        begin
            set @r= 0
            break
        end
        set @v_p += 1
    end
    if(@r=0)
    print 'Not a prime number'
    else
    print 'Prime number'
end



-----Age-----



begin
    declare @v_age int=21;
    if(@v_age<18)
    print'Minor'
    else if(@v_age>=21)
    print'Adult'
    else
    print'Major'
end



use PracticeBatch



-----------sal of clerks--------
begin
  select e.sal,e.job
  into #v_saltab1
  from emp e
  where e.job='clerk'  
  select * from #v_saltab1
end;



--------------------managers------------



begin
  select distinct(m.ename)
  into #v_manager
  from emp w,emp m
  where w.mgr=m.empno and month(m.hiredate)=2  
  select * from #v_manager
end;




-------------------years,weeks and days------------------------
begin
    declare @days int =1000;
    declare @no_of_years int,@no_of_weeks int,@no_of_days int;
    set @no_of_years=@days/365
    set @no_of_weeks=(@days%365)/7
    set @no_of_days=(@days%365)%7
    print'No. of years='+ cast(@no_of_years as varchar(15))
    print'No. of weeks='+ cast(@no_of_weeks as varchar(15))
    print'No. of days='+ cast(@no_of_days as varchar(15))
end