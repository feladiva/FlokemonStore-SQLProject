
CREATE DATABASE FlokemonStore
GO
USE FlokemonStore
GO

CREATE TABLE MsCustomer (
	CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID like 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) CHECK (LEN(CustomerName) > 7),
	CustomerPhoneNumber VARCHAR(13) NOT NULL,
	CustomerGender VARCHAR(6) CHECK (CustomerGender IN('Male', 'Female')),
	CustomerEmail VARCHAR(50) CHECK (CustomerEmail like '%.com')
)

CREATE TABLE MsStaff( 
	StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'), 
	StaffName VARCHAR(50) CHECK(LEN(StaffName) > 7) NOT NULL, 
	StaffEmail VARCHAR(50) CHECK(StaffEmail LIKE '%.com') NOT NULL, 
	StaffPhoneNumber VARCHAR(13) NOT NULL, 
	StaffGender VARCHAR(6) NOT NULL, 
	StaffSalary INT NOT NULL 
) 

CREATE TABLE MsFlokemonType(
	FlokemonTypeID CHAR(5) PRIMARY KEY CHECK(FlokemonTypeID LIKE 'FT[0-9][0-9][0-9]'),
	FlokemonTypeName VARCHAR (50) NOT NULL
)

CREATE TABLE MsFlokemon(
	FlokemonID CHAR(5) PRIMARY KEY CHECK(FlokemonID LIKE 'FL[0-9][0-9][0-9]'), 
	FlokemonTypeID CHAR(5) FOREIGN KEY REFERENCES MsFlokemonType(FlokemonTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	FlokemonName VARCHAR(50) CHECK (LEN(FlokemonName) >5) NOT NULL,
	FlokemonDamage INT CHECK (FlokemonDamage >= 100),
	FlokemonPrice INT CHECK(FlokemonPrice >= 10000 AND FlokemonPrice <= 1000000),
	FlokemonStock INT NOT NULL
)

CREATE TABLE MsSupplier(
	SupplierID CHAR(5) PRIMARY KEY CHECK (SupplierID LIKE 'SU[0-9][0-9][0-9]'),
	SupplierName VARCHAR(50) CHECK (LEN(SupplierName) > 7) NOT NULL,
	SupplierEmail VARCHAR(50) CHECK(SupplierEmail LIKE '%.com') NOT NULL,
	SupplierPhoneNumber VARCHAR(13) NOT NULL
)

CREATE TABLE SalesTransaction(
	SalesID CHAR(5) PRIMARY KEY CHECK (SalesID LIKE 'SA[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID)ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesDate DATE CHECK(SalesDate <= GETDATE())
)

CREATE TABLE SalesTransactionDetail(
	SalesID CHAR(5) FOREIGN KEY REFERENCES SalesTransaction(SalesID)ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	FlokemonID CHAR(5) CHECK(FlokemonID LIKE 'FL[0-9][0-9][0-9]'),
	FlokemonQuantity INT CHECK(FlokemonQuantity >= 1),
	PRIMARY KEY(SalesID, FlokemonID)
)

CREATE TABLE PurchaseTransaction(
	PurchaseID CHAR(5) PRIMARY KEY CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
	SupplierID CHAR(5) FOREIGN KEY REFERENCES MsSupplier(SupplierID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseDate DATE CHECK(PurchaseDate <= GETDATE())
)


CREATE TABLE PurchaseTransactionDetail( 
	PurchaseID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransaction(PurchaseID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL , 
	FlokemonID CHAR(5) CHECK(FlokemonID LIKE 'FL[0-9][0-9][0-9]') ,  
	FlokemonQuantity INT CHECK(FlokemonQuantity >= 1), 
	PRIMARY KEY(PurchaseID, FlokemonID)
)
