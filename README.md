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
- [Entity-Relationship Diagram](#entity-relationship-diagram)

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

### Creating the `Suppliers` Table:

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




