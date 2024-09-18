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

-- books data set
INSERT INTO books (bookid, title, authorid, categoryid, yearpublished, copy_available)
VALUES
(1, 'The Great Gatsby', 1, 1, 1925, 5),
(2, 'To Kill a Mockingbird', 2, 2, 1960, 3),
(3, '1984', 3, 3, 1949, 2),
(4, 'Pride and Prejudice', 4, 1, 1813, 4),
(5, 'The Lord of the Rings', 5, 4, 1954, 6);

-- authos data set
INSERT INTO authors (authorid, firstname, lastname, birthdate, nationality)
VALUES
(1, 'F. Scott', 'Fitzgerald', '1896-09-24', 'American'),
(2, 'Harper', 'Lee', '1926-04-28', 'American'),
(3, 'George', 'Orwell', '1903-06-03', 'British'),
(4, 'Jane', 'Austen', '1775-12-16', 'British'),
(5, 'J.R.R.', 'Tolkien', '1892-01-03', 'British');

-- category data set
INSERT INTO category (categoryid, categoryname, description)
VALUES
(1, 'Fiction', 'Stories that are not factual'),
(2, 'Non-Fiction', 'Stories that are based on facts'),
(3, 'Science Fiction', 'Stories that explore speculative concepts'),
(4, 'Fantasy', 'Stories that involve magic and mythical creatures'),
(5, 'Mystery', 'Stories that involve solving crimes');

-- loans data set
INSERT INTO loans (loanid, bookid, memberid, loaddate, returndate, duedate)
VALUES
(1, 1, 1, '2023-10-01', '2023-10-15', '2023-10-10'),
(2, 2, 2, '2023-11-05', '2023-11-20', '2023-11-15'),
(3, 3, 3, '2023-12-08', '2023-12-25', '2023-12-20'),
(4, 4, 4, '2024-01-12', '2024-01-27', '2024-01-22'),
(5, 5, 5, '2024-02-15', '2024-03-02', '2024-02-25');

-- members data set
INSERT INTO members (memberid, firstname, lastname, membershipdate, email, phone_no)
VALUES
(1, 'John', 'Doe', '2023-01-01', 'johndoe@example.com', '1234567890'),
(2, 'Jane', 'Smith', '2023-02-02', 'janesmith@example.com', '9876543210'),
(3, 'Alice', 'Johnson', '2023-03-03', 'alicejohnson@example.com', '1112223333'),
(4, 'Bob', 'Williams', '2023-04-04', 'bobwilliams@example.com', '4445556666'),
(5, 'Charlie', 'Brown', '2023-05-05', 'charliebrown@example.com', '7778889999');

-- no.1 problem
SELECT b.title
FROM books b
JOIN authors a ON b.authorid = a.authorid
WHERE a.lastname = 'Lee';

-- no.2 problem
SELECT b.title, COUNT(l.loanid) AS loan_count
FROM books b
JOIN loans l ON b.bookid = l.bookid
GROUP BY b.title;

-- no.3 problem
SELECT m.firstname, m.lastname, b.title
FROM loans l
JOIN members m ON l.memberid = m.memberid
JOIN books b ON l.bookid = b.bookid
JOIN authors a ON b.authorid = a.authorid
WHERE a.lastname = 'Austen'
UNION
SELECT m.firstname, m.lastname, b.title
FROM loans l
JOIN members m ON l.memberid = m.memberid
JOIN books b ON l.bookid = b.bookid
JOIN authors a ON b.authorid = a.authorid
WHERE a.firstname = 'George';
