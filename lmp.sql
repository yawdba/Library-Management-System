CREATE TABLE Members (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

INSERT ALL
INTO members VALUES (22, 'Olivia', 'Taylor', 'olivia.t@email.com', '111-222-3334')
INTO members VALUES (23, 'Daniel', 'Wilson', 'daniel.w@email.com', '444-555-6667')
INTO members VALUES (24, 'Sophie', 'Brown', 'sophie.b@email.com', '777-888-9998')
INTO members VALUES (25, 'Matthew', 'Martinez', 'matthew.m@email.com', '333-666-9997')
INTO members VALUES (26, 'Grace', 'Jones', 'grace.j@email.com', '111-555-9998')
INTO members VALUES (27, 'Logan', 'Hill', 'logan.h@email.com', '222-333-4445')
INTO members VALUES (28, 'Ava', 'Morgan', 'ava.m@email.com', '888-777-6667')
INTO members VALUES (29, 'William', 'Harrison', 'william.h@email.com', '999-888-7779')
INTO members VALUES (30, 'Zoe', 'Baker', 'zoe.b@email.com', '555-444-3335')
INTO members VALUES (31, 'Ethan', 'Fisher', 'ethan.f@email.com', '666-444-2223')
SELECT * FROM dual;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    AvailableCopies INT
);

INSERT ALL
INTO Books VALUES (101, 'The Great Gatsby', 'F. Scott Fitzgerald', 3)
INTO Books VALUES (102, 'To Kill a Mockingbird', 'Harper Lee', 2)
INTO Books VALUES (103, '1984', 'George Orwell', 5)
INTO Books VALUES (104, 'Pride and Prejudice', 'Jane Austen', 4)
INTO Books VALUES (105, 'The Catcher in the Rye', 'J.D. Salinger', 3)
INTO Books VALUES (106, 'The Hobbit', 'J.R.R. Tolkien', 2)
INTO Books VALUES (107, 'The Lord of the Rings', 'J.R.R. Tolkien', 1)
INTO Books VALUES (108, 'The Da Vinci Code', 'Dan Brown', 4)
INTO Books VALUES (109, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 3)
INTO Books VALUES (110, 'The Shining', 'Stephen King', 4)
SELECT * FROM dual;

CREATE TABLE Borrowings (
    BorrowingID INT PRIMARY KEY,
    CustomerID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Members(CustomerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT ALL
INTO Borrowings VALUES (3, 22, 101, TO_DATE('2024-01-12', 'YYYY-MM-DD'), TO_DATE('2024-01-25', 'YYYY-MM-DD'))
INTO Borrowings VALUES (4, 23, 102, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-28', 'YYYY-MM-DD'))
INTO Borrowings VALUES (5, 24, 103, TO_DATE('2024-01-20', 'YYYY-MM-DD'), NULL) -- Not returned yet
INTO Borrowings VALUES (6, 25, 104, TO_DATE('2024-01-22', 'YYYY-MM-DD'), NULL) -- Not returned yet
INTO Borrowings VALUES (7, 26, 105, TO_DATE('2024-01-25', 'YYYY-MM-DD'), NULL) -- Not returned yet
INTO Borrowings VALUES (8, 27, 106, TO_DATE('2024-01-28', 'YYYY-MM-DD'), NULL) -- Not returned yet
INTO Borrowings VALUES (9, 28, 107, TO_DATE('2024-01-30', 'YYYY-MM-DD'), NULL) -- Not returned yet
INTO Borrowings VALUES (10, 29, 108, TO_DATE('2024-02-02', 'YYYY-MM-DD'), NULL) -- Not returned yet
INTO Borrowings VALUES (11, 30, 109, TO_DATE('2024-02-05', 'YYYY-MM-DD'), NULL) -- Not returned yet
INTO Borrowings VALUES (12, 31, 110, TO_DATE('2024-02-08', 'YYYY-MM-DD'), NULL) -- Not returned yet
SELECT * FROM dual;


select * from members;
select * from books;
select * from borrowings;


-- Find a book by name or author
select * from books 
where title = 'The Hobbit'
or author = 'J.R.R. Tolkien';

-- Check the books borrowed by a particular person
select books.bookid, books.title, books.author, borrowings.borrowingid, borrowings.customerid, borrowings.borrowdate
from books, borrowings
where borrowings.bookid = books.bookid
and borrowings.customerid = 27;

-- Check last book borrowed or returned by a customer
select books.bookid, books.title, books.author, borrowings.borrowdate, borrowings.returndate
from books, borrowings
where borrowings.bookid = books.bookid
and borrowings.customerid = 22
order by borrowings.borrowdate desc, borrowings.returndate desc; 

-- A report that shows customer details, book name, author, book id, date issued and date returned
select members.customerid, members.firstname, members.lastname, members.email, members.phone,
books.bookid, books.title, books.author, borrowings.borrowdate, borrowings.returndate
from members, books, borrowings
where members.customerid = borrowings.customerid
and borrowings.bookid = books.bookid
order by members.customerid, borrowings.borrowdate;  



