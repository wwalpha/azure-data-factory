USE [AdventureWorks2012]
GO
/****** Object:  Schema [Production]    Script Date: 11/10/2022 10:37:53 PM ******/
CREATE SCHEMA [Production]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to products, inventory, and manufacturing.' , @level0type=N'SCHEMA',@level0name=N'Production'
GO
