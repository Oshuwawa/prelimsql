-- creating tables
CREATE TABLE books (
    bookid INT PRIMARY KEY,
    title VARCHAR(255),
    authorid INT,
    categoryid INT,
    yearpublished YEAR,
    copy_available INT
);

CREATE TABLE loans (
    loanid INT PRIMARY KEY,
    bookid INT,
    memberid INT,
    loaddate DATE,
    returndate DATE,
    duedate DATE,
    FOREIGN KEY (bookid) REFERENCES books(bookid),
    FOREIGN KEY (memberid) REFERENCES members(memberid)
);

CREATE TABLE members (
    memberid INT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    membershipdate DATE,
    email VARCHAR(255),
    phone_no VARCHAR(20),
    birthdate DATE,
    nationality VARCHAR(255)
);

CREATE TABLE authors (
    authorid INT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    birthdate DATE,
    nationality VARCHAR(255)
);

CREATE TABLE category (
    categoryid INT PRIMARY KEY,
    categoryname VARCHAR(255),
    description TEXT
);
