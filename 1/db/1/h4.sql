use MusicApplication

create view view_1 as
    select name, location
from musicapplication_schema.Event

create view view_2 as
    select ev.name, ti.type
from musicapplication_schema.Ticket ti
inner join musicapplication_schema.Event ev on ev.eid = ti.eid

create view view_3 as
    select ev.eid
from musicapplication_schema.Event ev
inner join musicapplication_schema.Event_Artist ea on ea.eid = ev.eid
group by ev.eid

--1 primary and no foreign - EVENT
--1 primary and foreign - Ticket
--two primary keys - Event-Artist


--position 1        2         3
--event_artist /artist -> ticket -> event delete
--event -> ticket -> artist/ event_artist
/*
create or alter procedure delete_from_table @table_name varchar(50), @number_rows int
as
    declare @i int
    set @i = 1
    while @i <= @number_rows
    begin
        if @table_name = 'Event_Artist'
        begin
            delete top (1) from musicapplication_schema.Event_Artist where 1=1
            delete top (1) from musicapplication_schema.Artist where 1=1
        end
        if @table_name = 'Ticket'
        begin
            delete top (1) from musicapplication_schema.Ticket where 1=1
        end
        if @table_name = 'Event' --or @table_name = 'Ticket' or @table_name = 'Event'
        begin
            delete top (1) from musicapplication_schema.Event where 1=1
        end
        set @i = @i + 1
    end

    --declare @command varchar(100)
    --set @command = 'Delete from musicapplication_schema.' + @table_name
    --exec(@command)
 */

go

create or
alter procedure insert_into_table @table_name varchar(50), @number_rows int
as
declare @table varchar(50)
    set @table = 'musicapplication_schema.' + @table_name
declare @i int
    set @i = 1
    while @i <= @number_rows
        begin
            if @table_name = 'Event' or @table_name = 'Event_Artist' or @table_name = 'Ticket'
                begin
                    declare @event_name varchar(50)
                    declare @event_location varchar(50)
                    declare @date varchar(50)
                    set @event_name = 'Event' + convert(varchar(50), @i)
                    --Y-M-D
                    set @event_location = 'Location' + convert(varchar(50), @i)
                    set @date = '2020' + '-' + convert(varchar(50), (@i % 12) + 1) + '-' + convert(varchar(50), (@i % 29) + 1)
                    insert into musicapplication_schema.Event(eid, tdate, location, name)
                    values (@i, @date, @event_location, @event_name)
                end
            if @table_name = 'Ticket'
                begin
                    declare @type varchar(50)
                    declare @event_id int
                    select @event_id = min(eid) from musicapplication_schema.Event where eid >= @i
                    set @type = 'type' + convert(varchar(50), @i)
                    insert into musicapplication_schema.Ticket(tid, price, type, eid)values (@i, @i + 100, @type, @event_id)
                end
            if @table_name = 'Event_Artist'
                begin
                    declare @artist_id int
                    declare @artist_name varchar(50)
                    declare @ev_id int
                    set @artist_name = 'Artist' + convert(varchar(50), @i)
                    insert into musicapplication_schema.Artist(aid, name, rid, age) values(@i,@artist_name, 1, @i)
                    select @ev_id = max(eid) from musicapplication_schema.Event where eid >= @i
                    select top 1 @artist_id = aid from musicapplication_schema.Artist where name = @artist_name
                    insert into musicapplication_schema.Event_Artist(aid, eid) values(@artist_id, @ev_id)
                end
            set @i = @i + 1
        end
go

create or alter procedure evaluate_view @view_name varchar(50)
as
    if @view_name = 'view_1'
    begin
        select * from view_1
    end
    if @view_name = 'view_2'
        begin
            select * from view_2
        end
    if @view_name = 'view_3'
        begin
            select * from view_3
        end
go


--exec insert_into_table Ticket, 50
--exec delete_from_table Ticket, 41
--select * from musicapplication_schema.Ticket

insert into dbo.Tables(Name)values('Event')
insert into dbo.Tables(Name)values('Ticket')
insert into dbo.Tables(Name)values('Event_Artist')

insert into dbo.Views(Name)values('view_1')
insert into dbo.Views(Name)values('view_2')
insert into dbo.Views(Name)values('view_3')

insert into dbo.Tests(Name) values('test_event')
insert into dbo.Tests(Name) values('test_ticket')
insert into dbo.Tests(Name) values('test_event_artist')
insert into dbo.Tests(Name) values('delete')

insert into dbo.TestViews(TestID, ViewID) values(4, 1)
insert into dbo.TestViews(TestID, ViewID) values(5, 2)
insert into dbo.TestViews(TestID, ViewID) values(6, 3)

insert into dbo.TestTables(TestID, TableID, NoOfRows, Position) values(4, 1, 1000, 1)
insert into dbo.TestTables(TestID, TableID, NoOfRows, Position) values(5, 2, 1000, 1)
insert into dbo.TestTables(TestID, TableID, NoOfRows, Position) values(6, 3, 1000, 1)

insert into dbo.TestTables(TestID, TableID, NoOfRows, Position) values(7, 1, 1000, 3)
insert into dbo.TestTables(TestID, TableID, NoOfRows, Position) values(7, 2, 1000, 2)
insert into dbo.TestTables(TestID, TableID, NoOfRows, Position) values(7, 3, 1000, 1)
select * from dbo.TestTables
update TestTables
set Position = 2 where TestId = 7 and TableID = 2

update dbo.TestTables
set NoOfRows = 400 where TableID = 3

create or alter procedure delete_all
as
    declare @name varchar(50)
    declare @tables int
    declare @table_id int
    declare @test_id int
    declare @command varchar(50)
    declare @i int
    declare @rows int
    set @tables = (select count(*) from dbo.Tables)
    set @i = 1 --position
    set @test_id = (select TestID from dbo.Tests where Name = 'delete')
    while @i <= @tables
    begin
        set @table_id = (select TableID from TestTables where Position = @i and TestID = @test_id)
        set @rows = (select NoOfRows from TestTables where Position = @i and TestID = @test_id)
        set @name = (select Name from Tables where TableID = @table_id)
        set @command = 'Delete from musicapplication_schema.' + @name
        exec(@command)
        if @name = 'Event_Artist'
            begin
                delete from musicapplication_schema.Artist where 1=1
            end
        --exec delete_from_table @name, @rows
        set @i = @i + 1
    end
go

create or alter procedure run_test
as
    declare @rows int
    declare @name varchar(50)
    declare @description varchar(200)
    declare @start_time datetime
    declare @end_time datetime
    declare @mid_time datetime
    declare @table_name varchar(50)
    declare @table_id int
    declare @test_id int
    declare @view_name varchar(50)
    declare @testrun_id int
    declare @view_id int
    declare crsr cursor for
    select TestID
    from dbo.Tests where TestID < 7
    open crsr
    fetch crsr
    into @test_id
    while @@fetch_status = 0
    begin
        set @name = (select Name from dbo.Tests where TestID = @test_id)
        set @table_id = (select top 1 TableID from dbo.TestTables where TestID = @test_id)
        set @table_name = (select Name from dbo.Tables where TableID = @table_id)
        set @view_id = (select top 1 ViewID from dbo.TestViews where TestID = @test_id)
        set @view_name = (select Name from dbo.Views where ViewID = @view_id)
        set @rows = (select top 1 NoOfRows from dbo.TestTables where TestID = @test_id)
        set @description = 'Test for ' + @name + convert(varchar(50), @rows) + ' rows'

        set @start_time = getdate()
        exec delete_all
        exec insert_into_table @table_name, @rows
        set @mid_time = getdate()
        exec evaluate_view @view_name
        set @end_time = getdate()
        insert into dbo.TestRuns(Description, StartAt, EndAt) values(@description, @start_time, @end_time)
        set @testrun_id = @@identity
        insert into dbo.TestRunTables(TestRunID, TableID, StartAt, EndAt) values(@testrun_id, @table_id, @start_time, @mid_time)
        insert into dbo.TestRunViews(TestRunID, ViewID, StartAt, EndAt) values(@testrun_id, @view_id, @mid_time, @end_time)
        fetch next from crsr
            into @test_id
    end
    close crsr
    deallocate crsr
go

select * from dbo.TestViews
drop procedure run_test
exec run_test
select * from dbo.Tests
delete from dbo.TestRuns where 1=1
select * from dbo.TestRunViews
select * from dbo.TestRunTables
select * from dbo.TestRuns
--exec delete_from_table Ticket, 1000
--exec delete_from_table Event, 1000
--exec delete_from_table Event_Artist, 1000
--exec delete_from_table Artist, 1000
select * from musicapplication_schema.Ticket

exec insert_into_table Event, 100
exec insert_into_table Ticket, 100
exec insert_into_table Event_Artist, 1000

select * from musicapplication_schema.Ticket
select * from musicapplication_schema.Event
exec delete_all

create table Application(
    aid int primary key identity , --aid
    name varchar(50),
    size int unique --a2
)

create table Computer(
    cid int primary key identity,
    brand varchar(50),
    price int --b2
)

create table Runs(
    rid int primary key identity, --cid,
    aid int foreign key references Application(aid), --aid
    cid int foreign key references Computer(cid) --cid
)
select * from Application
select * from Computer
select * from Runs

insert into Computer values ('Lenovo', 500)
insert into Computer values ('Asus', 650)
insert into Computer values ('Lenovo', 850)
insert into Computer values ('Samsung', 990)
insert into Computer values ('Asus', 855)
insert into Computer values ('HP', 900)
insert into Computer values ('Acer', 650)
insert into Computer values ('Apple', 888)
insert into Computer values ('Samsung', 650)
insert into Computer values('Lenovo', 999999)

insert into Application values ('Chrome', 1500)
insert into Application values ('Datagrip', 5000)
insert into Application values ('Visual Studio', 5500)
insert into Application values ('League of Legends', 10000)
insert into Application values ('Spotify', 3500)

--Runs(ap, com)
insert into Runs values(1, 2)
insert into Runs values(1, 6)
insert into Runs values(1, 4)
insert into Runs values(1, 5)
insert into Runs values(2, 3)
insert into Runs values(2, 7)
insert into Runs values(4, 9)
insert into Runs values(4, 8)
insert into Runs values(5, 2)


create nonclustered index index_application_size on Application(size);
drop index index_application_size on Application
--a)
--clustered index scan
select aid from Application
--clustered index seek
select aid from Application where aid % 2 = 0
--nonclustered index scan
select size from Application
--nonclustered index seek
select size from Application where size > 3500
--key lookup

--b)
select price from Computer where price = 650 --rows = 3 total cost = 0.0032919
                            --after            rows = 3 total cost = 0.0032853
create nonclustered index index_computer_price on Computer(price)
drop index index_computer_price on Computer

--c)
create view view_run
as
    select Computer.price from Computer
    inner join Runs on Runs.cid = Computer.cid
    where Computer.brand = 'Lenovo'

select * from view_run