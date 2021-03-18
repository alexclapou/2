use examen

create table S(
    ID1 int,
    ID2 int,
    A int,
    B int,
    C int,
    D int,
    E int,
    F int,
    primary key (ID1, ID2)
)

insert into S values (1, 2, 10, 3, 0, 1, 200, 2)
INSERT INTO S
VALUES(2, 1, 2, 4, 1, 2, 100, 4);
INSERT INTO S
VALUES(2, 2, 2, 5, 1, 2, 110, 5);
INSERT INTO S
VALUES(2, 4, 3, 6, 1, 2, 100, 7);
INSERT INTO S
VALUES(4, 1, 3, 7, 2, 1, 200, 7);
INSERT INTO S
VALUES(4, 2, 3, 8, 2, 1, 300, 7);
INSERT INTO S
VALUES(5, 1, 3, 10, 3, 2, 100, 9);
INSERT INTO S
VALUES(5, 2, 3, 11, 4, 2, 100, 2);
INSERT INTO S
VALUES(6, 1, 10, 4, 1, 1, 100, 3);
INSERT INTO S
VALUES(6, 2, 2, 6, 1, 2, 120, 6);
INSERT INTO S
VALUES(6, 3, 3, 9, 3, 2, 100, 9);
INSERT INTO S
VALUES(7, 1, 10, 2, 0, 1, 100, 1);

select * from S

select s1.A, count(*) NumRows
from S s1 inner join S s2 on s1.ID1 > s2.ID1
and s1.ID2 > s2.ID2
group by s1.A
having min(s2.C) > 0

select distinct s1.ID2
from S s1 where s1.B not in (select s2.D from S s2 where s2.ID2>=3)union select distinct s3.ID1 from S s3

create table UpdateLog(
    ID1 int,
    ID2 int,
    N int,
    DateTimeOp datetime
)

create or alter trigger TrOnUpdate
on S
    for update
    as
    insert UpdateLog(ID1, ID2, N, DateTimeOp)
    select i.ID1, i.ID2, d.D - i.D, GETDATE()
    from inserted i inner join deleted d on i.ID1 = d.ID1
    and i.ID2 = d.ID2
    where d.D > i.D

    update S
set d = 0
where ID1 between 5 and 7

select * from UpdateLog

create table sch.Country(
    cid int primary key ,
    name varchar(50),
    population int,
)

create table sch.CMRS(
    cid int references sch.Country(cid),
    mrsid int references sch.MountainRangeSystem(mrsid),
    primary key (cid, mrsid)
)

create table sch.MountainRangeSystem(
    mrsid int primary key ,
    name varchar(50),
    length int,
)

create table sch.MountainGroup(
    mgid int primary key ,
    name varchar(50),
    mrsid int references sch.MountainRangeSystem(mrsid)
)

create table sch.Peak(
    pid int primary key,
    name varchar(50),
    height int,
    latitude float,
    longitude float,
    mgid int references sch.MountainGroup(mgid)
)

insert into sch.Country(cid, name, population) values(1, 'a', 100)
insert into sch.Country(cid, name, population) values(2, 'b', 1000)
insert into sch.Country(cid, name, population) values(3, 'c', 25000)
insert into sch.Country(cid, name, population) values(4, 'd', 1151930)

insert into sch.MountainRangeSystem(mrsid, name, length) values(2, 'MRS1', 100)
insert into sch.MountainRangeSystem(mrsid, name, length) values(3, 'MRS2', 59100)
insert into sch.MountainRangeSystem(mrsid, name, length) values(4, 'MRS3', 10)
insert into sch.MountainRangeSystem(mrsid, name, length) values(5, 'MRS4', 19500)

insert into sch.CMRS(cid, mrsid) values(1, 2)
insert into sch.CMRS(cid, mrsid) values(3, 2)
insert into sch.CMRS(cid, mrsid) values(1, 3)
insert into sch.CMRS(cid, mrsid) values(2, 5)
insert into sch.CMRS(cid, mrsid) values(2, 2)
insert into sch.CMRS(cid, mrsid) values(4, 2)

insert into sch.MountainGroup(mgid, name, mrsid) values(1, 'MountainGroup1', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(2, 'MountainGroup2', 3)
insert into sch.MountainGroup(mgid, name, mrsid) values(3, 'MountainGroup3', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(4, 'MountainGroup4', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(5, 'MountainGroup5', 5)
insert into sch.MountainGroup(mgid, name, mrsid) values(6, 'MountainGroup6', 4)

insert into sch.MountainGroup(mgid, name, mrsid) values(8, 'MountainGroup8', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(9, 'MountainGroup9', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(10, 'MountainGroup10', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(11, 'MountainGroup11', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(12, 'MountainGroup12', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(13, 'MountainGroup13', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(14, 'MountainGroup14', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(15, 'MountainGroup15', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(16, 'MountainGroup16', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(17, 'MountainGroup17', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(18, 'MountainGroup18', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(19, 'MountainGroup19', 2)
insert into sch.MountainGroup(mgid, name, mrsid) values(20, 'MountainGroup20', 2)


insert into sch.MountainGroup(mgid, name, mrsid) values(21, 'MountainGroup21', 5)
insert into sch.MountainGroup(mgid, name, mrsid) values(22, 'MountainGroup22', 5)
insert into sch.MountainGroup(mgid, name, mrsid) values(23, 'MountainGroup23', 5)
insert into sch.MountainGroup(mgid, name, mrsid) values(24, 'MountainGroup24', 5)
insert into sch.MountainGroup(mgid, name, mrsid) values(25, 'MountainGroup25', 5)
insert into sch.MountainGroup(mgid, name, mrsid) values(26, 'MountainGroup26', 5)
insert into sch.MountainGroup(mgid, name, mrsid) values(27, 'MountainGroup27', 5)
insert into sch.MountainGroup(mgid, name, mrsid) values(28, 'MountainGroup28', 5)
insert into sch.MountainGroup(mgid, name, mrsid) values(29, 'MountainGroup29', 5)
insert into sch.MountainGroup(mgid, name, mrsid) values(30, 'MountainGroup30', 5)


insert into sch.Peak(pid, name, height, latitude, longitude, mgid) values(1, 'Peak1', 120, 19.5, 11.3, 1)
insert into sch.Peak(pid, name, height, latitude, longitude, mgid) values(2, 'Peak2', 150, 15.5, 30.5, 1)
insert into sch.Peak(pid, name, height, latitude, longitude, mgid) values(3, 'Peak3', 331, 8.5, 91.0, 3)
insert into sch.Peak(pid, name, height, latitude, longitude, mgid) values(4, 'Peak4', 1310, 119.5, 11.0, 3)
insert into sch.Peak(pid, name, height, latitude, longitude, mgid) values(5, 'Peak5', 1090, 109.5, 11.3, 4)
insert into sch.Peak(pid, name, height, latitude, longitude, mgid) values(6, 'Peak6', 90, 19.0, 15.3, 1)
insert into sch.Peak(pid, name, height, latitude, longitude, mgid) values(7, 'Peak7', 795, 37.4, 8.4, 5)


insert into sch.Peak(pid, name, height, latitude, longitude, mgid) values(8, 'Peak8', 2150, 37.4, 8.4, 5)
insert into sch.Peak(pid, name, height, latitude, longitude, mgid) values(9, 'Peak9', 2500, 37.4, 8.4, 5)
insert into sch.Peak(pid, name, height, latitude, longitude, mgid) values(10, 'Peak10', 2505, 37.4, 8.4, 5)
insert into sch.Peak(pid, name, height, latitude, longitude, mgid) values(11, 'Peak11', 2035, 37.4, 8.4, 5)
insert into sch.Peak(pid, name, height, latitude, longitude, mgid) values(12, 'Peak12', 7495, 37.4, 8.4, 5)

create or alter procedure delete_group_and_peaks @mountain_group_name varchar(50)
as
    declare @mg_id int
  if not exists(select * from sch.MountainGroup where name = @mountain_group_name)
  begin
    RAISERROR ('Invalid mountain group name', 16, 1)
    return
  end
    select  @mg_id = (select mgid  from sch.MountainGroup where @mountain_group_name = name)
    delete from sch.Peak where mgid = @mg_id
    delete from sch.MountainGroup where mgid = @mg_id
go

select * from sch.MountainGroup
select * from sch.Peak
exec delete_group_and_peaks 'MountainGroup3'
--i added data again after this call

create or alter view show_mountain
as
select name from sch.MountainRangeSystem where mrsid in (
    select mg.mrsid
    from sch.MountainRangeSystem mrs
     inner join sch.MountainGroup mg on mrs.mrsid = mg.mrsid
    where exists(
        select p.mgid from sch.Peak p
        where p.height >= 2000 and p.mgid = mg.mgid
        group by p.mgid
        having count(*) >= 5
  )
    group by mg.mrsid
    having count(*) >= 10
)

--display all mrs that have at least 10 mountains group
select name from sch.MountainRangeSystem where mrsid in (
    select mg.mrsid
    from sch.MountainRangeSystem mrs
     inner join sch.MountainGroup mg on mrs.mrsid = mg.mrsid
    group by mg.mrsid
    having count(*) >= 10
)

-- display all mountain groups with at least 5 peaks with 2000 meters high
select p.mgid from sch.Peak p
        inner join sch.MountainGroup m on p.mgid = m.mgid
        where p.height >= 2000 and p.mgid = m.mgid
        group by p.mgid
        having count(*) >= 5
select * from  show_mountain

create or alter function all_mountains_with_P_peaks_over_M_meters(@P int, @M int)
returns table
    return select m.name from sch.MountainGroup m where m.mgid in (select p.mgid from sch.Peak p
    inner join sch.MountainGroup m on p.mgid = m.mgid
    where p.height >= @M and p.mgid = m.mgid
    group by p.mgid
    having count (*) >= @P
    )

select * from all_mountains_with_P_peaks_over_M_meters (5, 2000)
