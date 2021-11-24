use mySQL_sej_2;
drop table naver_member;
drop table naver_board;
drop table naver_category;
drop table naver_comment;
create table naver_member(
	n_id varchar(20),
    n_password varchar(16) not null,
    n_name varchar(10) not null,
    n_birth date not null,
    n_gender varchar(10) not null,
    n_email varchar(30),
    n_phone varchar(20) not null,
    constraint primary key(n_id)
);
-- 신규회원 2명 가입
insert into naver_member(n_id,n_password,n_name,n_birth,n_gender,n_email,n_phone)
	values('id1','1111','이름1',str_to_date('2000-01-01','%Y-%m-%d'),'F','aaa@aaa.com','010-1111-1111');
insert into naver_member(n_id,n_password,n_name,n_birth,n_gender,n_email,n_phone)
	values('id2','2222','이름2',str_to_date('2000-02-02','%Y-%m-%d'),'M','bbb@bbb.com','010-2222-2222');

-- 회원 로그인
select * from naver_member where n_id='id1' and n_password='1111';
select * from naver_member where n_id='id2' and n_password='2222';
    
-- id1 회원의 상세정보 조회
select * from naver_member where n_id='id1';

-- 전체 회원 목록 조회
select * from naver_member;
    
-- id2 회원 비밀번호 변경
update naver_member set n_password='2424' where n_id='id2';

-- id2 회원 탈퇴
delete from naver_member where n_id='id2';

-- 신규회원 추가
insert into naver_member(n_id,n_password,n_name,n_birth,n_gender,n_email,n_phone)
	values('id3','3333','이름3',str_to_date('2000-03-03','%Y-%m-%d'),'M','ccc@ccc.com','010-3333-3333');
delete from naver_member where n_id='id3';

select * from naver_member;
create table naver_board(
	b_number int auto_increment,
    b_title varchar(30) not null,
    b_writer varchar(20) not null,
    b_contents varchar(200),
    b_date datetime not null,
    b_like int default 0,
    b_hits int default 0,
    b_category int not null,
    constraint primary key(b_number),
    constraint foreign key(b_writer) references naver_member(n_id) on delete cascade,
    constraint foreign key(b_category) references naver_category(c_number) on delete cascade
);

-- id1 회원 게시글 작성
insert into naver_board(b_title,b_writer,b_contents,b_date,b_category)
	values('id1게시글제목','id1','1d1게시글내용',now(),1);
-- id2 회원 게시글 작성
insert into naver_board(b_title,b_writer,b_contents,b_date,b_category)
	values('id2게시글제목','id2','id2게시글내용',now(),2);
insert into naver_board(b_title,b_writer,b_contents,b_date,b_category)
	values('id2게시글제목','id2','id2게시글내용',now(),1);
-- id3 회원 게시글 작성    
insert into naver_board(b_title,b_writer,b_contents,b_date,b_category)
	values('id3게시글제목','id3','id2게시글내용',now(),2);
insert into naver_board(b_title,b_writer,b_contents,b_date,b_category)
	values('id3게시글제목2','id3','id2게시글내용',now(),2);

select * from naver_board;

-- 조회수 순으로 전체 게시글 목록 출력
select * from naver_board order by b_hits asc;
select * from naver_board order by b_hits desc;
-- 작성일자 순으로 전체 게시글 목록 출력
select * from naver_board order by b_date asc;
select * from naver_board order by b_date desc;
select b_number,b_title,b_writer,b_date,b_hits,b_like from naver_board order by b_date desc;
-- 자유게시판 글만 출력
select * from naver_board where b_category=1 order by b_date desc;
-- 상세조회시 조회수 증가
-- update, select
update naver_board set b_hits=b_hits+1 where b_number=2;
select * from naver_board;
select * from naver_board where b_number=2;

-- id1 회원이 본인 작성 게시글 내용 수정
-- update naver_board set b_contents='id1게시글내용수정' where b_writer='id1';
update naver_board set b_contents='id1게시글내용수정' where b_number=1;

-- 두번째로 작성된 게시글 삭제
delete from naver_board where b_number=4;

create table naver_category(
	c_number int auto_increment,
	c_name varchar(30),
    constraint primary key(c_number)
);
-- 카테고리 생성
insert into naver_category(c_name)
	values('자유게시판');
insert into naver_category(c_name)
	values('공지사항');

select * from naver_category;
create table naver_comment(
	c_number int auto_increment,
	c_writer varchar(20) not null,
    c_date datetime not null,
    c_contents varchar(200) not null,
    b_number int not null,
    constraint primary key(c_number),
    constraint foreign key(c_writer) references naver_member(n_id) on delete cascade,
    constraint foreign key(b_number) references naver_board(b_number) on delete cascade
);

-- id1 회원이 1번 게시글에 댓글 작성
insert into naver_comment(c_writer,c_date,c_contents,b_number)
	values('id1',now(),'id1회원의1번게시글댓글',1);
    
-- id2 회원이 1번, 2번 게시글에 댓글 각각 작성
insert into naver_comment(c_writer,c_date,c_contents,b_number)
	values('id2',now(),'id2회원의1번게시글댓글',1);
insert into naver_comment(c_writer,c_date,c_contents,b_number)
	values('id2',now(),'id2회원의2번게시글댓글',2);
    
insert into naver_comment(c_writer,c_date,c_contents,b_number)
	values('id3',now(),'게시글댓글3',2);
    
select * from naver_comment;

-- 1번 게시글에 대한 댓글 목록 출력
select * from naver_comment where b_number=1;
select * from naver_comment where b_number=2;

-- 컬럼 추가, 삭제 등
select * from naver_member;
-- 회원 주소를 저장할 컬럼 필요
-- n_address varchar(50)
alter table naver_member add n_address varchar(50);
-- 컬럼 이름 변경
alter table naver_member change n_address n_add varchar(50);
-- 컬럼 타입, 크기 변경
alter table naver_member modify n_add varchar(100);
alter table naver_member modify n_password varchar(30);
desc naver_member;
-- 컬럼 삭제
alter table naver_member drop n_add;

-- db 쿼리 카테고리 정리
/*
	1. DDL: create(테이블, 사용자), alter(테이블), drop(테이블)
    2. DML: insert, select, update, delete
    3. DCL: grant, revoke, commit, rollback
    commit: DB에 쿼리 수행결과를 완전히 반영하는 것
    rollback: commit 이후 수행한 내용을 되돌림
    ddl, dcl: commit 이 같이 수행됨
    dml
    commit-commit : transaction(트랜잭션)
*/

drop table test1;
create table test1(
	col1 varchar(10),
	col2 varchar(20)
);
insert into test1(col1,col2) values('aa','aa');
select * from test1;
commit;
rollback;
select @@autocommit; -- 1: autocommit
set autocommit = false;
set autocommit = true;

-- 20211105 연습문제
drop table orders;
drop table book;
drop table customer;
create table orders(
	o_id int auto_increment,
    c_id int,
    b_id int,
    o_saleprice int,
    o_orderdate date,
    constraint primary key(o_id),
    constraint foreign key(c_id) references customer(c_id) on delete cascade,
    constraint foreign key(b_id) references book(b_id) on delete cascade
);
create table book(
	b_id int auto_increment,
    b_bookname varchar(40),
    b_publisher varchar(40),
    b_price int,
    constraint primary key(b_id)
);
create table customer(
	c_id int auto_increment,
    c_name varchar(40),
    c_address varchar(50),
    c_phone varchar(20),
    constraint primary key(c_id)
);

-- book
insert into book(b_bookname,b_publisher,b_price)
	values('축구의 역사','굿스포츠',7000);
insert into book(b_bookname,b_publisher,b_price)
	values('축구스카우팅 리포트','나무수',13000);
insert into book(b_bookname,b_publisher,b_price)
	values('축구의 이해','대한미디어',22000);
insert into book(b_bookname,b_publisher,b_price)
	values('배구 바이블','대한미디어',35000);
insert into book(b_bookname,b_publisher,b_price)
	values('피겨 교본','굿스포츠',8000);
insert into book(b_bookname,b_publisher,b_price)
	values('피칭 단계별 기술','굿스포츠',6000);
insert into book(b_bookname,b_publisher,b_price)
	values('야구의 추억','이상미디어',20000);
insert into book(b_bookname,b_publisher,b_price)
	values('야구를 부탁해','이상미디어',13000);
insert into book(b_bookname,b_publisher,b_price)
	values('올림픽 이야기','삼성당',7500);
insert into book(b_bookname,b_publisher,b_price)
	values('olympic champions','pearson',13000);
    
-- customer
insert into customer(c_name,c_address,c_phone)
	values('손흥민','영국 런던','000-5000-0001');
insert into customer(c_name,c_address,c_phone)
	values('김연아','대한민국 서울','000-6000-0001');
insert into customer(c_name,c_address,c_phone)
	values('김연경','중국 상하이','000-7000-0001');
insert into customer(c_name,c_address,c_phone)
	values('류현진','캐나다 토론토','000-8000-0001');
insert into customer(c_name,c_address,c_phone)
	values('이강인','스페인 마요르카',null);

-- orders
insert into orders(c_id,b_id,o_saleprice,o_orderdate)
	values(1,1,6000,str_to_date('2021-07-01','%Y-%m-%d'));
insert into orders(c_id,b_id,o_saleprice,o_orderdate)
	values(1,3,21000,str_to_date('2021-07-03','%Y-%m-%d'));
insert into orders(c_id,b_id,o_saleprice,o_orderdate)
	values(2,5,8000,str_to_date('2021-07-03','%Y-%m-%d'));
insert into orders(c_id,b_id,o_saleprice,o_orderdate)
	values(3,6,6000,str_to_date('2021-07-04','%Y-%m-%d'));
insert into orders(c_id,b_id,o_saleprice,o_orderdate)
	values(4,7,20000,str_to_date('2021-07-05','%Y-%m-%d'));
insert into orders(c_id,b_id,o_saleprice,o_orderdate)
	values(1,2,12000,str_to_date('2021-07-07','%Y-%m-%d'));
insert into orders(c_id,b_id,o_saleprice,o_orderdate)
	values(4,8,13000,str_to_date('2021-07-07','%Y-%m-%d'));
insert into orders(c_id,b_id,o_saleprice,o_orderdate)
	values(3,10,12000,str_to_date('2021-07-08','%Y-%m-%d'));
insert into orders(c_id,b_id,o_saleprice,o_orderdate)
	values(2,10,7000,str_to_date('2021-07-09','%Y-%m-%d'));
insert into orders(c_id,b_id,o_saleprice,o_orderdate)
	values(3,8,13000,str_to_date('2021-07-10','%Y-%m-%d'));
    
select * from book;
select * from customer;
select * from orders;

-- 1. 모든 도서의 가격과 도서명 조회 
select b_bookname as '도서명', b_price as '가격' from book;
-- 2. 모든 출판사 이름 조회 
select b_publisher as '출판사' from book;
-- 2.1 중복값을 제외한 출판사 이름 조회 
select distinct b_publisher from book;
-- 3. BOOK테이블의 모든 내용 조회 
select * from book;
-- 4. 20000원 미만의 도서만 조회 
select * from book where b_price < 20000;
-- 5. 10000원 이상 20000원 이하인 도서만 조회
select * from book where 10000 <= b_price and b_price <= 20000;
-- 6. 출판사가 굿스포츠 또는 대한미디어인 도서 조회 
select * from book where b_publisher='굿스포츠' or b_publisher='대한미디어';
-- 7. 도서명에 축구가 포함된 모든 도서를 조회
select * from book where b_bookname like '%축구%';
-- 8. 도서명의 두번째 글자가 구인 도서 조회
select * from book where b_bookname like '_구%';
-- 9. 축구 관련 도서 중 가격이 20000원 이상인 도서 조회
select * from book where b_bookname like '%축구%' and b_price >= 20000;
-- 10. 책 이름순으로 전체 도서 조회
select * from book order by b_bookname asc;
select * from book order by b_bookname desc;
-- 11. 도서를 가격이 낮은 것 부터 조회하고 같은 가격일 경우 도서명을 가나다 순으로 조회
select * from book order by b_price asc, b_bookname asc;
