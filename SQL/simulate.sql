
USE FlokemonStore
GO

-- SALES TRANSACTION PROCESS --

-- First --
-- Customers would come into the shop and look at all the flokemons that are available in the shop

SELECT
mf.FlokemonName, mft.FlokemonTypeName, mf.FlokemonDamage, mf.FlokemonPrice
FROM MsFlokemon mf
JOIN MsFlokemonType mft ON mf.FlokemonTypeID = mft.FlokemonTypeID
ORDER BY FlokemonDamage DESC

-- Second --
-- If customers have found a Flokemon that they want, then the shop will then carry out the process of sale.
-- Customers are asked some their personal data by the staff, this includes name, phone number, gender, email.
-- However, if customers did not find what Flokemon they want, then they will leave the shop.
 
INSERT INTO MsCustomer VALUES
('CU011', 'John Charles', '08531117999', 'Male', 'johncharles@gmail.com')

--Third
-- Staff the staff enters the sales data 
-- including the sales id, staff id, customer id, and the sales date to fill in the the SalesTransaction table and 
-- some detail based on the sales id including flokemon id and the quantity of the products to fill in the SalesTransactionDetail table

INSERT INTO SalesTransaction VALUES
('SA016', 'ST004', 'CU011', '2022-06-02')

INSERT INTO SalesTransactionDetail VALUES
('SA016', 'FL001', '5')

-- Fourth
-- Staff bills the customer based on the order that customer made

SELECT DISTINCT
	st.SalesID,
	st.SalesDate,
	[Staff ID] =  StaffProfile.[Staff ID],
	[Staff Name] = StaffProfile.[Staff Name],
	[Customer ID] =  CustomerProfile.[Customer ID],
	[Customer Name] = CustomerProfile.[Customer Name],
	[CustomerProfile] = CustomerProfile.[Customer Number],
	[Flokemon ID] = FlokemonProfile.[Flokemon ID],
	[Flokemon Name] = FlokemonProfile.[Flokemon Name],
	[Flokemon Damage] = FlokemonProfile.[Flokemon Damage],
	FlokemonTypeProfile.[Flokemon Type],
	std.FlokemonQuantity,
	FlokemonProfile.[Flokemon Price],
	[Total Transaction] = FlokemonProfile.[Flokemon Price]*std.FlokemonQuantity

	FROM SalesTransaction st
	JOIN SalesTransactionDetail std 
	ON st.SalesID = std.SalesID
	JOIN MsCustomer mc 
	ON st.CustomerID = mc.CustomerID
	JOIN MsFlokemon mf 
	ON std.FlokemonID = mf.FlokemonID
	JOIN MsFlokemonType mft 
	ON mf.FlokemonTypeID = mft.FlokemonTypeID
	JOIN MsStaff mst
	ON st.StaffID = mst.StaffID, (

	SELECT 
	[Customer ID] = st.CustomerID,
	[Customer Name] = CustomerName,
	[Customer Number] = CustomerPhoneNumber
	FROM MsCustomer mc
	JOIN SalesTransaction st
	ON st.CustomerID = mc.CustomerID
	WHERE st.CustomerID = 'CU011'
	) CustomerProfile, (

	SELECT
	[Staff ID] = st.StaffID,
	[Staff Name] = StaffName
	FROM MsStaff mst
	JOIN SalesTransaction st
	ON mst.StaffID = st.StaffID
	WHERE st.StaffID = 'ST004'
	) StaffProfile ,(

	SELECT 
	[Flokemon ID] = std.FlokemonID,
	[Flokemon Name] = FlokemonName,
	[Flokemon Price] = FlokemonPrice,
	[Flokemon Damage] = FlokemonDamage
	
	FROM SalesTransaction st
	JOIN SalesTransactionDetail std
	ON st.SalesID = std.SalesID
	JOIN MsFlokemon mf
	ON std.FlokemonID = mf.FlokemonID
	JOIN MsFlokemonType mft
	ON mf.FlokemonTypeID = mft.FlokemonTypeID
	WHERE std.FlokemonID = 'FL001'
	) FlokemonProfile, (

	SELECT
	[Flokemon Type] = FlokemonTypeName
	FROM SalesTransaction st
	JOIN SalesTransactionDetail std
	ON st.SalesID = std.SalesID
	JOIN MsFlokemon mf
	ON std.FlokemonID = mf.FlokemonID
	JOIN MsFlokemonType mft
	ON mf.FlokemonTypeID = mft.FlokemonTypeID
	WHERE mf.FlokemonTypeID = 'FT001' 
	) FlokemonTypeProfile

	WHERE st.SalesID = 'SA016'

--Fifth
--Staff will update the Flokemon’s Stock in the MsFlokemon table

UPDATE MsFlokemon
SET FlokemonStock = FlokemonStock - AsSalesTransactionDetail.GetFlokemonQuantity
FROM MsFlokemon,
(
SELECT [GetFlokemonQuantity] = FlokemonQuantity
FROM SalesTransactionDetail std
WHERE std.SalesID = 'SA016'
) AsSalesTransactionDetail
WHERE FlokemonID = 'FL001'


-- PURCHASE TRANSACTION PROCESS --

-- First
-- Staff will check the availability of the Flokemon stock

	SELECT *
	FROM MsFlokemon
	ORDER BY FlokemonStock ASC

-- If there is no available flokemon stock, the staff will make an order to the supplier
-- Otherwise, staff won't make any order to the supplier

-- Second
-- Staff will check the list of suppliers

SELECT *
FROM MsSupplier

-- Supplier shows a list of their flokemon and specifications and
-- prices to staff (using supplier company database).

-- If there is a new supplier that offer flokemon
-- and staff decided want to buy the offered flokemon from this new supplier, 
-- the staff will enter supplier data into the FlokemonStore's database
-- such as Supplier ID, name, email, and phone number

INSERT INTO MsSupplier VALUES
('SU011', 'Kevin Tanjaya', 'kevintanjaya@gmail.com', '082992929123')

-- If staff decided to make an order to the old and registered supplier
-- Staff will skip this step and going through the step 3


-- Third
-- After that, the supplier bills the Flokemon Store by giving the invoice to the staff 

-- After that, the staff enters the required data 
-- into the purchase transaction and purchase transaction detail table 

-- for the purchase transaction table,
-- there is several data such as 
-- purchase id, 
-- supplier id, 
-- his/her staff id, and
-- purchase date

INSERT INTO PurchaseTransaction VALUES
('PU016', 'SU011','ST006', '2022-05-25')


-- and for the purchase transaction detail table, 
-- there are some additional data for purchase transaction table
-- such as
-- related purchase id,
-- flokemon id, and 
-- quantity of the purchased flokemon 

INSERT INTO PurchaseTransactionDetail VALUES
('PU016', 'FL005', '12')


-- Fourth
-- After that, the staff will add the new stock of flokemon into 
-- flokemon type table and flokemon table

-- If there is any new flokemon type,
-- the staff will make the new type by adding
-- new flokemon type id, and
-- new flokemon type name

INSERT INTO MsFlokemonType VALUES
('FT011','Magic')

-- if there is no new flokemon type,
-- staff will skip this step and just fill in the MsFlokemon (flokemon table)

-- and for the flokemon table, 
-- there are some additional data 
-- based on the flokemon type id
-- such as
-- flokemon id, 
-- related flokemon type id,
-- flokemon name,
-- flokemon damage,
-- flokemon price,
-- and flokemon stock

INSERT INTO MsFlokemon VALUES 
('FL011', 'FT011','Alakazam', 490, 38000, 45)


