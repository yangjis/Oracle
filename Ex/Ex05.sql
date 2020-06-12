/*계정 생성: create user webdb identified by 1234;
접속권한부여: grant resource, connect to webdb;
계정 비밀번호 변경: alter user webdb identified by webdb;
계정삭제: drop user webdb cascade;



create table book(
	book_id		number(5),
	title		varchar2(50),
	author		varchar2(10),
	pub_date	date
);

table book이 생성되었습니다..............................................................................................................................

select * from tabs; --모든 테이블 보기


--book테이블에 컬럼 추가
alter table book add(
	pubs	varchar2(50)
);


--book테이블의 타이틀컬럼을 변경(저장용량을 50 -> 100).
alter table book modify(title varchar2(100));

--컬럼 이름을 변경(title -> subject)
alter table book rename column title to subject;


--컬럼 삭제
alter table book drop(author);





--테이블 명 수정(book -> article)
rename book to article;

--article테이블 삭제
drop table article;

--테이블 안에 데이터를 제거
truncate table article;

create table author();

*/




--drop table book;

--truncate table author;

create table book(
	book_id		number(5),
	title		varchar2(50),
	author		varchar2(10),
	pub_date	date
);

alter table book add(
	pubs	varchar2(50)
);

alter table book modify(title varchar2(100));

alter table book rename column title to subject;

select * from tabs;


--작가 테이블 생성
create table author(
    author_id   number(10),
    author_name varchar2(100)   not null,
    author_desc varchar2(500),
    PRIMARY key(author_id)
);

--북테이블 생성
create table book(
    book_id     number(10),
    title       varchar2(100) not null,
    pubs        varchar2(100),
    pub_date    date,
    author_id   number(10),
    primary key(book_id),
    CONSTRAINT c_book_fk foreign key(author_id) --내 테이블에서 author_id컬럼을 외래키로 정한다.
    references author(author_id)    --author테이블에 author_id컬럼을.
);

--데이터 삽입
insert into author values(1, '박경리', '토지');
insert into author(author_id, author_name) values(2, '이문열');
insert into author values(3, '기안84', '');


--데이터 수정
update author set author_name = '기안85',
                  author_desc = '웹툰작가'
where author_id = 1;


--데이터 삭제
--delete from author;
--where author_id = 1;


--시퀀스
create sequence seq_author_id increment by 1 start with 1;

--시퀀스 사용.
insert into author values(seq_author_id.nextval, '박경리', '토지');

--시퀀스 조회
select * from user_sequences;

--현재 시퀀스 조회
select seq_author_id.currval from dual;

--다음 시퀀스 조회
select seq_author_id.nextval from dual;

--시퀀스 삭제
--drop sequence seq_author_id;

--sysdate: 현재시간이 입력됨.
insert into book values(1, '복학왕', '웹툰', sysdate, 1);

select * from tabs;
select * from author;
select * from book;







select * from book;
alter table book modify(pub_date varchar2(50));

create sequence seq_book_id increment by 1 start with 1;
insert into book values(seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
insert into book values(seq_book_id.nextval, '삼국지', '민음사', '2002-03-01', 1);
insert into book values(seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', 2);
insert into book values(seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);
insert into book values(seq_book_id.nextval, '패션왕', '중앙북스', '2012-02-22', 4);
insert into book values(seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', 5);
insert into book values(seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04', 6);
insert into book values(seq_book_id.nextval, '26년', '재미주의', '2012-02-04', 5);




select * from author;
update book set book_id = 8
where book_id = 11;

insert into author values(seq_author_id.nextval, '김영하', '알쓸신잡');





update author set author_desc = '서울특별시' where author_id=5;
delete from book
where book_id = 5;

delete from author
where author_id = 4;

alter table book rename column subject to title;

select b.book_id,
        b.title,
        b.pubs,
        b.pub_date,
        a.author_id,
        a.author_name,
        a.author_desc
from book b, author a
where b.author_id = a.author_id(+)
order by b.book_id asc;