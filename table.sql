CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    Email VARCHAR(30) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(50),
    City VARCHAR(20) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL,
    Country VARCHAR(20) NOT NULL
);

CREATE TABLE Suppliers (
    SupplierID SERIAL PRIMARY KEY,
    SupplierName VARCHAR(25) NOT NULL,
    ContactName VARCHAR(25) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(30) UNIQUE NOT NULL,
    Address VARCHAR(30),
    City VARCHAR(20) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL,
    Country VARCHAR(20) NOT NULL
);

CREATE TABLE Categories (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(25) NOT NULL,
    Description TEXT
);

CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(30) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    SupplierID INT REFERENCES Suppliers(SupplierID) NOT NULL,
    CategoryID INT REFERENCES Categories(CategoryID) NOT NULL
);

CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CustomerID INT REFERENCES Customers(CustomerID) NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE OrderDetails (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INT REFERENCES Orders(OrderID) NOT NULL,
    ProductID INT REFERENCES Products(ProductID) NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Payments (
    PaymentID SERIAL PRIMARY KEY,
    OrderID INT REFERENCES Orders(OrderID) NOT NULL,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(25) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    Email VARCHAR(30) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    HireDate DATE NOT NULL,
    JobTitle VARCHAR(30) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Department VARCHAR(20) NOT NULL
);

