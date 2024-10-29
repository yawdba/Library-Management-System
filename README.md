# Library Management System

> A simple database project to manage library operations, including member details, book inventory, and borrowing records.

## About

This project is a SQL-based library management system designed to manage essential library functions such as tracking members, books, and borrow/return transactions. It uses Oracle SQL for data storage and operations, providing queries for finding books, viewing borrowing records, and generating reports.

## Database Structure

The project includes three primary tables:

1. **Members** - Stores information about library members.
2. **Books** - Contains details of books available in the library.
3. **Borrowings** - Records information about books borrowed by members, including dates borrowed and returned.

## Features

- **Find Books by Title or Author**: Query to search for a book based on title or author.
- **Track Borrowed Books**: Query to check which books are currently borrowed by a specific member.
- **View Latest Borrowing Activity**: Query to find the last book borrowed or returned by a member.
- **Generate Reports**: Comprehensive query to generate reports containing customer details, book info, and borrowing history.

## Getting Started

### Prerequisites

- Oracle SQL.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/library-management.git
