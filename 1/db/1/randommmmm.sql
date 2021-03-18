use ex

create table M(
    PK1 int,
    PK2 int,
    M1 varchar(100),
    M2 varchar(100),
    M3 int,
    M4 date,
    M5 varchar(10),
    primary key(PK1, PK2)

)

insert into M values (11, 1, 'Marin Preda', 'Editura Didactica', 15, '2000-12-01', 'FB')
insert into M values (11, 3, 'Mihai Eminescu', 'Editura Didactica', 8, '1980-04-06', 'FB')
insert into M values (11, 22, 'Ion Agarbiceanu', 'Humanitas', 5, '1990-01-01', 'B')
insert into M values (12, 1, 'Marin Preda', 'Litera', 10, '1900-04-09', 'B')
insert into M values (12, 3, 'Mihai Eminescu', 'Carturesti', 6, '2002-03-05', 'S')
insert into M values (12, 22, 'Camil Petrescu', 'Carturesti', 1, '1987-06-07', 'B')
insert into M values (13, 1, 'Mircea Eliade', 'Litera', 20, '2010-01-02', 'S')
insert into M values (13, 3, 'Lucian Blaga', 'Litera', 15, '2000-11-25', 'FB')
insert into M values (13, 22, 'Mircea Carturescu', 'Editura Didactica', 10, '2000-03-14', 'E')
insert into M values (14, 1, 'Lucian Blaga', 'Humanitas', 15, '2000-12-01', 'E')
insert into M values (14, 3, 'Dan Lungu', 'Polirom', 10, '1890-04-06', 'S')
insert into M values (14, 22, 'Mircea Eliade', 'Humanitas', 5, '2002-03-05', 'B')
insert into M values (14, 44, 'Dan lungu', 'Polirom', 2, '1990-01-01', 'E')


SELECT M2, SUM(M3) TotalM3, COUNT(M3) CountM3
FROM M
WHERE YEAR(M4)>= 2000 OR M1 LIKE '%escu%'
GROUP BY M2
HAVING SUM(M3) > 10

--c

SELECT * FROM
(SELECT PK1, PK2, M3 TotalM3 FROM M
WHERE PK1 <= PK2) p1
INNER JOIN (SELECT PK1, PK2, M5
FROM M
WHERE M5 LIKE '%B%') p2 ON p1.PK1 = p2.PK1 AND p1.PK2 = p2.PK2

--c

CREATE OR ALTER TRIGGER TrOnUpdate
ON M
FOR UPDATE AS
DECLARE @no INT = 0
SELECT @no = AVG(d.M3 - i.M3)
FROM deleted d INNER JOIN inserted i ON d.PK1 = i.PK1 AND d.PK2 = i.PK2 WHERE
d.M3 > i.M3
PRINT @no

UPDATE M
SET M3 = 3
WHERE PK1 > PK2
--b


create table scl.Student(
    id int primary key,
    name varchar(50),
    surname varchar(50),
    gid int references scl.Grp(gid)
)

create table scl.Grp(
    gid int primary key,
    nostudents int,
    leader varchar(50)
)

create table scl.Course(
    cid int primary key,
    name varchar(50)
)

create table scl.Exam(
    id int references scl.Student(id),
    cid int references scl.Course(cid),
    mark int,
    primary key(id, cid)
)

create table scl.Prof(
    pid int primary key,
    name varchar(50),
    spec varchar(50)
)

create table scl.PC(
    pid int references scl.Prof(pid),
    cid int references scl.Course(cid),
    credits int,
    primary key (pid, cid)
)

CREATE Or alter procedure add_exam @student_id int, @course_id int, @mark int
as
    declare @a int
    set @a = 0
    select @a = count(*) from scl.Exam where cid = @course_id and @student_id = id
    if(@a = 0)
    begin
        insert into scl.Exam values (@student_id, @course_id, @mark)
    end
    else
    begin
        update scl.Exam
        set mark = @mark
        where @student_id = id and @course_id = cid
    end

go

insert into scl.Grp(gid, nostudents, leader) values(1, 31, 'asdadsasd')
insert into scl.Grp(gid, nostudents, leader) values(2, 31, 'asdadsasd')
insert into scl.Grp(gid, nostudents, leader) values(3, 31, 'asdadsasd')
insert into scl.Grp(gid, nostudents, leader) values(4, 31, 'asdadsasd')
insert into scl.Grp(gid, nostudents, leader) values(5, 31, 'asdadsasd')

insert into scl.Student(id, name, surname, gid) values(1, 'asd', 'asd', 1)
insert into scl.Student(id, name, surname, gid) values(2, 'asd', 'asd', 5)
insert into scl.Student(id, name, surname, gid) values(3, 'asd', 'asd', 4)
insert into scl.Student(id, name, surname, gid) values(4, 'asd', 'asd', 2)
insert into scl.Student(id, name, surname, gid) values(5, 'asd', 'asd', 2)
insert into scl.Student(id, name, surname, gid) values(6, 'asd', 'asd', 3)
insert into scl.Student(id, name, surname, gid) values(7, 'asd', 'asd', 3)
insert into scl.Student(id, name, surname, gid) values(8, 'asd', 'asd', 3)
insert into scl.Student(id, name, surname, gid) values(9, 'asd', 'asd', 1)

insert into scl.Course(cid, name) values(1, 'asddsa')
insert into scl.Course(cid, name) values(2, 'asd')
insert into scl.Course(cid, name) values(3, 'cjcjc')
insert into scl.Course(cid, name) values(4, 'asdcc')
insert into scl.Course(cid, name) values(5, 'ad')
insert into scl.Course(cid, name) values(6, 'a')

insert into scl.Exam(id, cid, mark) values(1, 1, 10)
insert into scl.Exam(id, cid, mark) values(1, 2, 7)
insert into scl.Exam(id, cid, mark) values(3, 3, 10)
insert into scl.Exam(id, cid, mark) values(3, 1, 8)
insert into scl.Exam(id, cid, mark) values(2, 2, 9)
insert into scl.Exam(id, cid, mark) values(2, 1, 5)

insert into scl.Prof(pid, name, spec) values(1, 'a1', 'asd')
insert into scl.Prof(pid, name, spec) values(2, 'a2', 'as')
insert into scl.Prof(pid, name, spec) values(3, 'a3', 'ad')
insert into scl.Prof(pid, name, spec) values(4, 'a4', 'a')
insert into scl.Prof(pid, name, spec) values(5, 'a5', 'ascd')
insert into scl.Prof(pid, name, spec) values(6, 'a6', 'aswed')

insert into scl.PC(pid, cid, credits) values(1, 1, 3)
insert into scl.PC(pid, cid, credits) values(1, 2, 3)
insert into scl.PC(pid, cid, credits) values(1, 3, 3)
insert into scl.PC(pid, cid, credits) values(1, 4, 3)
insert into scl.PC(pid, cid, credits) values(3, 1, 3)
insert into scl.PC(pid, cid, credits) values(3, 5, 3)
insert into scl.PC(pid, cid, credits) values(2, 1, 3)

select * from scl.Exam
exec add_exam 4, 4, 9
select * from scl.Student

create or alter view view_1
as
    select gid from scl.Grp where gid in (select gid from scl.Student where id in (select id from scl.Exam where mark = 10))
    go

select id from scl.Exam where mark = 10

create or alter function f1(@M int)
returns table as
    return
    select prof.name, pc.pid
    from scl.PC pc inner join scl.Prof prof on pc.pid = prof.pid
    group by pc.pid, prof.name having count(prof.name) >= @M

select count(*) from scl.PC group by pid
select * from f1(3)
select * from view_1

create table dr.DroneManufacter(
    dmid int primary key,
    name varchar(50)
)

create table dr.DroneModel(
    did int primary key,
    name varchar(50),
    dmid int references dr.DroneManufacter(dmid)
)

create table dr.Drone(
    id int primary key ,
    serial_number varchar(50),
    did int references dr.DroneModel(did),
)

create table dr.PizzaShop(
    pid int primary key ,
    name varchar(50)
)

create table dr.Customer(
    cid int primary key ,
    name varchar(50),
    score int
)

create table dr.Delivery(
    delid int primary key ,
    pid int references dr.PizzaShop(pid),
    cid int references dr.Customer(cid),
    id int references dr.Drone(id),
    datat datetime
)


create or alter procedure add_delivery @customer_id int, @pizza_shop_id int, @drone_id int, @data datetime
as
    declare @delivery_id int
    set @delivery_id = 0
    select @delivery_id = max(delid) from dr.Delivery
    if(@delivery_id is NULL)
        set @delivery_id = 0
    insert into dr.Delivery(delid, pid, cid, id, datat) values(@delivery_id, @pizza_shop_id, @customer_id, @drone_id, @data)
    go

insert into dr.PizzaShop(pid, name) values(1, 'pizza1')
insert into dr.Customer(cid, name, score) values(1, 'aaa', 5)
insert into dr.DroneManufacter(dmid, name) values(1, 'aa')
insert into dr.DroneManufacter(dmid, name) values(2, 'bb')
insert into dr.DroneManufacter(dmid, name) values(3, 'cc')
insert into dr.DroneModel(did, name, dmid) values(2, 'ccasdc', 1)
insert into dr.DroneModel(did, name, dmid) values(3, 'ccscfsasdc', 1)
insert into dr.DroneModel(did, name, dmid) values(4, 'ccascgsdc', 1)
insert into dr.DroneModel(did, name, dmid) values(5, 'ccasdhc', 3)
insert into dr.DroneModel(did, name, dmid) values(6, 'ccashdc', 3)
insert into dr.DroneModel(did, name, dmid) values(7, 'ccaskjdc', 2)
insert into dr.DroneModel(did, name, dmid) values(8, 'ccasjdc', 3)
insert into dr.DroneModel(did, name, dmid) values(1, 'asaaa', 1)
insert into dr.Drone(id, serial_number, did) values(1, 'asddasdsa', 1)
insert into dr.Drone(id, serial_number, did) values(2, 'asddasdsa', 2)
insert into dr.Drone(id, serial_number, did) values(3, 'asddasdsa', 1)
insert into dr.Drone(id, serial_number, did) values(4, 'asddasdsa', 1)
insert into dr.Drone(id, serial_number, did) values(5, 'asddasdsa', 2)
insert into dr.Drone(id, serial_number, did) values(6, 'asddasdsa', 1)
insert into dr.Drone(id, serial_number, did) values(7, 'asddasdsa', 3)
insert into dr.Drone(id, serial_number, did) values(8, 'asddasdsa', 3)
insert into dr.Drone(id, serial_number, did) values(9, 'asddasdsa', 3)
insert into dr.Drone(id, serial_number, did) values(10, 'asddasdsa', 2)
insert into dr.Drone(id, serial_number, did) values(11, 'asddasdsa', 4)
insert into dr.Drone(id, serial_number, did) values(12, 'asddasdsa', 8)

exec add_delivery 1, 1, 1, '10-10-2020'
select * from dr.Delivery

create or alter view view_1
as
  --select top 1 max(NumberOfDrones) as MaximumNumber from (select count(*) as NumberOfDrones from dr.DroneModel group by dmid) as NumberOfDrones
  select from dr.DroneManufacter
  --select q.name, from dr.DroneModel d inner join dr.DroneManufacter q on d.dmid = q.dmid group by d.dmid, q.name
    --select from dr.DroneManufacter d inner join dr.DroneModel q on d.dmid = q.dmid
    go
select q.name from
(select d.dmid, count(*) Nr from dr.DroneModel d group by dmid)x inner join dr.DroneManufacter q on q.dmid = x.dmid

select * from view_1