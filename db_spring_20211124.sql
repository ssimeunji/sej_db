use spring_study;
drop table trainee;
create table trainee(
	t_number int auto_increment,
	t_name varchar(10),
    t_age int,
    t_phone varchar(13),
    t_gender varchar(2),
    t_birth date,
    t_address varchar(50)
);
