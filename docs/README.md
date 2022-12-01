
## Copy full datas with auto create table
1. Create source table dataset
2. Create target table dataset
3. Use copy action with auto create table
4. debug pipeline

## Copy full datas with column mapping
1. Create source table dataset and import schema
2. Create target table via SSMS
3. Create target table dataset and import schema
4. Use copy action, from source dataset to target dataset
5. debug pipeline

## Copy modified rows
1. Create source table dataset and import schema
2. Create target table dataset and import schema
3. Update rows
```
UPDATE [Person].[PersonPhone] SET PhoneNumber = '111-111-111', ModifiedDate = GETDATE() WHERE BusinessEntityID = 1;
UPDATE [Person].[PersonPhone] SET PhoneNumber = '222-222-222', ModifiedDate = GETDATE() WHERE BusinessEntityID = 2;
UPDATE [Person].[PersonPhone] SET PhoneNumber = '333-333-333', ModifiedDate = GETDATE() WHERE BusinessEntityID = 3;
UPDATE [Person].[PersonPhone] SET PhoneNumber = '444-444-444', ModifiedDate = GETDATE() WHERE BusinessEntityID = 4;
UPDATE [Person].[PersonPhone] SET PhoneNumber = '555-555-555', ModifiedDate = GETDATE() WHERE BusinessEntityID = 5;
```
4. Use copy action
5. source database use query
6. preview datas
7. debug pipeline
