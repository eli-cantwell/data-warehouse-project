/*
Create DB and Schemas

Script Purpose:
    This script checks if there are any Databases named DataWarehouse, deletes it if it does,
    and then creates an empty database called DataWarehouse, then creates three schemas (Broze, Silver, Gold).

WARNING:
    This script will delete any databases named DataWarehouse if they already exist.
*/


-- Connect to master
USE master;
GO

-- Check if a Database named DataWarehouse already exists, then drop it.
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create a database named 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

-- Connect to DataWarehouse
USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
