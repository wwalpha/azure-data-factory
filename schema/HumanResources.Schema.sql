USE [AdventureWorks2012]
GO
/****** Object:  Schema [HumanResources]    Script Date: 11/10/2022 10:37:53 PM ******/
CREATE SCHEMA [HumanResources]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to employees and departments.' , @level0type=N'SCHEMA',@level0name=N'HumanResources'
GO
