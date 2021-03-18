create database MusicApplication
use MusicApplication
create schema musicapplication_schema

create table musicapplication_schema.Album(
    id int primary key,
    name varchar(50),
    number_of_songs int
    --,gid references musicapplication_schema.Genre(gid)
    ---fid int references musicapplication_schema.Format(fid)
)

--drop table musicapplication_schema.Album
--alter table musicapplication_schema.Album
--drop constraint FK__Album__gid__5CD6CB2B
--drop column gid
--add gid int references musicapplication_schema.Genre(gid)
--add fid int references musicapplication_schema.Format(fid)
--drop column aid

create table musicapplication_schema.RecordLabel(
    rid int primary key,
    name varchar(50)
)


create table musicapplication_schema.Artist(
    aid int primary key,
    name varchar(50),
    rid int references musicapplication_schema.RecordLabel(rid)
)

create table musicapplication_schema.Song(
    sid int primary key,
    aid int references musicapplication_schema.Artist(aid),
    name varchar(50),
    length int
)

create table musicapplication_schema.Genre(
    gid int primary key,
    name varchar(50)
)

create table musicapplication_schema.Playlist(
    pid int primary key,
    name varchar(50),
)

create table musicapplication_schema.Playlist_Song(
    pid int references musicapplication_schema.Playlist(pid),
    sid int references musicapplication_schema.Song(sid),
    primary key(pid, sid)
)

create table musicapplication_schema.Format(
    fid int primary key,
    type varchar(50)
)

create table musicapplication_schema.Artist_Album(
    aid int references musicapplication_schema.Artist(aid),
    id int references musicapplication_schema.Album(id),
    primary key (aid, id)
)

create table musicapplication_schema.Ticket(
    tid int primary key,
    price int,
    type varchar(50)
)

create table musicapplication_schema.Event(
    eid int primary key,
    tid int references musicapplication_schema.Ticket(tid),
    tdate date,
    location varchar(50)
)

create table musicapplication_schema.Event_Artist(
    aid int references musicapplication_schema.Artist(aid),
    eid int references musicapplication_schema.Event(eid)
)

select * from musicapplication_schema.Format

insert into musicapplication_schema.Genre(gid, name) values (0, 'Pop')
insert into musicapplication_schema.Genre(gid, name) values (1, 'Rock')
insert into musicapplication_schema.Genre(gid, name) values (2, 'Hip Hop')
insert into musicapplication_schema.Genre(gid, name) values (3, 'Manele')

insert into musicapplication_schema.Format(fid, type) values (0, 'Digital')
insert into musicapplication_schema.Format(fid, type) values (1, 'CD')
insert into musicapplication_schema.Format(fid, type) values (2, 'Vinyl')
insert into musicapplication_schema.Format(fid, type) values (3, 'RandomFormat')

insert into musicapplication_schema.RecordLabel(rid, name) values(0, 'Roc-A-Fella Records')
insert into musicapplication_schema.RecordLabel(rid, name) values(1, 'Sony Music Entertainment')
insert into musicapplication_schema.RecordLabel(rid, name) values(2, 'Apple Records')
insert into musicapplication_schema.RecordLabel(rid, name) values(3, 'SCM Production')

insert into musicapplication_schema.Artist(aid, name, rid) values(0, 'Jay-Z', 0)
insert into musicapplication_schema.Artist(aid, name, rid) values(1, 'John Lennon', 2)
insert into musicapplication_schema.Artist(aid, name, rid) values(2, 'Michael Jackson', 1)
insert into musicapplication_schema.Artist(aid, name, rid) values(3, 'Flo Rida', 1)
insert into musicapplication_schema.Artist(aid, name, rid) values(4, 'The Weeknd', 1)
insert into musicapplication_schema.Artist(aid, name, rid) values(5, 'Di-ZI', 3)

insert into musicapplication_schema.Event_Artist(aid, eid) values (0, 0)
insert into musicapplication_schema.Event_Artist(aid, eid) values (0, 2)
insert into musicapplication_schema.Event_Artist(aid, eid) values (0, 3)
insert into musicapplication_schema.Event_Artist(aid, eid) values (3, 3)
insert into musicapplication_schema.Event_Artist(aid, eid) values (3, 2)

insert into musicapplication_schema.Album(id, name, number_of_songs, gid, fid) values (0, 'The Blueprint', 13, 2, 0)
insert into musicapplication_schema.Album(id, name, number_of_songs, gid, fid) values (1, 'Thriller', 9, 0, 2)
insert into musicapplication_schema.Album(id, name, number_of_songs, gid, fid) values (2, 'Imagine', 10, 1, 1)
insert into musicapplication_schema.Album(id, name, number_of_songs, gid, fid) values (4, 'RandomAlbum', 99, 1, 1)
insert into musicapplication_schema.Album(id, name, number_of_songs, gid, fid) values (3, 'SomeAlbum', 99, 2, 2)
insert into musicapplication_schema.Album(id, name, number_of_songs, gid, fid) values (5, 'One of the Boys', 15, 0, 3)
insert into musicapplication_schema.Album(id, name, number_of_songs, gid, fid) values (6, 'SCM', 7, 2, 0)

insert into musicapplication_schema.Artist_Album(aid, id) values(5, 6)
insert into musicapplication_schema.Artist_Album(aid, id) values(0,0)
insert into musicapplication_schema.Artist_Album(aid, id) values(1,2)
insert into musicapplication_schema.Artist_Album(aid, id) values(2,1)
insert into musicapplication_schema.Artist_Album(aid, id) values(1,1)
insert into musicapplication_schema.Artist_Album(aid, id) values(3, 5)


insert into musicapplication_schema.Playlist_Song(pid, sid) values(0, 11)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(0, 12)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(0, 15)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(0, 16)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(0, 17)
insert into musicapplication_schema.Song(sid, aid, name, length) values (0, 1, 'Wanna Be Startin Somethin', 2)
insert into musicapplication_schema.Song(sid, aid, name, length) values(1, 1, 'Baby Be Mine', 4)
insert into musicapplication_schema.Song(sid, aid, name, length) values(2, 1, 'The Girl Is Mine', 3)
insert into musicapplication_schema.Song(sid, aid, name, length) values(3, 1, 'Thriller', 5)
insert into musicapplication_schema.Song(sid, aid, name, length) values(4, 1, 'Beat It', 5)
insert into musicapplication_schema.Song(sid, aid, name, length) values(5, 1, 'Billie Jean', 4)
insert into musicapplication_schema.Song(sid, aid, name, length) values(6, 1, 'Human Nature', 3)
insert into musicapplication_schema.Song(sid, aid, name, length) values(7, 1, 	'P.Y.T. (Pretty Young Thing)', 2)
insert into musicapplication_schema.Song(sid, aid, name, length) values(8, 1, 'The Lady in My Life', 2)
insert into musicapplication_schema.Song(sid, aid, name, length) values(19, 5, 'SCM!!', 7)

alter table musicapplication_schema.Ticket
add eid int foreign key references musicapplication_schema.Event(eid)


insert into musicapplication_schema.Ticket(tid, price, type, eid) values (0, 100, 'general', 0)
insert into musicapplication_schema.Ticket(tid, price, type, eid) values (1, 27, 'one day', 0)
insert into musicapplication_schema.Ticket(tid, price, type, eid) values (2, 400, 'vip', 0)
insert into musicapplication_schema.Ticket(tid, price, type, eid) values (3, 999, 'all', 0)
insert into musicapplication_schema.Ticket(tid, price, type, eid) values (4, 100, 'general', 1)
insert into musicapplication_schema.Ticket(tid, price, type, eid) values (5, 27, 'one day', 1)
insert into musicapplication_schema.Ticket(tid, price, type, eid) values (6, 400, 'vip', 1)
insert into musicapplication_schema.Ticket(tid, price, type, eid) values (7, 100, 'general', 2)
insert into musicapplication_schema.Ticket(tid, price, type, eid) values (8, 27, 'one day', 3)
insert into musicapplication_schema.Ticket(tid, price, type, eid) values (9, 400, 'vip', 3)
insert into musicapplication_schema.Ticket(tid, price, type, eid) values (10, 999, 'all', 3)
insert into musicapplication_schema.Ticket(tid, price, type, eid) values (11, 999999999, 'blackedition', null)

insert into musicapplication_schema.Song(sid, aid, name, length) values(9, 2, 'Imagine', 3)
insert into musicapplication_schema.Song(sid, aid, name, length) values(10, 2, 'How?', 3)
insert into musicapplication_schema.Song(sid, aid, name, length) values(11, 0, 'Takeover', 3)
insert into musicapplication_schema.Song(sid, aid, name, length) values(12, 0, 	'The Ruler''s Back', 2)
insert into musicapplication_schema.Song(sid, aid, name, length) values(13, 2, 	'Oh Yoko!', 2)
insert into musicapplication_schema.Song(sid, aid, name, length) values(14, 3, 	'Humble', 2)
insert into musicapplication_schema.Song(sid, aid, name, length) values(15, 0, 	'Izzo', 4)
insert into musicapplication_schema.Song(sid, aid, name, length) values(16, 0, 	'Never Change', 3)
insert into musicapplication_schema.Song(sid, aid, name, length) values(17, 0, 	'Girls, Girls, Girls', 5)
insert into musicapplication_schema.Song(sid, aid, name, length) values(18, 3, 	'Roar', 5)

insert into musicapplication_schema.Playlist(pid, name) values(0, 'Imagine')
insert into musicapplication_schema.Playlist(pid, name) values(1, 'This is The Beatles')
insert into musicapplication_schema.Playlist(pid, name) values(2, 'Youtube Playlist')
insert into musicapplication_schema.Playlist(pid, name, number_songs) values(3, 'Spotify Playlist',null)
alter table musicapplication_schema.Event
add name varchar(50)
insert into musicapplication_schema.Event(eid, tdate, location, name) values(0, '2012-02-21T18:10:00', 'Romania', 'Electric Castle')
insert into musicapplication_schema.Event(eid, tdate, location, name) values(1, '2014-12-15T18:10:00', 'Romania', 'Untold')
insert into musicapplication_schema.Event(eid, tdate, location, name) values(2, '2020-03-11T18:10:00', 'Romania', 'Coachella')
insert into musicapplication_schema.Event(eid, tdate, location, name) values(3, '2021-04-1T18:10:00', 'Belgium', 'Tomorrowland')

insert into musicapplication_schema.Playlist_Song(pid, sid) values(0, 1)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(0, 2)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(0, 3)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(0, 4)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(0, 5)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(1, 2)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(1, 3)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(2, 4)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(2, 10)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(2, 18)
insert into musicapplication_schema.Playlist_Song(pid, sid) values(3, 19)
alter table musicapplication_schema.Artist
add age int
select * from musicapplication_schema.Artist
update musicapplication_schema.Artist
set age = 50
where name = 'Jay-Z'
update musicapplication_schema.Artist
set age = 62
where name = 'Michael Jackson'
update musicapplication_schema.Artist
set age = 80
where name = 'John Lennon'
update musicapplication_schema.Artist
set age = 36
where name = 'Katy Perry'
update musicapplication_schema.Artist
set age = 24
where name = 'Di-ZI'
update musicapplication_schema.Song
set name = 'Hot n Cold' where name = 'Humble'

update musicapplication_schema.Event
set location = 'California' where name = 'Coachella'

alter table musicapplication_schema.Playlist
add number_songs int

select * from musicapplication_schema.Ticket
update musicapplication_schema.Playlist
set number_songs= 13
where pid =0

--delete
delete from musicapplication_schema.Artist where name = 'The Weeknd'
delete from musicapplication_schema.Artist_Album where aid = 1 and id = 1
delete from musicapplication_schema.Album where name = 'RandomAlbum'
--update
update musicapplication_schema.Artist
set name = 'Katy Perry'
where name = 'Flo Rida'

update musicapplication_schema.Album
set name = 'DAMN', fid = 0, number_of_songs = 14
where name = 'SomeAlbum'

update musicapplication_schema.Genre
set name = 'Blues'
where name = 'Manele'

update musicapplication_schema.Format
set type = '8-track tape'
where type = 'RandomFormat' and fid <= 4

update musicapplication_schema.Playlist
set number_songs = 50
where number_songs is null

update musicapplication_schema.Playlist
set number_songs = 13
where pid in (0)

--union
--all artists and albums
select name from musicapplication_schema.Artist
union
select name from musicapplication_schema.Album

--display all playlists and albums with at least 14 songs
select name, number_songs from musicapplication_schema.Playlist
where number_songs > 13
union
select name, number_of_songs from musicapplication_schema.Album al
where al.number_of_songs > 13

--select only albums/playlist with the same name
select name from musicapplication_schema.Album
intersect
select name from musicapplication_schema.Playlist

--select all albums and playlists with the same name and with digitals/cd format for albums
select name from musicapplication_schema.Album al
where fid in(1, 2)
intersect
select name from musicapplication_schema.Playlist pl
order by name

--select all playlist which are not named after an album and have at least 6 songs
select name from musicapplication_schema.Playlist
where number_songs > 5
except
select name from musicapplication_schema.Album
where number_of_songs > 5

--select all artists with albums
select ar.name from musicapplication_schema.Artist ar
inner join musicapplication_schema.Artist_Album aa on ar.aid = aa.aid

--show all formats, genre and all albums available for the format
select f.type, al.name, g.name from musicapplication_schema.Format f
full join musicapplication_schema.Album al on f.fid = al.fid
full join musicapplication_schema.Genre g on g.gid = al.gid

--display all artists that have a concert with all ticket types, locations and prices available
select ar.name, ev.name, ev.location, ti.type, ti.price from musicapplication_schema.Event_Artist ea
left join musicapplication_schema.Artist ar on ea.aid = ar.aid
left join musicapplication_schema.Event ev on ev.eid = ea.eid
left join musicapplication_schema.Ticket ti on ti.eid = ev.eid

--display all artists that have a concert with all the songs they have, and if there exist display all playlist which contains any song from them
select distinct pl.name, so.name, ar.name from musicapplication_schema.Playlist pl
right join musicapplication_schema.Playlist_Song ps on ps.pid = pl.pid
right join musicapplication_schema.Song so on so.sid = ps.sid
right join musicapplication_schema.Artist ar on so.aid = ar.aid
right join musicapplication_schema.Event_Artist ea on ea.aid = ar.aid

--display all artists that have a concert
select ar.name from musicapplication_schema.Artist ar
where ar.aid in (select aid from musicapplication_schema.Event_Artist)

--display all albums for the artists that have a concert
select al.name from musicapplication_schema.Album al where al.id in
    (select aa.id from musicapplication_schema.Artist_Album aa where aa.aid in
        (select ea.aid from musicapplication_schema.Event_Artist ea where ea.aid = aa.aid))

--display all arists with at least an album
select ar.name from musicapplication_schema.Artist ar where
exists(select * from musicapplication_schema.Artist_Album aa where ar.aid = aa.aid)

--display all tickets available for Electric Castle
select ti.type, ti.price from musicapplication_schema.Ticket ti where
exists(select * from musicapplication_schema.Event ev where ev.eid = ti.eid and ev.name = 'Electric Castle' )
order by ti.price

--display first 3 playlist with the most songs
select pl.name, pl.number_songs from
(select top 3 name, number_songs from musicapplication_schema.Playlist ) as pl order by pl.number_songs desc

--display the number of events in each countries
select count(*) as "number of events", location
from musicapplication_schema.Event
group by location

--display average tickets price for Untold
select Event.name, avg(Ticket.price) "avg price for event"
from musicapplication_schema.Event
inner join  musicapplication_schema.Ticket ON Event.eid = Ticket.eid
group by Event.name
having Event.name in (select Event.name from musicapplication_schema.Event where Event.name = 'Untold')

--display the age of the oldest artist from a record label
select max(Artist.age) as "age"
from musicapplication_schema.Artist
group by Artist.rid
having Artist.rid in (select RecordLabel.rid from musicapplication_schema.RecordLabel where RecordLabel.name = 'Sony Music Entertainment')

--number of albums in every format
select count(*) as "number of albums", Format.type
from musicapplication_schema.Format
inner join musicapplication_schema.Album on Format.fid = Album.fid
group by Format.type
having Format.type in (select type from musicapplication_schema.Format)

--display all Jay-Z songs
select so.name from musicapplication_schema.Song so
where so.aid = all(select ar.aid from musicapplication_schema.Artist ar where ar.name = 'Jay-Z')

--display all events which have an one day ticket
select ev.name, ev.location from musicapplication_schema.Event ev
where ev.eid = any(select ti.eid from musicapplication_schema.Ticket ti where ti.type = 'one day')

--display the album with the most songs
select * from musicapplication_schema.Album al
where al.number_of_songs > all(select number_of_songs from musicapplication_schema.Album where number_of_songs <> al.number_of_songs)

--display playlists which have a song that have length > 5minutes
select * from musicapplication_schema.Playlist pl
where pl.pid = any(select ps.pid from musicapplication_schema.Playlist_Song ps
    inner join musicapplication_schema.Song so on ps.sid = so.sid and so.length > 5)

--display the album with the most songs
select * from musicapplication_schema.Album al
where al.number_of_songs = (select max(k.number_of_songs) from musicapplication_schema.Album k)

--display youngest artist
select * from musicapplication_schema.Artist ar
where ar.age = (select min(k.age) from musicapplication_schema.Artist k)

--display all events which have an one day ticket
select ev.name, ev.location from musicapplication_schema.Event ev
where ev.eid in (select eid from musicapplication_schema.Ticket where type = 'one day')

--display playlists which have a song that have length > 5minutes
select * from musicapplication_schema.Playlist pl
where pl.pid in (select ps.pid from musicapplication_schema.Playlist_Song ps
    inner join musicapplication_schema.Song so on so.length > 5 and so.sid = ps.sid)

create procedure first_procedure
as
    select name from musicapplication_schema.Artist
go

--drop procedure first_procedure
alter procedure first_procedure(@age int)
as
select name from musicapplication_schema.Artist
where age = @age

alter procedure first_procedure(@age int, @number_artists int output)
as
    select @number_artists = count(*)
    from musicapplication_schema.Artist
    where age = @age
    if @number_artists = 0
        raiserror('no artists with given age', 10, 1)
go

create function return_age(@n int)
returns int as
    begin
        return @n
    end

print dbo.return_age(20)


--examples^