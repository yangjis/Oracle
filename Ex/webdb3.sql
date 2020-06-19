drop table book;
drop table author;
drop SEQUENCE seq_book_id;
drop SEQUENCE seq_author_id;

create table author(
    author_id   number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(200),
    PRIMARY key (author_id)
);

create table book(
    book_id     number(10),
    title       varchar2(100) not null,
    pubs        varchar2(50),
    pub_date    date,
    author_id   number(10),
    CONSTRAINT c_book_fk foreign key(author_id)
    REFERENCES author(author_id)
);

CREATE SEQUENCE seq_book_id increment by 1 start with 1;
CREATE SEQUENCE seq_author_id increment by 1 start with 1;

insert into author values(seq_author_id.nextval, '이문열', '경북 영양');
insert into author values(seq_author_id.nextval, '박경리', '경상남도 통영');
insert into author values(seq_author_id.nextval, '유시민', '17대 국회의원');
insert into author values(seq_author_id.nextval, '기안84', '기안동에서 산 84년생');
insert into author values(seq_author_id.nextval, '강풀', '온라인만화가 1세대');
insert into author values(seq_author_id.nextval, '김영하', '알쓸신잡');

insert into book values(seq_book_id.nextval, '우리들의 일그러진 영웅','다림','1998-02-22',1);
insert into book values(seq_book_id.nextval, '삼국지','민음사','2002-03-01',1);
insert into book values(seq_book_id.nextval, '토지','마로니에북스','2012-08-15',2);
insert into book values(seq_book_id.nextval, '유시민의 글쓰기 특강','생각의길','2015-04-01',3);
insert into book values(seq_book_id.nextval, '패션왕','중앙북스(book)','2012-02-22',4);
insert into book values(seq_book_id.nextval, '순정만화','재미주의','2011-08-03',5);
insert into book values(seq_book_id.nextval, '오직두사람','문학동네','2017-05-04',6);
insert into book values(seq_book_id.nextval, '26년','재미주의','2012-02-04',5);

select b.book_id, b.title, b.pubs, b.pub_date, b.author_id, a.author_name, a.author_desc
from book b, author a
where b.author_id(+) = a.author_id;

select * from author;
select * from book;
desc author;
commit;



select  bo.book_id,       
        bo.title,  
        bo.pubs,
        to_char(bo.pub_date, 'YYYY-MM-DD')pub_date,
        au.author_id, 
        au.author_name, 
        au.author_desc 
from book bo, author au 
where bo.author_id(+) = au.author_id;

create table guestBook(
    name        varchar2(80),
    password    varchar2(20),
    content     varchar2(2000),
    reg_date    date
);

insert into guestBook values('이정재', '1234', '첫번째 방명록 내용 안녕하소', sysdate);
insert into guestBook values('이정재', '1234', '첫번째 방명록 내용 안녕하소', sysdate);



