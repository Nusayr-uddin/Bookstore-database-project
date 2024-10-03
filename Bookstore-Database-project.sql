CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    price DECIMAL(10, 2) NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
INSERT INTO authors (name, bio) VALUES
('J.K. Rowling', 'British author, best known for the Harry Potter series.'),
('George R.R. Martin', 'American novelist and short story writer, known for A Song of Ice and Fire.'),
('Agatha Christie', 'English writer known for her detective novels.');

INSERT INTO books (title, author_id, price, publication_date) VALUES
('Harry Potter and the Sorcerer\'s Stone', 1, 19.99, '1997-06-26'),
('A Game of Thrones', 2, 24.99, '1996-08-06'),
('Murder on the Orient Express', 3, 12.99, '1934-01-01');

INSERT INTO sales (book_id, sale_date, quantity) VALUES
(1, '2024-01-15', 3),
(2, '2024-01-20', 1),
(3, '2024-02-05', 2);

SELECT b.title, a.name AS author, b.price 
FROM books b
JOIN authors a ON b.author_id = a.author_id;

SELECT b.title, SUM(s.quantity) AS total_sold 
FROM books b
JOIN sales s ON b.book_id = s.book_id
GROUP BY b.title;

DROP DATABASE bookstore;











