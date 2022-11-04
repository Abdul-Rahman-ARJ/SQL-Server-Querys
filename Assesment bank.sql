create database PracticeCk
use PracticeCk

 CREATE TABLE customer
   (
       custid VARCHAR(6),
       fname VARCHAR(30),
       mname VARCHAR(30),
       ltname VARCHAR(30),
       city VARCHAR(15),
       mobileno VARCHAR(10),
       occupation VARCHAR(10),
       dob DATE,
      CONSTRAINT customer_custid_pk PRIMARY KEY(custid)   
   ); 

CREATE TABLE branch
   (
    bid VARCHAR(6),
    bname VARCHAR(30),
    bcity VARCHAR(30),
    CONSTRAINT branch_bid_pk PRIMARY KEY(bid) 
   );



CREATE TABLE account
   (
      acnumber VARCHAR(6),
      custid  VARCHAR(6),
      bid VARCHAR(6),
      opening_balance INT,
      aod DATE,
      atype VARCHAR(10),
      astatus VARCHAR(10),
      CONSTRAINT account_acnumber_pk PRIMARY KEY(acnumber),
      CONSTRAINT account_custid_fk FOREIGN KEY(custid) REFERENCES customer(custid),
      CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES branch(bid) 
    );



CREATE TABLE trandetails
    (   
     tnumber VARCHAR(6),
     acnumber VARCHAR(6),
     dot DATE,
     medium_of_transaction VARCHAR(20),
     transaction_type VARCHAR(20),
     transaction_amount INT,    
     CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(tnumber),
     CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(acnumber) REFERENCES account(acnumber)  
    );



CREATE TABLE loan
   (
   
    custid VARCHAR(6),
    bid VARCHAR(6),
    loan_amount INT,
    CONSTRAINT loan_customer_custid_bid_pk PRIMARY KEY(custid,bid),
    CONSTRAINT loan_custid_fk FOREIGN KEY(custid) REFERENCES  customer(custid),
    CONSTRAINT loan_bid_fk FOREIGN KEY(bid) REFERENCES  branch(bid)
   );



INSERT INTO customer VALUES('C00001','Ramesh','Chandra','Sharma','Delhi','9543198345','Service','1976-12-06');
INSERT INTO customer VALUES('C00002','Avinash','Sunder','Minha','Delhi','9876532109','Service','1974-10-16');
INSERT INTO customer VALUES('C00003','Rahul',null,'Rastogi','Delhi','9765178901','Student','1981-09-26');
INSERT INTO customer VALUES('C00004','Parul',null,'Gandhi','Delhi','9876532109','Housewife','1976-11-03');
INSERT INTO customer VALUES('C00005','Naveen','Chandra','Aedekar','Mumbai','8976523190','Service','1976-09-19');
INSERT INTO customer VALUES('C00006','Chitresh',null,'Barwe','Mumbai','7651298321','Student','1992-11-06');
INSERT INTO customer VALUES('C00007','Amit','Kumar','Borkar','Mumbai','9875189761','Student','1981-09-06');
INSERT INTO customer VALUES('C00008','Nisha',null,'Damle','Mumbai','7954198761','Service','1975-12-03');
INSERT INTO customer VALUES('C00009','Abhishek',null,'Dutta','Kolkata','9856198761','Service','1973-05-22');
INSERT INTO customer  VALUES('C00010','Shankar',null,'Nair','Chennai','8765489076','Service','1976-07-12');


INSERT INTO branch VALUES('B00001','Asaf ali road','Delhi');
INSERT INTO branch VALUES('B00002','New delhi main branch','Delhi');
INSERT INTO branch VALUES('B00003','Delhi cantt','Delhi');
INSERT INTO branch VALUES('B00004','Jasola','Delhi');
INSERT INTO branch VALUES('B00005','Mahim','Mumbai');
INSERT INTO branch VALUES('B00006','Vile parle','Mumbai');
INSERT INTO branch VALUES('B00007','Mandvi','Mumbai');
INSERT INTO branch VALUES('B00008','Jadavpur','Kolkata');
INSERT INTO branch VALUES('B00009','Kodambakkam','Chennai');




INSERT INTO account VALUES('A00001','C00001','B00001',1000,'2012-12-15','Saving','Active');
INSERT INTO account VALUES('A00002','C00002','B00001',1000,'2012-06-12','Saving','Active');
INSERT INTO account VALUES('A00003','C00003','B00002',1000,'2012-05-17','Saving','Active');
INSERT INTO account VALUES('A00004','C00002','B00005',1000,'2013-01-27','Saving','Active');
INSERT INTO account VALUES('A00005','C00006','B00006',1000,'2012-12-17','Saving','Active');
INSERT INTO account VALUES('A00006','C00007','B00007',1000,'2010-08-12','Saving','Suspended');
INSERT INTO account VALUES('A00007','C00007','B00001',1000,'2012-10-02','Saving','Active');
INSERT INTO account VALUES('A00008','C00001','B00003',1000,'2009-11-09','Saving','Terminated');
INSERT INTO account VALUES('A00009','C00003','B00007',1000,'2008-11-30','Saving','Terminated');
INSERT INTO account VALUES('A00010','C00004','B00002',1000,'2013-03-01','Saving','Active');



INSERT INTO trandetails VALUES('T00001','A00001','2013-01-01','Cheque','Deposit',2000);
INSERT INTO trandetails VALUES('T00002','A00001','2013-02-01','Cash','Withdrawal',1000);
INSERT INTO trandetails VALUES('T00003','A00002','2013-01-01','Cash','Deposit',2000);
INSERT INTO trandetails VALUES('T00004','A00002','2013-02-01','Cash','Deposit',3000);
INSERT INTO trandetails VALUES('T00005','A00007','2013-01-11','Cash','Deposit',7000);
INSERT INTO trandetails VALUES('T00006','A00007','2013-01-13','Cash','Deposit',9000);
INSERT INTO trandetails VALUES('T00007','A00001','2013-03-13','Cash','Deposit',4000);
INSERT INTO trandetails VALUES('T00008','A00001','2013-03-14','Cheque','Deposit',3000);
INSERT INTO trandetails VALUES('T00009','A00001','2013-03-21','Cash','Withdrawal',9000);
INSERT INTO trandetails VALUES('T00010','A00001','2013-03-22','Cash','Withdrawal',2000);
INSERT INTO trandetails VALUES('T00011','A00002','2013-03-25','Cash','Withdrawal',7000);
INSERT INTO trandetails VALUES('T00012','A00007','2013-03-26','Cash','Withdrawal',2000);





INSERT INTO loan VALUES('C00001','B00001',100000);
INSERT INTO loan VALUES('C00002','B00002',200000);
INSERT INTO loan VALUES('C00009','B00008',400000);
INSERT INTO loan VALUES('C00010','B00009',500000);
INSERT INTO loan VALUES('C00001','B00003',600000);
INSERT INTO loan VALUES('C00002','B00001',600000);


select * from account
select * from branch
select * from customer
select * from loan
select * from trandetails

--1. Write a query to display CUSTOMER NAME as first name and middle name. The customer’s who don’t have middle name, for them display the last name. Give the alias name as Cust_Name.
select * from customer
select fname +' '+isnull(mname,ltname) as 'Cust_Name'
from customer


--------------------------------------------
select custid,concat(concat(fname,' '),coalesce(mname,ltname))as Cust_Name from customer;


--2. Write a query to display city name and count of branches in that city. Give the count of branches an alias name of Count_Branch.

select bcity,count(bname) as 'Count_Branch'
from branch
group by bcity

--------------------
select bcity,count(*) as Count_Branch from branch group by bcity;






--3. Write a query to display citywise, branchwise count of accounts. For the branch where we don’t have any records display 0.

select b.bname,bcity,count(acnumber) as Count_of_Account
from account a right join branch b
on a.bid = b.bid
group by b.bname,bcity

---------------------------------------------------------------
select b.bcity,count(a.acnumber) 
from branch b,account a 
where b.bid=a.bid 
group by bcity
union
select bcity,0 
from branch 
where bcity not in
			(select bcity 
			from branch b,account a 
			where a.bid=b.bid 
			group by bcity)
union
select b.bid,count(a.acnumber) 
from branch b,account a 
where a.bid=b.bid 
group by b.bid
union
select bid,0 
from branch 
where bid not in
		(select a.bid 
		from branch b,account a 
		where a.bid=b.bid 
		group by a.bid);





select * from account
select * from branch
select * from customer
select * from loan
select * from trandetails

select fname,l.custid,l.bid
from loan l, customer c, account a
where l.custid = c.custid
and a.custid = c.custid

select count(*) Count from loan where custid not in
(select distinct custid from account);

select fname,l.custid,bid
from loan l full outer join customer c
on l.custid = c.custid

select bid
from loan

select *
from customer c left join account a
on c.custid = a.custid
--Write a named blocked which will return the number of client who have asked for loans but they don’t have any account in the bank though they are registered customers. 


select count(custid) as 'No. clients not having account in bank' 
from loan 
where custid not in (
					select distinct custid 
					from account
					)


create or alter function No_Of_Client_Not_Have_account()
returns int
begin
	--declare the local variables
	declare @no_client int;
	--query to get No. of clients not having account in bank
	select @no_client = count(custid)
	from loan 
	where custid not in (
					select distinct custid 
					from account
					)
	return @no_client
end

select dbo.No_Of_Client_Not_Have_account() as 'No. of clients not having account in bank'


--Creating named blocked (function) which has return type as Number
create or alter function No_Of_Client_Not_Have_account()
returns int
--beginig of the block
begin
	--declare the local variables
	declare @no_client int;
	--query to get No. of clients not having account in bank and storing the result in local variable
	select @no_client = count(custid)
	from loan 
	where custid not in (
			select distinct custid 
			from account
			)
	-- returning
	return @no_client
--end of the block
end
--Calling named blocked i.e user defined function using select statement
select dbo.No_Of_Client_Not_Have_account() as 'No. of clients not having account in bank'