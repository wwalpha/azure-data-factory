USE [AdventureWorks2012]
GO
/****** Object:  Schema [Sales]    Script Date: 11/10/2022 10:37:53 PM ******/
CREATE SCHEMA [Sales]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to customers, sales orders, and sales territories.' , @level0type=N'SCHEMA',@level0name=N'Sales'
GO
