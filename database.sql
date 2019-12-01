	/*DROP DATABASE IF EXISTS library;*/

	create database library;

	use library;

	create table users (
	    id integer primary key auto_increment, 
	    name varchar(60),
	    email varchar(20), 
	    phone varchar(15), 
	    password varchar(20), 
	    role varchar(15));

	create table books (
	    id int primary key auto_increment,
	    name varchar(40),
	    author varchar(40),
	    subject varchar(40),
	    price float,
	    isbn long);

	create table copies( 
		id int primary key auto_increment,
		bookid int,
		rack int,
		status varchar(15),
		FOREIGN KEY(bookid) REFERENCES books(id));

	create table payments (
	    id int primary key auto_increment,
	    userid int,
	    amount float,
	    type varchar(15),
	    transaction_time DATETIME,
	    nextpayment_duedate DATE,
	    FOREIGN KEY(userid) REFERENCES users(id));
	    
	create table issuerecord (
	     id integer primary key auto_increment,
	     copyid int,
	     memberid int,
	     issue_date DATE,
	     return_duedate DATE,
	     return_date DATE,
	     fine_amount float,
	     FOREIGN KEY(copyid) REFERENCES copies(id),
	     FOREIGN KEY(memberid) REFERENCES users(id));
