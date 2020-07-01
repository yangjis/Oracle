drop SEQUENCE seq_guest_no;
create SEQUENCE seq_guest_no increment by 1 start with 1;

create table guestBook(
    no          number,
    name        varchar2(80),
    password    varchar2(20),
    content     varchar2(2000),
    reg_date    date,
    PRIMARY key (no)
);



insert into guestBook values(seq_guest_no.nextval,'이정재', 1234, '첫번째 방명록 내용 안녕하소', sysdate);

select * from guestbook;

desc guestBook;

alter table guestBook add(no number(80));
select name, password, content, reg_date from guestBook;
select no, name, password, content, reg_date from guestBook;
--drop table guestBook;


drop table users;
drop SEQUENCE seq_users_no;



create SEQUENCE seq_users_no increment by 1 start with 1 nocache;

insert into users VALUES(seq_users_no.nextval, 'ekseks','1234', '양지선', 'female');

desc guestBook;
select * from guestBook;



select * from users;
select no, id, password, name, gender from users where id = 'ekseks' and password = '1234';
update guestbook set password = 1234 where no=23;

delete guestbook where no=18;
desc guestbook;
select * from guestbook;
-------------------------------------------------------------------------------------------------------


create table users(
    no          number,
    id          varchar2(20) not null unique,
    password    varchar2(20) not null,
    name        varchar2(20),
    gender      varchar2(10),
    primary key (no)
);


create table board(
    no          number,
    title       varchar2(500) not null,
    content     varchar2(4000),
    hit         number,
    reg_date    date not null,
    user_no     number not null,
    primary key(no),
    CONSTRAINT c_nserNo_fk foreign key(user_no)
    REFERENCES users(no)
  
);
SELECT rn, no, title, name, hit, reg_date, user_no FROM (SELECT rownum rn, no, title, name, hit, reg_date, user_no FROM (SELECT b.no no, b.title title, u.name name, b.hit hit, to_char(b.reg_date,'yyyy-mm-dd hh24:mi') reg_date, b.user_no user_no FROM board b, users u where b.user_no = u.no order by no desc)) where rn >= 5 and rn <= 10;

 

drop table board;

create SEQUENCE seq_board_no increment by 1 start with 1 nocache;

insert into board values(seq_board_no.nextval, 'asdf', 'asdf', 0, sysdate, 2);


select * from board;
select * from users;

select b.no no, b.title title, b.content content,  b.hit+1 hit, b.reg_date reg_date, b.user_no user_no, u.name name from board b,(select name,  no from users)u where b.user_no = u.no(+)and b.no = 34;

select count(*) from board;
select count(*) from board;
select b.no no, b.title title, b.content content, b.hit+1 hit, b.reg_date reg_date, b.user_no user_no, u.name name from board b,(select name, no from users)u where b.user_no = u.no(+) and b.no = 35;









insert into board values(seq_board_no.nextval, '처음 게시글입니다.', '안녕하세요. 반갑습니다.', 0, sysdate, 1);
select b.no , 
        b.title, 
        b.content, 
        b.hit, 
        b.reg_date, 
        u.no, 
        u.name 
from board b,
    (select name, no from users)u 
where b.no = u.no(+);

select b.no boardNo, b.title title, b.content content, b.hit hit, b.reg_date reg_date, u.no userNo, u.name name from board b,(select name, no from users)u where b.no = u.no(+);
select b.no no, b.title title, b.content content, b.hit+1 hit, b.reg_date reg_date, b.user_no user_no, u.name from board b,(select name, no from users)u where b.no = u.no(+) and b.no = 1;
select * from users;
update board set user_no = 1 where no=1;


select b.no no, b.title title, b.content content, b.hit+1 hit , b.reg_date reg_date, b.user_no user_no, u.name from board b,(select name, no from users)u where b.no = u.no(+) and b.no = 1;
select * from users;
select * from board;

select b.no no, b.title title, b.content content, b.hit hit, to_char(b.reg_date,yy-mm-dd hh24:mi:ss) reg_date, b.user_no user_no, u.name name from board b,(select name, no from users)u where b.user_no = u.no(+);

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:mi') FROM DUAL;

select b.no no, b.title title, b.content content, b.hit hit, TO_CHAR(b.reg_date, 'YY/MM/DD HH24:mi') reg_date, b.user_no user_no, u.name name from board b,(select name, no from users)u where b.user_no = u.no(+);

select no, title, content, hit, reg_date, user_no from board where title like '%안%';

SELECT no, title, name, hit, reg_date, user_no FROM (SELECT rownum rn, no, title, name, hit, reg_date, user_no FROM (SELECT b.no no, b.title title, u.name name, b.hit hit, to_char(b.reg_date,'yyyy-mm-dd hh24:mi') reg_date, b.user_no user_no FROM board b, users u where b.user_no = u.no order by no desc)) where rn >= 1 and rn <= 5;

SELECT no, title, name, hit, reg_date, user_no FROM (SELECT rownum rn, no, title, name, hit, reg_date, user_no FROM (SELECT b.no no, b.title title, u.name name, b.hit hit, to_char(b.reg_date,'yyyy-mm-dd hh24:mi') reg_date, b.user_no user_no FROM board b, users u where b.user_no = u.no order by no desc)) where rn >= 1 and rn <= 5;




SELECT no, title, name, hit, reg_date, user_no 
FROM (SELECT rownum rn, no, title, name, hit, reg_date, user_no 
      FROM (SELECT b.no no, b.title title, u.name name, b.hit hit, to_char(b.reg_date,'yyyy-mm-dd hh24:mi') reg_date, b.user_no user_no 
            FROM board b, users u 
            where b.user_no = u.no order by no desc)) 
where rn >= 2 and rn <= 5;

select * from users;

select b.no, b.title, b.content, b.hit, b.reg_date, b.user_no, u.name 
from board b,(select no, name from users)u
where b.user_no(+) = u.no
and title like '%a%'
;
