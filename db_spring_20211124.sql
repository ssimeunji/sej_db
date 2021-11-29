use spring_study;
select user();
drop table trainee;
create table trainee(
	t_number int auto_increment,
	t_name varchar(10),
    t_age int,
    t_phone varchar(20),
    t_gender varchar(10),
    t_birth date,
    t_address varchar(50),
    constraint primary key(t_number)
);

select * from trainee;
-- 두번째 훈련생에 대한 정보만 조회할 때 쿼리는?
select * from trainee where t_number=2;
-- 삭제 쿼리
delete from trainee where t_number=?;
-- 전화번호, 주소를 수정하는 쿼리
update trainee set t_phone='010-1111-2222', t_address='제주도' where t_number=1;

drop table member_table;
create table member_table(
	m_number bigint auto_increment,
    m_id varchar(20),
    m_password varchar(20),
    m_name varchar(10),
    m_email varchar(30),
    m_phone varchar(20),
    constraint primary key(m_number)
);

select * from member_table;

select * from member_table where m_id='aaa' and m_password='1234';

insert into member_table(m_id,m_password,m_name,m_email,m_phone)
	values('dd','dd','dd','dd','dd')