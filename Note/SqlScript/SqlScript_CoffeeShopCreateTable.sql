CREATE DATABASE CoffeeShop
GO
--===============================================================================================
USE CoffeeShop
GO
--===============================================================================================
CREATE TABLE CFS_TABLE
(
	Id INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(100) NOT NULL DEFAULT N'Unknow',
	[Status] NVARCHAR(100) NOT NULL DEFAULT N'Empty'	-- Empty || Booked
)
GO
--===============================================================================================
CREATE TABLE CFS_ACCOUNT
(
	Username NVARCHAR(100) PRIMARY KEY,	
	DisplayName NVARCHAR(100) NOT NULL,
	[Password] NVARCHAR(1000) NOT NULL,
	UserRole INT NOT NULL -- 1: admin || 0: staff
)
GO
--===============================================================================================
CREATE TABLE CFS_CATEGORY
(
	Id INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(100) NOT NULL DEFAULT N'Unknow'
)
GO
--===============================================================================================
CREATE TABLE CFS_FOOD
(
	Id INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(100) NOT NULL DEFAULT N'Unknow',
	IdCategory INT NOT NULL,
	Price DECIMAL(18,2) NOT NULL DEFAULT 0
	
	FOREIGN KEY (IdCategory) REFERENCES dbo.CFS_CATEGORY(Id)
)
GO
--===============================================================================================
CREATE TABLE CFS_BILL
(
	Id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATETIME NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATETIME,
	IdTable INT NOT NULL,
	[Status] INT NOT NULL DEFAULT 0 -- 1: Paid && 0: Unpaid
	
	FOREIGN KEY (idTable) REFERENCES dbo.CFS_TABLE(Id)
)
GO
--===============================================================================================
CREATE TABLE CFS_BILL_INFO
(
	Id INT IDENTITY PRIMARY KEY,
	IdBill INT NOT NULL,
	IdFood INT NOT NULL,
	[Count] INT NOT NULL DEFAULT 0
	
	FOREIGN KEY (IdBill) REFERENCES dbo.CFS_BILL(Id),
	FOREIGN KEY (IdFood) REFERENCES dbo.CFS_FOOD(Id)
)
GO
--===============================================================================================
INSERT INTO CFS_ACCOUNT (Username, DisplayName, [Password], UserRole)
VALUES ('duynguyen', 'Nguyen Anh Duy', '12345', 1)
--===============================================================================================
DECLARE @i INT = 1

WHILE @i <= 10
BEGIN
	INSERT dbo.CFS_TABLE (Name)VALUES  ( N'Table ' + CAST(@i AS nvarchar(100)))
	SET @i = @i + 1
END
GO
--===============================================================================================
INSERT INTO CFS_CATEGORY (Name) VALUES('Seafood')
INSERT INTO CFS_CATEGORY (Name) VALUES('Food')
--===============================================================================================
INSERT INTO CFS_FOOD (Name, IdCategory, Price) VALUES ('Octopus', 1, 100000)
INSERT INTO CFS_FOOD (Name, IdCategory, Price) VALUES ('Squid', 1, 200000)
INSERT INTO CFS_FOOD (Name, IdCategory, Price) VALUES ('Crab', 1, 300000)
INSERT INTO CFS_FOOD (Name, IdCategory, Price) VALUES ('Hamburger', 2, 50000)
INSERT INTO CFS_FOOD (Name, IdCategory, Price) VALUES ('Meat', 2, 120000)