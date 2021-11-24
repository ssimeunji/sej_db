-- 202111102
-- mySQL_sej database 사용
use mySQL_sej;
-- 현재 접속 중인 사용자 확인
select user();
SELECT USER();
-- 테이블 생성
drop table student;
create table student(
	student_name varchar(5),
	student_number varchar(10),
    student_age int
    );
-- 테이블에 담긴 데이터 조회
select * from student;
-- student_name 컬럼만 조회
select student_name from student;
-- student_name, student_age 컬럼 조회
select student_name, student_age from student;
-- student 테이블에 데이터 삽입
insert into student(student_name, student_number, student_age)
	values('학생1', '11111111', 22);
insert into student(student_name, student_number, student_age)
	values('학생학생1', '11111111', 22);
insert into student(student_name, student_number, student_age)
	values('학생학생11', '11111111', 22);
    
-- 모든 컬럼에 데이터를 다 넣을 때는 컬럼이름 생략 가능
insert into student values('학생2','22222222',33);

insert into student(student_name, student_number)  values('학생2','22222222');

drop table dept;
drop table emp;
drop table bonus;
drop table salgrade;
CREATE TABLE dept (
    deptno INT,
    dname VARCHAR(14),
    loc VARCHAR(13)
);


CREATE TABLE emp (
    empno INT,
    ename VARCHAR(10),
    job VARCHAR(9),
    mgr INT,
    hiredate DATE,
    sal INT,
    comm INT,
    deptno INT
);


CREATE TABLE bonus (
    ename VARCHAR(10),
    job VARCHAR(9),
    sal INT,
    comm INT
);


CREATE TABLE salgrade (
    grade INT,
    losal INT,
    hisal INT
);
    

INSERT INTO DEPT VALUES	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES	(40,'OPERATIONS','BOSTON');    

INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902, str_to_date('17-12-1980','%d-%m-%Y'),800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,str_to_date('20-2-1981','%d-%m-%Y'),1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,str_to_date('22-2-1981','%d-%m-%Y'),1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,str_to_date('2-4-1981','%d-%m-%Y'),2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,str_to_date('28-9-1981','%d-%m-%Y'),1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,str_to_date('1-5-1981','%d-%m-%Y'),2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,str_to_date('9-6-1981','%d-%m-%Y'),2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,str_to_date('13-7-87','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,str_to_date('17-11-1981','%d-%m-%Y'),5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,str_to_date('8-9-1981','%d-%m-%Y'),1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,str_to_date('13-7-87','%d-%m-%Y'),1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,str_to_date('3-12-1981','%d-%m-%Y'),950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,str_to_date('3-12-1981','%d-%m-%Y'),3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,str_to_date('23-1-1982','%d-%m-%Y'),1300,NULL,10);
		 
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

-- emp 테이블 전체 내용 조회 (내용있음)
select * from emp;
-- salgrade 테이블 전체 내용 조회 (내용있음)
select * from salgrade;
-- bonus 테이블 전체 내용 조회 (내용없음)
select * from bonus;
-- dept 테이블 전체 내용 조회 (내용있음)
select * from dept;

-- emp 테이블 ename만 조회
select ename from emp;
-- emp 테이블 job만 조회
select job from emp;
-- emp 테이블 ename, hiredate, deptno 조회
select ename, hiredate, deptno from emp;
-- emp 테이블 ename, deptno, hiredate 조회
select ename, deptno, hiredate from emp;

select job from emp;
-- 중복 데이터는 제외하고 조회
select distinct job from emp;

select * from emp;
-- 이름순으로 정렬
select * from emp order by ename asc; -- 오름차순 (생략가능)
select * from emp order by ename desc; -- 내림차순
-- sal을 기준으로 오름차순 내림차순으로 각각 정렬
select * from emp order by sal asc; -- 오름차순
select * from emp order by sal desc; -- 내림차순
-- hiredate를 기준으로 오름차순 내림차순 각각 정렬
select * from emp order by hiredate asc; -- 오름차순
select * from emp order by hiredate desc; -- 내림차순
select ename, hiredate from emp order by hiredate desc;

-- 이름이 james 라는 사원의 전체 데이터 조회
select * from emp where ename='james';
select ename, hiredate, sal from emp where ename='james';
-- 직급이 salesman인 사원의 이름, 입사일자, 사번 조회
select ename, hiredate, empno from emp where job='salesman';
select * from emp where job='salesman';
-- 직급이 manager이고 부서번호가 20인 사원 조회
select * from emp where job='manager'and deptno=20;
select * from emp where job='manager'or deptno=20;
-- 급여가 3000 이상인 사원 조회
select * from emp where sal>=3000;
-- 급여가 3000 미만인 사원 조회
select * from emp where sal<3000;
-- 급여가 3000 미만인 사원을 이름을 기준으로 내림차순 정렬하고 ename, sal 컬럼만 조회
-- where절, order by 절
-- 보고싶은 컬럼: ename, sal
-- 조건: 급여 3000 미만
-- 정렬조건: 이름, 내림차순
select ename, sal from emp where sal<3000 order by ename desc;
-- 직급이 salesman이 아닌 사원 조회
select * from emp where job != 'salesman';
-- 급여가 2000 이상 3000 이하인 사원 조회
select * from emp where sal>=2000 and sal<=3000;
select * from emp where sal between 2000 and 3000;
-- like 연산자
-- % 와일드카드: 글자수 제약이 없다는 표현
-- _ 와일드카드: 
-- 이름이 m으로 시작하는 사원
select * from emp where ename like 'm%';
-- 이름이 m으로 끝나는 사원
select * from emp where ename like '%m';
-- 이름에 m이 포함된 사원
select * from emp where ename like '%m%';
select * from emp where ename like '_m%'; -- smith
select * from emp where ename like '__m%'; -- james
-- 이름이 m인 사원
select * from emp where ename like 'm';

select * from emp;
-- 81년 4월 1일 이후 입사한 사원 조회
select * from emp where hiredate>'1981-04-01';
select * from emp where hiredate>str_to_date('1981-05-01','%Y-%m-%d');

-- 테이블 구조 확인 describe
desc emp;

-- 집계함수: sum(), avg(), max(), min(), count()
-- 사원 급여 총합 조회
select sum(sal) from emp;
-- alias: 별칭
select sum(sal) as '급여총합' from emp;
-- salesman 사원 급여 총합 조회
select sum(sal) as 'salesman 급여 총합' from emp where job='salesman';
-- 전체 사원 수 조회
select count(*) from emp;
select count(empno) as '전체 사원 수' from emp;
-- 부서번호가 20인 사원 수 조회
select count(empno) from emp where deptno=20;

-- 20211103
-- PC를 껐다가 다시 접속하는 경우 database 사용 쿼리를 실행해야 함.
use mySQL_sej;
-- 급여 중 최대 급여 조회
select max(sal) from emp;
select max(ename) from emp;
select min(ename) from emp;
-- 급여 평균 조회
select avg(sal) from emp; -- 2073.2143
-- round: 반올림
select round(avg(sal), 1) from emp; -- 2073.2
select round(avg(sal), 2) from emp; -- 2073.21
select round(avg(sal), 3) from emp; -- 2073.214
-- dual 테이블: 가상의 테이블로 여기서 뭘 가지고 오겠다는 것이 아니라 select 하는 내용만 보고싶을 때
select round(123.345, 2) from dual; -- 123.35
select round(123.34577, 3) from dual; -- 123.346

-- 그룹핑(그룹화)
select * from emp;
select deptno from emp group by deptno;
-- 그룹화를 할 때 조회 데이터는 그룹화를 수행한 컬럼을 주로 조회함.
-- select * from emp group by deptno; (x)
-- deptno 를 기준으로 그룹화를 하고 부서별 평균 급여 조회
select deptno, avg(sal) from emp group by deptno;
select deptno, round(avg(sal), 1) from emp group by deptno;
select deptno,
	round(avg(sal), 1) as '평균급여',
    count(empno) as '사원수'
		from emp group by deptno;
-- 직급별 평균급여, 사원수 조회
select job,
	round(avg(sal), 1) as '평균급여',
	count(empno) as '사원수'
		from emp group by job order by job asc;
        
-- 부서별(deptno)로 그룹화를 하고 그 안에서 직급(job)별로 그룹화를 한 뒤 평균 급여, 사원수 조회
select job, deptno,
	round(avg(sal), 1) as '평균급여',
	count(empno) as '사원수'
		from emp group by deptno, job
			order by deptno asc, job desc;
-- 그룹화를 하고 조건을 따지고 싶다면
-- 그룹화된 데이터를 가지고 조건을 따질 때는 having 절 사용 (where 아님)
-- having 절에 사용되는 조건은 집계함수
-- 부서번호를 기준으로 그룹화를 하고 그 안에서 job으로 그룹화한 뒤 평균 급여가 2500이상 인 것만 조회
-- 조회 결과는 직급, 부서번호, 평균급여, 사원수를 조회하고 부서번호를 기준으로 오름차순, 직급을 기준으로 내림차순 정렬
select job, deptno,
	round(avg(sal), 1) as '평균급여',
	count(empno) as '사원수'
		from emp group by deptno, job
			having avg(sal) >= 2500
				order by deptno asc, job desc;
select * from emp order by deptno asc, job asc;
-- 급여가 3000이하인 사원을 대상으로
-- 부서번호를 기준으로 그룹화를 하고 그 안에서 job으로 그룹화한 뒤 평균 급여가 2000이상 인 것만 조회
-- 조회 결과는 직급, 부서번호, 평균급여, 사원수를 조회하고 부서번호를 기준으로 오름차순, 직급을 기준으로 내림차순 정렬

-- 1단계: 급여가 3000이하인 사원만 조회
select * from emp where sal <= 3000;
-- 2단계: 급여가 3000이하인 사원을 부서번호로 1차 그룹핑, 직급으로 2차 그룹핑
-- 직급, 부서번호, 평균급여, 사원수를 조회
select job, deptno, round(avg(sal), 1) as '평균급여', count(empno) as '사원수'
	from emp
		where sal <= 3000
			group by deptno, job;
-- 3단계: 2단계에 평균급여가 2000이상인 조건 추가
select job, deptno, round(avg(sal), 1) as '평균급여', count(empno) as '사원수'
	from emp
		where sal <= 3000
			group by deptno, job
				having avg(sal) >= 2000;
-- 4단계: 3단계 조회 결과를 부서번호 오름차순, 직급 내림차순으로 정렬
select job, deptno, round(avg(sal), 1) as '평균급여', count(empno) as '사원수'
	from emp
		where sal <= 3000
			group by deptno, job
				having avg(sal) >= 2000
					order by deptno asc, job desc;
                    
/*
	연습문제
    1. 부서별 평균급여, 최고급여, 최저급여, 사원수 조회(평균급여는 소수점 둘째자리에서 반올림)
    2. 직급별 사원수 조회(단 3명 이상인 결과만 출력)
    3. 연도별 입사한 사원수 조회(조회결과: 연도(yyyy), 사원수)
    3.1. 위의 결과에서 각 연도별로 부서별 입사한 사원수 조회(조회결과: 연도(yyyy), 부서번호, 사원수)
*/
-- date 타입을 문자타입으로 표현할 때
select date_format(hiredate, '%Y') from emp;
select * from emp;
-- 1.
select deptno as '부서', round(avg(sal), 1) as '평균급여', max(sal) as '최고급여', min(sal) as '최저급여', count(empno) as '사원수'
	from emp group by deptno;
-- 2.
select job as '직급', count(empno) as '사원수' from emp
		group by job having count(empno)>=3;
-- 3.
select date_format(hiredate, '%Y') as '입사년도', count(empno) as '사원수' from emp
	group by date_format(hiredate, '%Y') ;
-- 3.1.
select date_format(hiredate, '%Y') as '입사년도', deptno as '부서', count(empno) as '사원수' from emp
	group by date_format(hiredate, '%Y'), deptno;
    
-- join: 테이블 조인
-- 2개 이상의 테이블을 한번에 조회할 때 사용
select * from emp;
select * from dept;
-- join 조건: 공통 컬럼이 있어야 가능
select * from emp, dept where emp.deptno = dept.deptno;
select * from emp e, dept d where e.deptno = d.deptno;
-- select * from emp, dept; (x)
select empno, ename, job from emp e, dept d where e.deptno= d.deptno;
-- select empno, ename, job, deptno from emp e, dept d where e.deptno= d.deptno;
-- 공통컬럼을 select 할 때는 어떤 테이블의 컬럼인지를 정확하게 지정해야 함
select e.empno, e.ename, e.job, d.deptno, d.dname from emp as e, dept as d where e.deptno= d.deptno;
select e.*, d.* from emp as e, dept as d where e.deptno = d.deptno;
-- emp, dept 테이블을 조인하여 empno, ename, deptno, dname, loc 조회
-- (단 급여가 2500 이상인 사원만 조회하고, 조회결과는 deptno 기준으로 오름차순 정렬)
select e.empno, e.ename, d.deptno, d.dname, d.loc from emp as e, dept as d where e.deptno = d.deptno and e.sal>=2500 order by d.deptno asc;

-- sub query (서브쿼리)
select * from emp order by sal asc;
-- allen 보다 급여가 높은 사원 조회
-- 1. allen 급여 확인 2. allen 급여보다 높은 사원 조회
select sal from emp where ename='allen';
select * from emp where sal > 1600;
-- 서브쿼리 이용
select * from emp where sal > any(select sal from emp where ename='allen');
-- select * from emp where sal > any(select * from emp where ename='allen'); (x)
-- select * from emp where sal > any(select ename from emp where ename='allen'); (x)

-- 급여를 가장 적게 받는 사원의 이름 조회
select ename from emp where sal=(select min(sal) from emp);
-- 급여를 가장 많이 받는 사원의 이름 조회
select ename from emp where sal=(select max(sal) from emp);

/*
	연습문제
    1. clark 보다 늦게 입사한 사원 조회
    2. 부서번호가 20인 사원중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회
    3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회
*/
select * from emp;
select * from dept;
-- 1.
select hiredate from emp where ename='clark'; -- 1981-06-09
select * from emp
	where hiredate > (select hiredate from emp where ename='clark');
-- 2.
select sal from emp where deptno = 20;
select avg(sal) from emp; -- 2073.2143
select * from emp where deptno = 20 and sal > (select avg(sal) from emp);
-- 3.
select e.*, d.dname as '부서이름', d.loc as '부서위치' from emp as e, dept as d
	where e.deptno = d.deptno and d.deptno = 20 and sal > (select avg(sal) from emp);
    
/*
	create table [테이블이름] (
		[컬럼명1] [타입](크기),
        [컬럼명2] int,
        [컬럼명n] [타입](크기),
        constraint [제약조건종류] [제약조건이름,필수아님] (제약조건지정할컬럼명),
        constraint [제약조건종류] [제약조건이름,필수아님] (제약조건지정할컬럼명)
    );
*/
/*
	제약조건
    1. primary key(주키, 유일키, pk): 테이블당 하나의 컬럼만 지정, 테이블에 저장된 데이터를 구분하는데 주로 사용.
								   필수로 입력해야 하며(not null), 중복값은 허용하지 않음(unique).
		ex) 회원테이블에서 아이디, 게시글테이블에서 글번호, 현실에서 주민등록번호 등
	2. foreign key(외래키, 참조키, fk): 2개의 테이블간 연관관계 지정시 사용, 참고하고자 하는 테이블의 pk를 지정함.
    3. not null: 해당 컬럼에 값을 필수로 입력해야 함.
    4. unique: 중복값을 허용하지 않음.
*/
drop table trainee1;
-- t_id에 pk지정
create table trainee1(
	t_id varchar(20),
	t_name varchar(5),
    t_age int,
    t_birth date,
    t_phone varchar(20),
    t_email varchar(30),
    constraint primary key pk_trainee1(t_id)
);
-- now(): 현재시간을 사용할 때
insert into trainee1(t_id,t_name,t_age,t_birth,t_phone,t_email)
	values ('id1','이름1',20,now(),'010-1111-1111','aaa@aaa.com');
-- pk로 지정한 t_id 컬럼에 같은 값을 삽입하면
insert into trainee1(t_id,t_name,t_age,t_birth,t_phone,t_email)
	values ('id1','이름1',20,now(),'010-1111-1111','aaa@aaa.com');
    -- pk로 지정한 t_id 컬럼에 null을 삽입하면
insert into trainee1(t_id,t_name,t_age,t_birth,t_phone,t_email)
	values (null,'이름1',20,now(),'010-1111-1111','aaa@aaa.com');

insert into trainee1(t_id,t_name,t_age,t_birth,t_phone,t_email)
	values ('id3',null,20,now(),null,'aaa@aaa.com');

select * from trainee1;

-- 현재 database에 지정된 제약조건들 조회
select * from information_schema.table_constraints;

use mySQL_sej;

-- 제약조건 지정 연습
-- t_name: not null 적용, t_age: unique 적용, t_phone: not null 적용
-- 제약조건 지정 후 각각 제약조건이 제대로 적용됬는지 테이블에 데이터를 삽입해보세요.

-- date: 날짜만
-- datetime: 날짜+시간
-- 현재시간: now() 

drop table trainee2;
create table trainee2(
	t_id varchar(20),
	t_name varchar(5) not null,
    t_age int,
    t_birth datetime,
    t_phone varchar(20) not null,
    t_email varchar(30),
    constraint primary key pk_trainee2(t_id),
    constraint unique key nk_trainee2(t_age)
);

select * from information_schema.table_constraints;
-- 특정 테이블 제약조건만 볼 때
select * from information_schema.table_constraints where table_name='trainee2';
select * from information_schema.table_constraints where constraint_name='primary';
select * from information_schema.table_constraints where constraint_type='PRIMARY KEY';

insert into trainee2(t_id,t_name,t_age,t_birth,t_phone,t_email)
	values('id1','이름1',20,now(),'010-1111-1111','aaa@aaa.com');
select * from trainee2;
-- 1. pk로 지정한 t_id에 같은 값을 저장할 때
-- => error code 1062: duplicate entry 'id1' for key trainee2.PRIMARY
insert into trainee2(t_id,t_name,t_age,t_birth,t_phone,t_email)
	values('id1','이름1',20,str_to_date('2000-01-01','%Y-%m-%d'),'010-1111-1111','aaa@aaa.com');
-- 2. pk로 지정한 t_id에 값을 넣지 않을 때
-- => error code 1048: column 't_id' cannot be null
-- 2.1. t_id에 null insert
insert into trainee2(t_id,t_name,t_age,t_birth,t_phone,t_email)
	values(null,'이름1',20,str_to_date('2000-01-01','%Y-%m-%d'),'010-1111-1111','aaa@aaa.com');
-- 2.2. t_id 자체를 쓰지 않는 경우
insert into trainee2(t_id,t_name,t_age,t_birth,t_phone,t_email)
	values('이름1',20,str_to_date('2000-01-01','%Y-%m-%d'),'010-1111-1111','aaa@aaa.com');
-- 3. not null로 지정한 t_name
-- => error code 1048: column 't_name' cannot be null
insert into trainee2(t_id,t_name,t_age,t_birth,t_phone,t_email)
	values('id1',null,10,now(),'010-1111-1111','aaa@aaa.com');
insert into trainee2(t_id,t_age,t_birth,t_phone,t_email)
	values('id123123',10,now(),'010-1111-1111','aaa@aaa.com');
-- 4. unique로 지정한 t_age
select * from trainee2;
-- 기존 테이블에 있는 값과 동일한 값을 t_age에 삽입
-- => error code 1062: duplicate entry '20' for key 'trainee2.un_trainee2'
insert into trainee2(t_id,t_name,t_age,t_birth,t_phone,t_email)
	values('id22','이름22',20,now(),'010-1111-1111','aaa@aaa.com');
insert into trainee2(t_id,t_name,t_birth,t_phone,t_email)
	values('id22','이름22',now(),'010-1111-1111','aaa@aaa.com');
    
select * from information_schema.table_constraints where table_name='trainee2';
drop table trainee2;
-- 테이블을 삭제하면 제약조건도 같이 사라짐
-- 제약조건 개별 삭제
-- alter: 테이블 구조변경, 이름변경, 타입, 크기 변경 등을 할 때
alter table trainee2 drop constraint un_trainee2;
-- pk 제약조건 삭제
alter table trainee2 drop primary key;

-- 테이블 만들고 나서 제약조건을 추가하는 경우
alter table trainee2 add constraint primary key(t_id);

alter table trainee2 add constraint unique un_new_trainee2(t_age);
-- 제약 조건 이름을 주지 않는 경우
alter table trainee2 add constraint unique (t_email);

create table a(
	a1 varchar(10),
	a2 int,
	constraint primary key(a1)
);
create table b(
	b1 varchar(10),
    b2 int,
    a1 varchar(10),
    constraint primary key(b1),
	-- b테이블의 a1 컬럼을 a테이블의 a1 컬럼을 참조하는 외래키로 지정
    constraint fk_b foreign key(a1) references a(a1)
);

-- 제약조건 조회
select * from information_schema.table_constraints;

insert into a(a1,a2) values('aaa',111);
insert into a(a1,a2) values('bbb',222);
select * from a;
-- 외래키로 지정한 b테이블의 a1 컬럼에 a 라는 데이터 삽입
-- => error code 1452: cannot add or update a child row. a foreign key constraint fails
insert into b(b1,b2,a1) values('b111',123,'a'); -- x
insert into b(b1,b2,a1) values('b222',123,'b'); -- x

insert into b(b1,b2,a1) values('b111',123,'aaa'); -- o
insert into b(b1,b2,a1) values('b333',123,'bbb'); -- o
insert into b(b1,b2,a1) values('b555',123,'ccc'); -- x

create table c(
	c1 varchar(10),
    c2 int,
    constraint primary key(c1)
);
drop table d;
create table d(
	d1 varchar(20),
    d2 int,
	c1 varchar(8),
    constraint primary key(d1),
    constraint foreign key(c1) references c(c1)
);
insert into c(c1,c2) values('c1데이터1',10);
insert into c(c1,c2) values('c1데이터2',20);

insert into d(d1,d2,d3) values('d1데이터1',10,'d3데이터1'); -- x
insert into d(d1,d2,d3) values('d1데이터1',10,'c1데이터1'); -- o

-- 외래키 문법, 외래키 사용시 어떤 제약이 있는지
-- 외래키 지정시 주의사항
-- 일반적으로 다른 테이블의 pk를 외래키로 참조함
-- 참조하고자하는 컬럼의 타입, 크기를 동일하게 해야 함.

desc d;

-- emp, dept 테이블의 컬럼명, 타입, 크기는 그대로 따라하고
-- dept테이블의 deptno을 pk로
-- empno 컬럼을 pk로 , deptno 컬럼을 dept 테이블의 deptno를 참조하는 fk로 제약조건을 지정하여 테이블 생성
-- 테이블 이름은 각각 emp1, dept1으로
CREATE TABLE dept1 (
    deptno INT,
    dname VARCHAR(14),
    loc VARCHAR(13),
    constraint primary key(deptno)
);

CREATE TABLE emp1 (
    empno INT,
    ename VARCHAR(10),
    job VARCHAR(9),
    mgr INT,
    hiredate DATE,
    sal INT,
    comm INT,
    deptno INT,
    constraint primary key(empno),
    constraint foreign key(deptno) references dept1(deptno)
);

drop table e;
create table e(
	e1 int,
    e2 varchar(10),
    constraint primary key(e1)
);
drop table f;
create table f(
	f1 int,
    f2 varchar(20),
    e1 int,
    constraint primary key(f1),
    -- constraint foreign key(e1) references e(e1) on delete cascade
	constraint foreign key(e1) references e(e1) on delete set null
);

insert into e(e1,e2) values(1,'데이터1');
insert into e(e1,e2) values(2,'데이터2');
insert into e(e1,e2) values(3,'데이터3');
insert into e(e1,e2) values(4,'데이터4');

insert into f(f1,f2,e1) values(1,'data1',1);
insert into f(f1,f2,e1) values(2,'data2',2);
insert into f(f1,f2,e1) values(3,'data2',3);
insert into f(f1,f2,e1) values(4,'data2',4);
-- insert into f(f1,f2,e1) values(3,'data3',3); -- x
select * from e;
select * from f;
-- e테이블 삭제
-- Error Code: 3730. Cannot drop table 'e' referenced by a foreign key constraint 'f_ibfk_1' on table 'f'.
drop table e;

-- 데이터 삭제
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
delete from f;
delete from f where f1=2;
delete from f where f1=3;
select * from f;
select * from e;
-- e테이블의 e1값이 3인 데이터 삭제
delete from e where e1=3;
-- 참조관계 설정시 on delete cascade를 하면
-- 부모 테이블에 담긴 데이터 삭제 시 자식 테이블에 참조한 데이터도 함께 삭제됨

-- on delete set null을 하면
-- 참조한 데이터 잘리가 null이 됨
delete from e where e1=3;

-- 수정 쿼리
-- e테이블의 데이터2라는 값을 데이터 234로 수정
update e set e2='데이터234' where e1=2;
select * from e;

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
--
insert into naver_member(n_id,n_password,n_name,n_birth,n_gender,n_email,n_phone)
	values('id1','1q2w3e','회원1',str_to_date('2000-01-01','%Y-%m-%d'),'F','aa@aa.com','010-1111-1111');
    
select * from naver_member;

-- 글쓰기 화면: 카테고리, 제목, 내용
-- 글조회 화면: 글번호, 제목, 작성자, 작성시간, 추천수, 조회수
-- 제곧내(제목이 곧내용)
create table naver_board(
	b_number int auto_increment,
    b_title varchar(30) not null,
    b_writer varchar(20) not null,
    b_contents varchar(200),
    b_date datetime not null,
    b_like int default 0,
    b_hits int default 0,
    b_category int,
    constraint primary key(b_number),
    constraint foreign key(b_writer) references naver_member(n_id) on delete cascade,
    constraint foreign key(b_category) references naver_category(c_number) on delete cascade
);
insert into naver_board(b_title,b_writer,b_contents,b_date)
	values('제목1','id1','내용1',now());
select * from naver_board;

create table naver_category(
	c_number int auto_increment,
	c_name varchar(30),
    constraint primary key(c_number)
);
select * from naver_category;

-- 20211105
-- PC를 껐다가 다시 접속하는 경우 database 사용 쿼리를 실행해야 함.
use mySQL_sej;

-- 댓글
-- 필요정보: 작성자, 작성시간, 작성내용, 원글정보
create table naver_comment(
-- auto_increment: 자동 번호를 입력해줌.
	c_number int auto_increment,
	c_writer varchar(20) not null,
    c_date datetime not null,
    c_contents varchar(200) not null,
    b_number int not null,
    constraint primary key(c_number),
    constraint foreign key(c_writer) references naver_member(n_id) on delete cascade,
    constraint foreign key(b_number) references naver_board(b_number) on delete cascade
);

insert into naver_comment(c_writer,c_date,c_contents,b_number)
	values('id1',now(),'댓글내용1',1);
insert into naver_comment(c_writer,c_date,c_contents,b_number)
	values('id1',now(),'댓글내용1',1);
    
select * from naver_comment;
