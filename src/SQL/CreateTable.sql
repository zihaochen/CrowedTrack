DROP DATABASE IF EXISTS acmdb14;
CREATE DATABASE IF NOT EXISTS acmdb14;
use acmdb14;
CREATE TABLE Users(
username CHAR(20),
password CHAR(20),
fullname VARCHAR(40),
phoneno CHAR(15),
address CHAR(20),
PRIMARY KEY(username)
);

CREATE TABLE POI(
pid INTEGER AUTO_INCREMENT,
name VARCHAR(50),
address VARCHAR(50),
URL VARCHAR(50),
telno CHAR(15),
yearOfEstblsh YEAR,
hourofop CHAR(10),
price REAL,
keywords CHAR(30),
category CHAR(20),
PRIMARY KEY(pid)
);

CREATE TABLE VisEvent(
vid INTEGER AUTO_INCREMENT,
cost INTEGER,
numberofheads INTEGER,
PRIMARY KEY(vid)
);

CREATE TABLE Visit(
username CHAR(20), pid INTEGER, vid INTEGER,
visitdate CHAR(20) ,
PRIMARY KEY(username, pid, vid),
FOREIGN KEY(username) REFERENCES Users(username),
FOREIGN KEY(pid) REFERENCES POI(pid),
FOREIGN KEY(vid) REFERENCES VisEvent(vid)
);

CREATE TABLE Trust(
username1 CHAR(20), username2 CHAR(20),
isTrusted boolean,
PRIMARY KEY(username1, username2),
FOREIGN KEY(username1) REFERENCES Users(username),
FOREIGN KEY(username2) REFERENCES Users(username)
);

CREATE TABLE Feedback(
fid INTEGER PRIMARY KEY AUTO_INCREMENT,
text char(100),
fbdate CHAR(20),
pid INTEGER NOT NULL,
username char(20) NOT NULL,
FOREIGN KEY(username) REFERENCES Users(username),
FOREIGN KEY(pid) REFERENCES POI(pid)
);

CREATE TABLE Rates(
username CHAR(20),
fid INTEGER,
rating CHAR(20),
PRIMARY KEY(username, fid),
FOREIGN KEY(username) REFERENCES Users(username),
FOREIGN KEY(fid) REFERENCES Feedback(fid)
);

CREATE TABLE Favorites(
pid INTEGER NOT NULL,
username CHAR(20) NOT NULL,
fvdate CHAR(20),
PRIMARY KEY(pid, username),
FOREIGN KEY(pid) REFERENCES POI(pid),
FOREIGN KEY(username) REFERENCES Users(username)
);

CREATE TABLE Keywords(
wid INTEGER PRIMARY KEY AUTO_INCREMENT,
word CHAR(50)
);

CREATE TABLE HasKeywords(
pid INTEGER,
wid INTEGER,
PRIMARY KEY(pid, wid),
FOREIGN KEY(pid) REFERENCES POI(pid),
FOREIGN KEY(wid) REFERENCES Keywords(wid)
);