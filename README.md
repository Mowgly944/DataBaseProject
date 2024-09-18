# Final Project

## Documentation of the Database

**Done by**: Ilan YAKOUBI  
**Completed on**: 19/09/2024

---

## Summary

- [Introduction](#introduction)
- [Database Structure](#database-structure)
- [Relationships](#relationships)
- [SQL Code](#sql-code)

---

## Introduction

Welcome to the documentation for our online supermarket database, designed to support a comprehensive e-commerce platform for grocery shopping. This database is the central repository for all data related to our online store, managing information for customers, products, orders, payments, and more.

In this documentation, we will explore the structure of our database, examining the various tables, relationships, and constraints that ensure data consistency and integrity. We will also delve into the SQL code used to create the database, providing a detailed breakdown of each table and its components.

---

## Database Structure

### Customers who purchase products on the site:
- **CustomerID** (Primary Key): Unique identifier for each customer
- **FirstName**: Customer's first name
- **LastName**: Customer's last name
- **Email** (Unique): Customer's email address
- **Phone**: Customer's phone number
- **Address**: Customer's address
- **City**: Customer's city
- **PostalCode**: Customer's postal code
- **Country**: Customer's country

### Suppliers who supply the products sold by the site:
- **SupplierID** (Primary Key): Unique identifier for each supplier
- **SupplierName**: Supplier's name
- **ContactName**: Supplier's contact name
- **Phone**: Supplier's phone number
- **Email** (Unique): Supplier's email address
- **Address**: Supplier's address
- **City**: Supplier's city
- **PostalCode**: Supplier's postal code
- **Country**: Supplier's country

### Categories in which products are classified:
- **CategoryID** (Primary Key): Unique identifier for each category
- **CategoryName**: Category name
- **Description**: Category description

### Products sold on the site:
- **ProductID** (Primary Key): Unique identifier for each product
- **ProductName**: Product name
- **Description**: Product description
- **Price**: Product price
- **StockQuantity**: Product stock quantity
- **SupplierID** (Foreign Key): References the Suppliers table
- **CategoryID** (Foreign Key): References the Categories table

### Orders placed by customers:
- **OrderID** (Primary Key): Unique identifier for each order
- **OrderDate**: Order date
- **CustomerID** (Foreign Key): References the Customers table
- **TotalAmount**: Total order amount

### Details of each order:
- **OrderDetailID** (Primary Key): Unique identifier for each order detail
- **OrderID** (Foreign Key): References the Orders table
- **ProductID** (Foreign Key): References the Products table
- **Quantity**: Order quantity
- **Price**: Order price

### Payments made by customers for their orders:
- **PaymentID** (Primary Key): Unique identifier for each payment
- **OrderID** (Foreign Key): References the Orders table
- **PaymentDate**: Payment date
- **PaymentAmount**: Payment amount
- **PaymentMethod**: Payment method

### Employees who manage the site and orders:
- **EmployeeID** (Primary Key): Unique identifier for each employee
- **FirstName**: Employee's first name
- **LastName**: Employee's last name
- **Email** (Unique): Employee's email address
- **Phone**: Employee's phone number
- **HireDate**: Employee's hire date
- **JobTitle**: Employee's job title
- **Salary**: Employee's salary
- **Department**: Employee's department

---


## Relationships

### One-to-Many (1:N) Relationships:
- A customer can have many orders (one customer, many orders): **Customers -> Orders (CustomerID)**
- A supplier can provide many products (one supplier, many products): **Suppliers -> Products (SupplierID)**
- A category can have many products (one category, many products): **Categories -> Products (CategoryID)**
- An order can have many order details (one order, many order details): **Orders -> OrderDetails (OrderID)**
- An employee can manage many orders (one employee, many orders): **Employees -> Orders (EmployeeID)**

### Many-to-Many (M:N) Relationships:
- A product can be part of many orders, and an order can have many products (many products, many orders): **Products -> OrderDetails -> Orders (ProductID, OrderID)**
- A supplier can provide products to many categories, and a category can have products from many suppliers (many suppliers, many categories): **Suppliers -> Products -> Categories (SupplierID, CategoryID)**




![Capture d’écran 2024-09-16 194653](https://github.com/user-attachments/assets/0f371dd6-32b2-46a3-840b-ceb1450504b8)






---

## SQL Code

In this section, I will explain the key SQL commands and code used to create and manipulate the database. When there is new syntax, I will provide an explanation.

### Creating the `Customers` Table:
```sql
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(100),
    City VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL,
    Country VARCHAR(50) NOT NULL
);
```

- **CREATE TABLE**: Instruction to create a new table.
- **Customers**: Name of the table.
- **CustomerID SERIAL PRIMARY KEY**: Column that stores each customer’s unique identifier (SERIAL is a data type that automatically generates a sequential number for each new entry).
- **VARCHAR(50)** and **VARCHAR(100)**: Specifies the maximum string length for each column. **NOT NULL** indicates that these columns cannot be empty.
- **UNIQUE**: Constraint that ensures the email address is unique for each customer.



```sql
CREATE TABLE Suppliers (
    SupplierID SERIAL PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(150) UNIQUE NOT NULL,
    Address VARCHAR(100),
    City VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL,
    Country VARCHAR(50) NOT NULL
);
```
The structure of this table is similar to that of the Clients table

```sql
CREATE TABLE Categories (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Description TEXT
);
```
TEXT: type of data that allows to store texts of variable length

```sql
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(200) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    SupplierID INT REFERENCES Suppliers(SupplierID) NOT NULL,
    CategoryID INT REFERENCES Categories(CategoryID) NOT NULL
);
```
DECIMAL(10, 2): Data type that allows to store decimal numbers with an accuracy of 10 digits and 2 digits after the comma
REFERENCES: constraint that ensures the SupplierID or CategoryID column exists in the Suppliers or Categories table, respectively


```sql
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CustomerID INT REFERENCES Customers(CustomerID) NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL
);
```
TIMESTAMP: type of data that allows to store dates and times
DEFAULT CURRENT_TIMESTAMP: The default value is the current date and time

The remaining tables are of the same structure as the others.

---

Here is an example of data insertion, it’s always the same operation in this case so I won’t do all :


```sql
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, PostalCode, Country)
VALUES ('Alice', 'Dupont', 'alice.dupont@example.com', '0123456789', '10 Rue de Paris', 'Paris', '75001', 'France'),
       ('Bob', 'Martin', 'bob.martin@example.com', '0987654321', '22 Avenue des Champs', 'Lyon', '69002', 'France');
```


## Five Important SQL Queries

1. **Retrieve orders placed by a specific customer**
   ```sql
   SELECT o.OrderID, o.OrderDate, o.TotalAmount
   FROM Orders o
   JOIN Customers c ON o.CustomerID = c.CustomerID
   WHERE c.Email = 'alice.dupont@example.com';
    ```

### List products with their suppliers
```sql
SELECT p.ProductName, s.SupplierName, p.Price, p.StockQuantity
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID;
```

### View order details with products and quantities
```sql
SELECT o.OrderID, p.ProductName, od.Quantity, od.Price
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderID = 1;
```
### List products from a specific category
```sql
SELECT ProductName, Price, StockQuantity
FROM Products
WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Fruits');
```

### Collect customers who have placed orders over €5
```sql
SELECT c.FirstName, c.LastName, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > 5;
```


































