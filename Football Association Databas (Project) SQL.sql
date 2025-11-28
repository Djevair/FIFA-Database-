CREATE DATABASE Football_Association
USE Football_Association

CREATE TABLE COUNTRY(
country_id numeric(10) primary key not null,
name varchar(25),
rank numeric(3));

INSERT INTO COUNTRY VALUES(74,'Germany',14);
INSERT INTO COUNTRY VALUES(33,'Italy',8);
INSERT INTO COUNTRY VALUES(12,'England',5);
INSERT INTO COUNTRY VALUES(21,'France',3);
INSERT INTO COUNTRY VALUES(67,'Portugal',9);
INSERT INTO COUNTRY VALUES(44,'Spain',10);

select * from COUNTRY order by rank

CREATE TABLE COACH(
coach_id numeric(10) primary key not null,
fname varchar(20),
lname varchar(20),
age numeric(2));

INSERT INTO COACH VALUES(50,'Luis','Enrique',52);
INSERT INTO COACH VALUES(60,'Didier','Deschamps',54);
INSERT INTO COACH VALUES(70,'Hansi','Flick',57);
INSERT INTO COACH VALUES(80,'Antonio','Conte',53);
INSERT INTO COACH VALUES(90,'Gareth','Southgate',52);
INSERT INTO COACH VALUES(100,'Jose','Mourinho',59);

select * from COACH 

CREATE table SPONSOR(
sponsor_id numeric(10) primary key not null,
name varchar(20),
contract_length int);

INSERT INTO SPONSOR VALUES(1,'Adidas',3);
INSERT INTO SPONSOR VALUES(2,'Nike',3);
INSERT INTO SPONSOR VALUES(3,'Puma',4);
INSERT INTO SPONSOR VALUES(4,'Kappa',2);
INSERT INTO SPONSOR VALUES(5,'Hummel',3);
INSERT INTO SPONSOR VALUES(6,'Slazenger',1);

select * from SPONSOR

CREATE table PLAYER(
player_id numeric(10) primary key not null,
country_id numeric(10) not null constraint c_id_fk references COUNTRY(country_id),
fname varchar(20),
lname varchar(20),
age int,
kit_no int);

INSERT INTO PLAYER VALUES(101,12,'Marcus','Rashford',25,10);
INSERT INTO PLAYER VALUES(102,12,'Bukayo','Saka',21,7);
INSERT INTO PLAYER VALUES(401,33,'Nicolo','Barella',25,23);
INSERT INTO PLAYER VALUES(402,33,'Federico','Chiesa',25,7);
INSERT INTO PLAYER VALUES(201,74,'Leon','Goretzka',27,8);
INSERT INTO PLAYER VALUES(202,12,'Jonas','Hector',32,14);
INSERT INTO PLAYER VALUES(501,21,'Houssem','Aouar',24,8);
INSERT INTO PLAYER VALUES(502,21,'Kylian','Mbappe',24,7);
INSERT INTO PLAYER VALUES(301,44,'Jordi','Alba',33,18);
INSERT INTO PLAYER VALUES(302,44,'Lucas','Vasquez',32,17);
INSERT INTO PLAYER VALUES(601,67,'Goncalo','Ramos',21,88);
INSERT INTO PLAYER VALUES(602,67,'Diogo','Costa',23,99);

select * from PLAYER

create table LEAGUE(
league_id numeric(10) primary key not null,
country_id numeric(10) not null constraint cl_id_fk references COUNTRY(country_id),
name varchar(25),
no_of_teams int);

INSERT INTO LEAGUE VALUES(1,12,'Premier League',20);
INSERT INTO LEAGUE VALUES(2,74,'Bundesliga',18);
INSERT INTO LEAGUE VALUES(3,44,'LaLiga',20);
INSERT INTO LEAGUE VALUES(4,33,'Seria A',20);
INSERT INTO LEAGUE VALUES(5,21,'Ligue 1',20);
INSERT INTO LEAGUE VALUES(6,67,'Liga NOS',18);

select * from LEAGUE

create table CLUB(
club_id numeric(10) primary key not null,
country_id numeric(10) not null constraint cc_id_fk references COUNTRY(country_id),
league_id numeric(10) not null constraint cle_id_fk references LEAGUE(league_id),
name varchar(25),
city varchar(25),
yeat_est DATE);

INSERT INTO CLUB VALUES(5,12,1,'Manchester United','Manchester','06.05.1878');
INSERT INTO CLUB VALUES(10,12,1,'Arsenal','London','06.08.1886');
INSERT INTO CLUB VALUES(6,74,2,'Bayern Munich','Munich','02.27.1900');
INSERT INTO CLUB VALUES(45,74,2,'FC Köln','Cologne','02.13.1948');
INSERT INTO CLUB VALUES(11,33,4,'Juventus','Turin','10.01.1897');
INSERT INTO CLUB VALUES(14,33,4,'Internazionale','Milano','03.09.1908');
INSERT INTO CLUB VALUES(7,21,5,'PSG','Paris','08.12.1970');
INSERT INTO CLUB VALUES(35,21,5,'OL Lyon','Lyon','10.02.1950');
INSERT INTO CLUB VALUES(1,44,3,'Real Madrid','Madrid','06.03.1902');
INSERT INTO CLUB VALUES(3,44,3,'FC Barcelona','Barcelona','10.29.1899');
INSERT INTO CLUB VALUES(42,67,6,'FC Porto','Porto','09.28.1893');
INSERT INTO CLUB VALUES(41,67,6,'SL Benfica','Lisbon','02.28.1904');

select * from CLUB order by league_id 

create table CLUB_SPONSOR(
club_id numeric(10) not null constraint cs references CLUB(club_id),
sponsor_id numeric(10) not null constraint sc references SPONSOR(sponsor_id),
constraint clu_spo primary key (club_id,sponsor_id));

INSERT INTO CLUB_SPONSOR VALUES(5,1);
INSERT INTO CLUB_SPONSOR VALUES(10,1);
INSERT INTO CLUB_SPONSOR VALUES(11,1);
INSERT INTO CLUB_SPONSOR VALUES(14,2);
INSERT INTO CLUB_SPONSOR VALUES(6,1);
INSERT INTO CLUB_SPONSOR VALUES(45,4);
INSERT INTO CLUB_SPONSOR VALUES(7,2);
INSERT INTO CLUB_SPONSOR VALUES(35,3);
INSERT INTO CLUB_SPONSOR VALUES(3,2);
INSERT INTO CLUB_SPONSOR VALUES(1,1);
INSERT INTO CLUB_SPONSOR VALUES(42,5);
INSERT INTO CLUB_SPONSOR VALUES(41,6);

select * from CLUB_SPONSOR

create table TRANSFERS(
player_id numeric(10) not null constraint p_id references PLAYER(player_id),
club_id numeric(10) not null constraint t_c_fk references CLUB(club_id),
price numeric(10)
constraint ptr_pc_pk primary key(player_id,club_id));

create table CLUB_COACH(
club_id numeric(10) not null constraint c_c references CLUB(club_id),
coach_id numeric(10) not null constraint cc references COACH(coach_id),
constraint ccc primary key(club_id,coach_id));

INSERT INTO CLUB_COACH VALUES(5,90);
INSERT INTO CLUB_COACH VALUES(11,80);
INSERT INTO CLUB_COACH VALUES(6,70);
INSERT INTO CLUB_COACH VALUES(35,60);
INSERT INTO CLUB_COACH VALUES(3,50);
INSERT INTO CLUB_COACH VALUES(42,100);

select * from CLUB_COACH

create table PLAYER_SPONSOR(
player_id numeric(10) not null constraint ps references PLAYER(player_id),
sponsor_id numeric(10) not null constraint sp references SPONSOR(sponsor_id),
constraint new_ps primary key(player_id,sponsor_id));

INSERT INTO PLAYER_SPONSOR VALUES(101,1);
INSERT INTO PLAYER_SPONSOR VALUES(202,2);
INSERT INTO PLAYER_SPONSOR VALUES(301,3);
INSERT INTO PLAYER_SPONSOR VALUES(401,4);
INSERT INTO PLAYER_SPONSOR VALUES(501,5);
INSERT INTO PLAYER_SPONSOR VALUES(602,6);

select * from PLAYER_SPONSOR

select fname,lname,kit_no
from player 
where country_id=21
order by kit_no

select name,club_id
from club
where club_id>20

INSERT INTO PLAYER VALUES (103,12,'Harry','Maguire',29,5);
INSERT INTO PLAYER VALUES (203,74,'Jamal','Musiala',19,14);

select * from PLAYER

select * from LEAGUE l,CLUB c where l.country_id=c.country_id and l.no_of_teams>19 order by l.league_id

select cb.name,cb.city
from CLUB cb, COUNTRY c
where c.country_id=cb.country_id and c.country_id=74 and cb.name <> 'FC Köln'

select fname,lname
from PLAYER inner join COUNTRY
on PLAYER.country_id=COUNTRY.country_id

update club set league_id=7 where club_id=7 and club_id=35

select * from CLUB

select count(*) as TOTAL from CLUB cb,COUNTRY c where cb.country_id=c.country_id and cb.name <> 'FC Porto'

select fname,lname,kit_no 
from PLAYER inner join COUNTRY
on  PLAYER.country_id=COUNTRY.country_id