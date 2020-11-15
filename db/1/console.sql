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

insert into musicapplication_schema.Format(fid, type) values (0, 'Digital')
insert into musicapplication_schema.Format(fid, type) values (1, 'CD')
insert into musicapplication_schema.Format(fid, type) values (2, 'Vinyl')

insert into musicapplication_schema.RecordLabel(rid, name) values(0, 'Roc-A-Fella Records')
insert into musicapplication_schema.RecordLabel(rid, name) values(1, 'Sony Music Entertainment')
insert into musicapplication_schema.RecordLabel(rid, name) values(2, 'Apple Records')

insert into musicapplication_schema.Artist(aid, name, rid) values(0, 'Jay-Z', 0)
insert into musicapplication_schema.Artist(aid, name, rid) values(1, 'John Lennon', 2)
insert into musicapplication_schema.Artist(aid, name, rid) values(2, 'Michael Jackson', 1)
insert into musicapplication_schema.Artist(aid, name, rid) values(3, 'Flo Rida', 1)
insert into musicapplication_schema.Artist(aid, name, rid) values(4, 'The Weeknd', 1)
--delete
delete from musicapplication_schema.Artist where name = 'The Weeknd'
--update
update musicapplication_schema.Artist
set name = 'Katy Perry'
where name = 'Flo Rida'

select * from musicapplication_schema.Artist

insert into musicapplication_schema.Album(id, name, number_of_songs, gid, fid) values (0, 'The Blueprint', 13, 2, 0)
insert into musicapplication_schema.Album(id, name, number_of_songs, gid, fid) values (1, 'Thriller', 9, 0, 2)
insert into musicapplication_schema.Album(id, name, number_of_songs, gid, fid) values (2, 'Imagine', 10, 1, 1)

insert into musicapplication_schema.Artist_Album(aid, id) values(0,0)
insert into musicapplication_schema.Artist_Album(aid, id) values(1,2)
insert into musicapplication_schema.Artist_Album(aid, id) values(2,1)
insert into musicapplication_schema.Artist_Album(aid, id) values(1,1)
delete from musicapplication_schema.Artist_Album where aid = 1 and id = 1

select * from musicapplication_schema.Artist_Album