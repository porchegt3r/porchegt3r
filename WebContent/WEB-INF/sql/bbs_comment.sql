create table bbscmt(

cbbsno    NUMBER(7)     NOT NULL,
cmtno   NUMBER(7)     NOT NULL,  -- 번호
id 		varchar(20)	   not null,
content  varchar(200)  not null,
wdate	 date		   not null,
primary key (cmtno)

);

select * from bbscmt

drop table bbscmt


