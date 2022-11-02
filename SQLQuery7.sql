select distinct top 3 sal as "top Salaried people"
from emp
order by sal desc


select substring(ename,LEN(ename)-2,3) as "last 3 didgit", substring(ename,1,3)as "first 3 didgit"
from emp


select right(ename,3)
from emp

select REPLACE(ename, 'A','a') 
from emp

