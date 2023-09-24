
USE FlokemonStore
GO

-- 1
SELECT
CustomerName,
StaffName,
COUNT (std.SalesID) AS [Total Transaction]
FROM SalesTransaction st
JOIN MsCustomer mc
ON st.CustomerID = mc.CustomerID
JOIN MsStaff mst
ON st.StaffID = mst.StaffID
JOIN SalesTransactionDetail std
ON st.SalesID = std.SalesID
WHERE CustomerName LIKE '%a%' AND
YEAR(SalesDate) = 2020
GROUP BY CustomerName, StaffName


-- 2
SELECT
FlokemonName,
FlokemonTypeName,
SUM(ptd.FlokemonQuantity) AS [Total Purchased Flokemon]
FROM MsFlokemon mf
JOIN MsFlokemonType mft
ON mf.FlokemonTypeID = mft.FlokemonTypeID
JOIN PurchaseTransactionDetail ptd
ON mf.FlokemonID = ptd.FlokemonID
WHERE LEN(FlokemonName) > 5 AND
FlokemonTypeName LIKE '%a%'
GROUP BY FlokemonName, FlokemonTypeName

--3
SELECT
FlokemonTypeName,
[Average Price] = CONCAT('Rp. ', AVG(FlokemonPrice)),
[Total Sales Flokemon] = SUM(FlokemonQuantity)
FROM MsFlokemon mf
JOIN MsFlokemonType mft
ON mf.FlokemonTypeID = mft.FlokemonTypeID
JOIN SalesTransactionDetail std 
ON mf.FlokemonID = std.FlokemonID
WHERE FlokemonTypeName LIKE 'p%' AND FlokemonDamage > 1000
GROUP BY FlokemonTypeName
ORDER BY SUM(FlokemonQuantity) ASC

--4
SELECT
CustomerName,
[Total Transaction] = COUNT(DISTINCT(std.FlokemonID)),
[Total Flokemon Bought] = COUNT(st.SalesID)
FROM MsCustomer mc
JOIN SalesTransaction st 
ON mc.CustomerID = st.CustomerID
JOIN SalesTransactionDetail std
ON st.SalesID = std.SalesID
WHERE MONTH(SalesDate) = 10 AND CustomerName LIKE '%a%'
GROUP BY CustomerName
HAVING SUM(std.FlokemonQuantity) > 10

--5
SELECT
SalesID,
CustomerName,
StaffName,
[Transaction Day] = DATENAME(WEEKDAY,SalesDate)
FROM SalesTransaction st
JOIN MsCustomer mc 
ON st.CustomerID = mc.CustomerID
JOIN MsStaff mst
ON st.StaffID = mst.StaffID,(
SELECT
[AverageSalary] = AVG(mst.StaffSalary)
FROM MsStaff mst
) AS x
WHERE StaffSalary > x.AverageSalary AND
MONTH(SalesDate) = 2

-- 6
SELECT
[StaffName] = UPPER(StaffName),
FlokemonName,
[Transaction Year] = DATENAME(YEAR, PurchaseDate)
FROM PurchaseTransaction pt
JOIN MsStaff mst
ON pt.StaffID = mst.StaffID
JOIN 
PurchaseTransactionDetail ptd 
ON pt.PurchaseID = ptd.PurchaseID
JOIN MsFlokemon mf 
ON ptd.FlokemonID = mf.FlokemonID
,(
SELECT 
[AverageQty2018] = AVG(FlokemonQuantity)
FROM PurchaseTransaction pt
JOIN PurchaseTransactionDetail ptd
ON pt.PurchaseID = ptd.PurchaseID
WHERE YEAR(PurchaseDate) = 2018
) AS x
WHERE StaffName LIKE '%s%' AND
YEAR(PurchaseDate) = 2018 AND
FlokemonQuantity > x.AverageQty2018


-- 7
SELECT
[Transaction Date] = SalesDate,
[Max Flokemon Sales] = CONCAT(x.max , ' Flokemon') 
FROM SalesTransaction st
JOIN MsStaff mst
ON st.StaffID = mst.StaffID
JOIN SalesTransactionDetail std
ON st.SalesID = std.SalesID
, (
SELECT
[max] = MAX(std.FlokemonQuantity)
FROM SalesTransaction st
JOIN SalesTransactionDetail std
ON st.SalesID = std.SalesID
WHERE MONTH(SalesDate) BETWEEN 7 AND 12 AND
YEAR(SalesDate) = 2020
GROUP BY SalesDate
)x
WHERE MONTH(SalesDate) BETWEEN 7 AND 12 
AND
YEAR(SalesDate) = 2020 
AND FlokemonQuantity = x.max AND
StaffName LIKE '%s%'

--8
SELECT
[Transaction Date] = PurchaseDate,
[Max Flokemon Purchase] = CONCAT(x.max , ' Flokemon') 
FROM PurchaseTransaction pt
JOIN MsStaff mst 
ON pt.StaffID = mst.StaffID
JOIN PurchaseTransactionDetail ptd
ON pt.PurchaseID = ptd.PurchaseID
, (
SELECT
[max] = MAX(ptd.FlokemonQuantity)
FROM PurchaseTransaction pt
JOIN PurchaseTransactionDetail ptd
ON pt.PurchaseID = ptd.PurchaseID
WHERE MONTH(PurchaseDate) BETWEEN 1 AND 10 AND
YEAR(PurchaseDate) = 2018
GROUP BY PurchaseDate
)x
WHERE MONTH(PurchaseDate) BETWEEN 1 AND 10 
AND
YEAR(PurchaseDate) = 2018
AND FlokemonQuantity = x.max 
AND StaffName LIKE '%o%'

--9
CREATE VIEW [PurchaseView]
AS
SELECT
SupplierName,
[Supplier Phone] = STUFF(SupplierPhoneNumber, 1,1, '+62'),
[Total Transaction] = COUNT(DISTINCT(ptd.FlokemonID)),
[Total Flokemon Bought] = COUNT(pt.PurchaseID)
FROM MsSupplier msu 
JOIN PurchaseTransaction pt 
ON msu.SupplierID = pt.SupplierID
JOIN PurchaseTransactionDetail ptd 
ON pt.PurchaseID = ptd.PurchaseID
WHERE LEN(SupplierName) < 15
GROUP BY SupplierName, SupplierPhoneNumber
HAVING COUNT(pt.SupplierID) BETWEEN 1 AND 5



--10.
CREATE VIEW [StaffSalesView]
AS
SELECT
StaffName,
[Total Transaction] = COUNT(DISTINCT(std.FlokemonID)),
[Total Flokemon Sold] = COUNT(st.SalesID)
FROM SalesTransaction st
JOIN MsStaff mst
ON st.StaffID = mst.StaffID
JOIN SalesTransactionDetail std 
ON st.SalesID = std.SalesID 
WHERE std.FlokemonQuantity > 10 AND LEN(StaffName) < 15
GROUP BY StaffName
