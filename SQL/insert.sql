
USE FlokemonStore
GO

-- MsCustomer 
INSERT INTO MsCustomer VALUES
('CU001', 'Brad Turner', '0855789345', 'Male', 'bradturner@gmail.com'),
('CU002', 'Michael Williams', '0812445789', 'Male', 'michaelwilliams@hotmail.com'),
('CU003', 'Bobby Lee', '0896776777', 'Male', 'bobbylee@yahoo.com'),
('CU004', 'Chad Jones', '0895111777', 'Male', 'chadjones@gmail.com'),
('CU005', 'Robert Faye', '0880556770', 'Male', 'robertfaye@yahoo.com'),
('CU006', 'Tiffany Long', '0854332115', 'Female', 'tiffanylong@hotmail.com'),
('CU007', 'Jane Liana', '0897246135', 'Female', 'janeliana@yahoo.com'),
('CU008', 'Mary Wayne', '0822987654', 'Female', 'marywayne@gmail.com'),
('CU009', 'Julia Smith', '0855374743', 'Female', 'juliasmith@gmail.com'),
('CU010', 'Karen Johnson', '0810224668', 'Female', 'karenjohnson@yahoo.com')

-- MsStaff
INSERT INTO MsStaff VALUES
('ST001' , 'Lily James', 'lilyjames@gmail.com', '089767854378', 'Female', '2500000'),
('ST002', 'Arthur Jones', 'arthurj@gmail.com', '087987654532', 'Male', '2550000'),
('ST003', 'Jesse Adrian', 'jesseadrian@yahoo.com', '081353267885', 'Male', '2800000'),
('ST004', 'Olivia Jules', 'oliviajules@hotmail.com', '08554322213', 'Female', '2500000'),
('ST005', 'Karen Stephan', 'karensteph@gmail.com', '081167665462', 'Female', '3000000'),
('ST006', 'Timothy Jonas', 'timothyjo@hotmail.com', '089912321234', 'Male', '2600000'),
('ST007', 'Tom Junior', 'tomjunior@yahoo.com', '081345890771', 'Male', '3200000'),
('ST008', 'Billy Fletcher', 'billyfletcher@gmail.com', '087789875552', 'Male', '2300000'),
('ST009', 'Caroline June', 'carolinejune@gmail.com', '081055548922', 'Female', '3000000'),
('ST010', 'Bob Byers', 'bobbyers@yahoo.com', '081122654337', 'Male', '2400000')


-- MsSupplier
INSERT INTO MsSupplier VALUES
('SU001', 'Adam Wijaya', 'adamwijaya@gmail.com', '087771263921'),
('SU002', 'Ben Kitani', 'benkitani@gmail.com', '081273892230'),
('SU003', 'Charles Yos', 'charlesyos@gmail.com', '081827011528'),
('SU004', 'Agnes Hillary', 'agneshillary@gmail.com', '087716638202'),
('SU005', 'Hengky Sharkiba', 'hengkysharkiba@gmail.com', '08127035145'),
('SU006', 'Michael Andrian', 'michaelandrian@gmail.com', '087715374829'),
('SU007', 'Andrew Jastinus', 'andrewjastinus@gmail.com', '081273926178'),
('SU008', 'John Sierra', 'johnsierra@gmail.com', '0877718273462'),
('SU009', 'Michelle Atria', 'michelleatria@gmail.com', '081262739511'),
('SU010', 'Reinhart Bicardo', 'reinhartbicardo@gmail.com', '087716228570')

-- MsFlokemonType
INSERT INTO MsFlokemonType VALUES
('FT001','Fire'),
('FT002','Water'),
('FT003','Grass'),
('FT004','Electric'),
('FT005','Ice'),
('FT006','Ground'),
('FT007','Rock'),
('FT008','Steel'),
('FT009','Poison'),
('FT010','Dark')

-- MsFlokemon
INSERT INTO MsFlokemon VALUES 
('FL001', 'FT001','Arcanine', 203, 19000, 30),
('FL002', 'FT002','Blastoise', 1100, 82000, 50),
('FL003', 'FT003','Bulbasaur', 312, 21000, 60),
('FL004', 'FT004','Ampharos', 505, 46000, 35),
('FL005', 'FT005','Beartic', 462, 36000, 40),
('FL006', 'FT006','Sandslash', 630, 57000, 100),
('FL007', 'FT007','Lycanroc', 1293, 94000, 65),
('FL008', 'FT008','Jirachi', 783, 68000, 45),
('FL009', 'FT009','Vileplume', 1001, 74000, 55),
('FL010', 'FT010','Umbreon', 579, 50000, 70)

-- PurchaseTransaction
INSERT PurchaseTransaction VALUES 
('PU001', 'SU001','ST001', '2018-10-14'),
('PU002', 'SU002','ST002', '2018-02-28'),
('PU003', 'SU003','ST003', '2018-03-30'),
('PU004', 'SU004','ST004', '2019-04-13'),
('PU005', 'SU005','ST005', '2019-05-04'),
('PU006', 'SU006','ST006', '2019-06-18'),
('PU007', 'SU007','ST007', '2020-07-26'),
('PU008', 'SU008','ST008', '2020-08-07'),
('PU009', 'SU009','ST009', '2020-10-20'),
('PU010', 'SU010','ST010', '2020-10-19'),
('PU011', 'SU001','ST001', '2021-10-21'),
('PU012', 'SU002','ST002', '2021-11-05'),
('PU013', 'SU003','ST003', '2022-01-12'),
('PU014', 'SU004','ST004', '2022-02-01'),
('PU015', 'SU005','ST005', '2022-04-11')

-- PurchaseTransactionDetail
INSERT INTO PurchaseTransactionDetail VALUES
('PU001', 'FL001', '3'),
('PU001', 'FL002', '5'),
('PU001', 'FL003', '11'),
('PU002', 'FL004', '4'), 
('PU002', 'FL005', '2'),
('PU002', 'FL006', '7'),
('PU003', 'FL007', '10'),
('PU003', 'FL008', '2'),
('PU004', 'FL009', '3'),
('PU004', 'FL010', '5'),
('PU005', 'FL001', '2'),
('PU006', 'FL002', '3'),
('PU007', 'FL003', '9'), 
('PU008', 'FL004', '2'),
('PU009', 'FL005', '5'),
('PU009', 'FL006', '12'), 
('PU010', 'FL007', '5'),
('PU010', 'FL008', '3'),
('PU011', 'FL009', '10'), 
('PU011', 'FL010', '13'),
('PU012', 'FL001', '4'),
('PU012', 'FL002', '7'),
('PU013', 'FL003', '11'),
('PU014', 'FL004', '2'),
('PU015', 'FL005', '12')

-- SalesTransaction
INSERT INTO SalesTransaction VALUES
('SA001', 'ST008', 'CU010', '2018-01-05'),
('SA002', 'ST005', 'CU001', '2018-10-24'),
('SA003', 'ST010', 'CU005', '2018-03-15'),
('SA004', 'ST001', 'CU002', '2019-10-19'),
('SA005', 'ST009', 'CU009', '2019-10-30'),
('SA006', 'ST002', 'CU007', '2019-08-13'),
('SA007', 'ST004', 'CU003', '2020-09-27'),
('SA008', 'ST006', 'CU006', '2020-10-17'),
('SA009', 'ST003', 'CU004', '2020-11-23'),
('SA010', 'ST007', 'CU008', '2020-12-12'),
('SA011', 'ST007', 'CU001', '2021-01-05'),
('SA012', 'ST005', 'CU005', '2021-02-24'),
('SA013', 'ST003', 'CU008', '2021-03-15'),
('SA014', 'ST010', 'CU009', '2022-04-19'),
('SA015', 'ST006', 'CU002', '2022-05-30')


-- SalesTransactionDetail
INSERT INTO SalesTransactionDetail VALUES
('SA001', 'FL001', '3'),
('SA001', 'FL005', '8'),
('SA002', 'FL003', '5'),
('SA002', 'FL009', '12'),
('SA003', 'FL007', '7'),
('SA003', 'FL001', '2'),
('SA004', 'FL006', '11'),
('SA005', 'FL002', '9'),
('SA005', 'FL001', '15'),
('SA006', 'FL003', '6'),
('SA007', 'FL004', '9'),
('SA007', 'FL008', '8'),
('SA008', 'FL010', '2'), 
('SA008', 'FL005', '3'),
('SA009', 'FL002', '4'),
('SA009', 'FL008', '6'),
('SA010', 'FL006', '7'), 
('SA010', 'FL009', '1'),
('SA011', 'FL005', '2'),
('SA011', 'FL008', '10'),
('SA012', 'FL003', '8'),
('SA012', 'FL009', '3'),
('SA013', 'FL004', '7'),
('SA014', 'FL010', '5'),
('SA015', 'FL007', '3')
