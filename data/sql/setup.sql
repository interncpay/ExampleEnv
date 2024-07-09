-- setup.sql
USE [master]
GO
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Project')
BEGIN
    CREATE DATABASE [Project]
END
GO

USE [Project]
GO
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Names')
BEGIN
    CREATE TABLE Names (
        ID INT PRIMARY KEY IDENTITY(1,1),
        Name NVARCHAR(100) NOT NULL
    );
END
GO
