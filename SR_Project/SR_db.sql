SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS station_info;
DROP TABLE IF EXISTS station;




/* Create Tables */

CREATE TABLE board
(
	board_no int NOT NULL,
	number int NOT NULL,
	user_id char(100) NOT NULL,
	type int,
	title char(100),
	user_name varchar(20),
	content varchar(3000),
	readcnt int,
	regdate datetime,
	PRIMARY KEY (board_no)
);


CREATE TABLE comment
(
	comment_no int NOT NULL,
	user_id char(100) NOT NULL,
	number int NOT NULL,
	score int,
	comment varchar(200),
	user_name varchar(20),
	regdate datetime,
	PRIMARY KEY (comment_no)
);


CREATE TABLE member
(
	user_id char(100) NOT NULL,
	name char(20),
	gender char(2),
	age int,
	bookmark1 int,
	bookmark2 int,
	bookmark3 int,
	PRIMARY KEY (user_id)
);


CREATE TABLE reply
(
	reply_no int NOT NULL,
	board_no int NOT NULL,
	user_id char(100) NOT NULL,
	user_name varchar(20),
	content char(200),
	regdate datetime,
	ref int,
	reflevel int,
	PRIMARY KEY (reply_no)
);


CREATE TABLE station
(
	number int NOT NULL,
	call_no int,
	station_id char(30),
	name char(50),
	gu char(10),
	address char(200),
	latitude char(30),
	longitude char(30),
	rack_totCnt int,
	PRIMARY KEY (number)
);

CREATE TABLE station_info
(
	info_no int NOT NULL,
	month char(20) NOT NULL,
	number int NOT NULL,
	m_use int,
	f_use int,
	nomember_use int,
	total_usetime int,
	age_10 int,
	age_20 int,
	age_30 int,
	age_40 int,
	age_50 int,
	age_60 int,
	PRIMARY KEY (info_no)
);



