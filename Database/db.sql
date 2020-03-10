CREATE DATABASE IP;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'ip20';
USE ip;
DROP TABLE IF EXISTS USER_PREF, LOCATION,USERS,ART_PIECE,PLACE,STYLE,AUTHOR;
CREATE TABLE USER_PREF (
 ID INT NOT NULL,
 Style INT NOT NULL,
 liked BOOL,
 PRIMARY KEY (ID,Style));

CREATE TABLE MANAGER(
	ID INT NOT NULL AUTO_INCREMENT,
	PLACE_ID INT NOT NULL,
	email VARCHAR (140) NOT NULL,
 	country INT NOT NULL,
	PRIMARY KEY (ID));

CREATE TABLE LOCATION (
 PLACE_ID INT NOT NULL,
 AUTHOR_ID INT NOT NULL,
 Piece INT NOT NULL,
 PRIMARY KEY (PLACE_ID,AUTHOR_ID,Piece));
 
CREATE TABLE USERS (
 ID INT NOT NULL AUTO_INCREMENT,
 name VARCHAR (70) NOT NULL,
 email VARCHAR (140) NOT NULL,
 country VARCHAR (35) NOT NULL,
 city VARCHAR (35),
 PRIMARY KEY (ID),
 FOREIGN KEY (ID) REFERENCES USER_PREF(ID));
 
CREATE TABLE ART_PIECE (
 ID INT NOT NULL AUTO_INCREMENT,
 name VARCHAR (70),
 author INT NOT NULL,
 style INT NOT NULL,
 date INT,
 description TEXT,
 image VARCHAR (2083),
 PRIMARY KEY (ID));
 
 CREATE TABLE AUTHOR (
 ID INT NOT NULL AUTO_INCREMENT,
 name VARCHAR (70) NOT NULL,
 style INT NOT NULL,
 born INT,
 death INT,
 description TEXT,
 image VARCHAR (2083),
 PRIMARY KEY (ID));

CREATE TABLE PLACE (
 ID INT NOT NULL AUTO_INCREMENT,
 name VARCHAR (70) NOT NULL,
 price INT,
 country VARCHAR (35) NOT NULL,
 city VARCHAR (35),
 latitude INT,
 longitude INT,
 PRIMARY KEY (ID));

CREATE TABLE STYLE (
 ID INT NOT NULL AUTO_INCREMENT,
 name VARCHAR (70) NOT NULL,
 era INT NOT NULL,
 Description TEXT, 
 PRIMARY KEY (ID));
 
ALTER TABLE LOCATION
	add constraint fk_LOCATION_Piece foreign key (Piece) references ART_PIECE(ID);
ALTER TABLE LOCATION
	add constraint fk_LOCATION_AID foreign key (AUTHOR_ID) references AUTHOR(ID); 
ALTER TABLE LOCATION
	add constraint fk_LOCATION_PID foreign key (PLACE_ID) references PLACE(ID);
ALTER TABLE ART_PIECE
	add constraint fk_ART_PIECE_APS foreign key (style) references STYLE(ID);
ALTER TABLE AUTHOR
    add constraint fk_AUTHOR_AS foreign key (style) references STYLE(ID);
ALTER TABLE USER_PREF
    add constraint fk_USER_PREF_USS foreign key (style) references STYLE(ID);
ALTER TABLE USER_PREF
    add constraint fk_USER_PREF_UID foreign key (ID) references USERS(ID);
