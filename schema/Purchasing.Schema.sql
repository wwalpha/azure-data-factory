USE [AdventureWorks2012]
GO
/****** Object:  Schema [Purchasing]    Script Date: 11/10/2022 10:37:53 PM ******/
CREATE SCHEMA [Purchasing]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to vendors and purchase orders.' , @level0type=N'SCHEMA',@level0name=N'Purchasing'
GO
